from entities import models
from django.db.models import F, Q, Sum


def get_current_user(request_user, request_session):
    user_context = request_user
    user_session = request_session

    user_context.group = list(map(lambda row: row['name'], list(user_context.groups.values('name'))))
    user_context.application = user_session.application

    if user_context.application:

        user_context.application.client_id = user_session.client.id
        user_context.application.is_administrator = user_context.groups.filter(
                                                        application_id=user_context.application.id,
                                                        has_all_access=True
                                                    ).first() != None
        user_context.application.user_modules = []
        user_context.application.web_urls = []
        user_context.application.api_urls = []

        user_modules = models.Module.objects.filter(
                route_front__application__id=user_context.application.id,
            ).values(
                'code',
                'name',
                'icon'
            ).annotate(
                url=F('route_front__url'),
                parent=F('parent__code')
            )

        web_urls = models.RoutesFront.objects.filter(
                application_id=user_context.application.id
            ).values(
                'code',
                'url',
            )

        api_urls = models.RoutesBack.objects.filter(
                application_id=user_context.application.id
            ).values(
                'code',
                'method',
                'url'
            )

        if not user_context.application.is_administrator and not user_context.is_superuser:
            user_modules = user_modules.filter(
                route_front__permissions__groups__users__id=user_context.id
                )
            web_urls = web_urls.filter(
                permissions__groups__users__id=user_context.id
                )
            api_urls = api_urls.filter(
                permissions__groups__users__id=user_context.id
                )

        # includes missing parents
        # ...
        missing_parents = [] 
        for item in user_modules:
            if (item['parent'] and len(user_modules.filter(code=item['parent'])) <= 0 ):
                missing_parents.append(item['parent'])

        if len(missing_parents) > 0:
            missing_parents = list(set(missing_parents))
            new_parents = models.Module.objects.filter(code__in=missing_parents).values(
                    'code',
                    'name',
                    'icon'
                ).annotate(
                    url=F('route_front__url'),
                    parent=F('parent__code')
                )

            user_modules = user_modules.union(new_parents)

        user_context.application.user_modules = user_modules
        user_context.application.web_urls = web_urls
        user_context.application.api_urls = api_urls

    return user_context