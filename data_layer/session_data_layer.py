from entities import models
from django.db.models import F, Q, Sum


def get_current_user(request_user, request_session):
    
    user_context = request_user
    user_session = request_session

    user_context.group = list(map(lambda row: row['name'], list(user_context.groups.values('name'))))
    user_context.service = user_session.service

    if user_context.service:

        user_context.service.client_id = user_session.client.id
        user_context.service.is_administrator = user_context.groups.filter(
                                                        service_id=user_context.service.id,
                                                        has_all_access=True
                                                    ).first() != None
        # user_context.service.user_modules = []
        # user_context.service.web_urls = []
        # user_context.service.api_urls = []

        # user_modules = models.Module.objects.filter(
        #         service_route__service__id=user_context.service.id,
        #     ).values(
        #         'code',
        #         'name',
        #         'icon'
        #     ).annotate(
        #         url=F('service_route__url'),
        #         parent=F('parent__code')
        #     )

        # web_urls = models.RoutesFront.objects.filter(
        #         service_id=user_context.service.id
        #     ).values(
        #         'code',
        #         'url',
        #     )

        # api_urls = models.RoutesBack.objects.filter(
        #         service_id=user_context.service.id
        #     ).values(
        #         'code',
        #         'method',
        #         'url'
        #     )

        # if not user_context.service.is_administrator and not user_context.is_superuser:
        #     user_modules = user_modules.filter(
        #         service_route__permissions__groups__users__id=user_context.id
        #         )
        #     web_urls = web_urls.filter(
        #         permissions__groups__users__id=user_context.id
        #         )
        #     api_urls = api_urls.filter(
        #         permissions__groups__users__id=user_context.id
        #         )

        # # includes missing parents
        # # ...
        # missing_parents = [] 
        # for item in user_modules:
        #     if (item['parent'] and len(user_modules.filter(code=item['parent'])) <= 0 ):
        #         missing_parents.append(item['parent'])

        # if len(missing_parents) > 0:
        #     missing_parents = list(set(missing_parents))
        #     new_parents = models.Module.objects.filter(code__in=missing_parents).values(
        #             'code',
        #             'name',
        #             'icon'
        #         ).annotate(
        #             url=F('service_route__url'),
        #             parent=F('parent__code')
        #         )

        #     user_modules = user_modules.union(new_parents)

        # user_context.service.user_modules = user_modules
        # user_context.service.web_urls = web_urls
        # user_context.service.api_urls = api_urls

    return user_context