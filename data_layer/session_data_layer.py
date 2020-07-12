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
        # backend routes always allows superuser to access all resources,
        # no need to list it all.
        service_routes = []
        # Modules need to be loaded in frontend,
        # so we need to list them all.
        modules = models.Module.objects\
            .filter(
                service__clients__user_sessions__token=token)\
            .values(
                'code',
                'name',
                'icon',
                'parent__code',
                'route__url')
    else:
        service_routes = models.ServiceRoute.objects\
            .filter(
                service__clients__user_sessions__token=token,
                permissions__groups__users__id=request_user.id)\
            .values(
                'method',
                'url')
        modules = models.Module.objects\
            .filter(
                service__clients__user_sessions__token=token,
                groups__users__id=request_user.id)\
            .values(
                'code',
                'name',
                'icon',
                'parent__code',
                'route__url')
    
    return {
        "token": token,
        "modules": modules,
        "service_routes": service_routes}
