from entities import models
from django.db.models import F, Q, Sum


def get_current_user(request_user, request_session):
    user_context = request_user
    user_context.token = request_session.token
    user_context.group = list(map(lambda row: row['name'], list(user_context.groups.values('name'))))
    return user_context

def get_current_user_scope(request_user, request_session):
    token = request_session.token
    # modules = list(map(lambda row: row['name'] + "," + str(row['parent__name']),
    #                           list(models.Module.objects.filter(groups__users__id=request_user.id).values('name','parent__name'))))
    # service_routes = list(map(lambda row: '[' + row['method'] + ']' + row['url'],
    #                           list(models.ServiceRoute.objects.filter(permissions__groups__users__id=request_user.id).values('method','url'))))
    service_routes = models.ServiceRoute.objects.filter(permissions__groups__users__id=request_user.id).values('method','url')
    modules = models.Module.objects.filter(groups__users__id=request_user.id).values('name','parent__name','route__url')
    
    return {
        "token": token,
        "modules": modules,
        "service_routes": service_routes}
