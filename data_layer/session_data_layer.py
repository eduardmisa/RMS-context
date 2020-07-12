from entities import models
from django.db.models import F, Q, Sum


def get_current_user(request_user, request_session):
    user_context = request_user
    user_context.token = request_session.token
    user_context.group = list(map(lambda row: row['name'], list(user_context.groups.values('name'))))
    return user_context

def get_current_user_scope(request_user, request_session):
    token = request_session.token
    if request_user.is_superuser:
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
        "service_routes": service_routes}
