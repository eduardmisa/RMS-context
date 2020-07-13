from entities import models
from django.db.models import F, Q, Sum


def get_current_user(request_user, request_session):
    user_context = request_user
    user_context.token = request_session.token
    user_context.group = list(map(lambda row: row['name'], list(user_context.groups.values('name'))))
    return user_context

def get_current_user_scope(request_user, request_session):
    token = request_session.token
    is_admin = False
    try:
        is_admin = models.Group.objects\
            .filter(users__user_sessions__token=token)\
            .values('has_all_access')\
            .first()['has_all_access']
    except expression as identifier:
        pass
    if request_user.is_superuser or is_admin:
        service_routes = models.ServiceRoute.objects\
            .filter(
                service__clients__user_sessions__token=token)\
            .values(
                'method',
                'url')
    else:
        service_routes = models.ServiceRoute.objects\
            .filter(
                service__clients__user_sessions__token=token,
                permissions__groups__users__id=request_user.id)\
            .values(
                'method',
                'url')
    return {
        "token": token,
        "is_admin": is_admin,
        "service_routes": service_routes}
