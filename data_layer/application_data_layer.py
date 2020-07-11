from django.db import transaction
from entities import models

def easy_create(data, user):
    try:
        with transaction.atomic():

            db_app = models.Application()
            db_app.name = data['name']
            db_app.description = data['description']
            db_app.base_url = data['base_url']
            db_app.save()

            for item in data['routes_fronts']:
                db_route_front = models.RoutesFront()
                db_route_front.url = item['url']
                db_route_front.application = db_app
                db_route_front.save()

            for item in data['routes_backs']:
                db_route_back = models.RoutesBack()
                db_route_back.url = item['url']
                db_route_back.method = item['method']
                db_route_back.application = db_app
                db_route_back.save()

            for item in data['permissions']:
                db_permission = models.Permission()
                db_permission.name = item['name']
                db_permission.description = item['description']
                db_permission.save()

                for front_item in item['routes_fronts']:
                    existing_route_front = models.RoutesFront.objects.filter(
                        application_id=db_app.id,
                        url=front_item['url']).first()

                    db_permission.route_front.add(existing_route_front)

                for back_item in item['routes_backs']:
                    existing_route_back = models.RoutesBack.objects.filter(
                        application_id=db_app.id,
                        url=back_item['url']).first()

                    db_permission.route_back.add(existing_route_back)

            parent_mappings = []
            for item in data['modules']:
                db_module = models.Module()
                db_module.name = item['name']
                db_module.description = item['description']
                db_module.icon = item['icon']
                db_module.route_front = models.RoutesFront.objects.filter(
                    application_id=db_app.id,
                    url=item['routes_front']['url']).first()
                db_module.parent = None
                db_module.save()
                if item['parent']:
                    parent_mappings.append({
                        "module": db_module,
                        "parent": item['parent']
                        })

            for item in parent_mappings:
                current_db_module = item['module']
                current_parent_name = item['parent']

                existing_parent = models.Module.objects.filter(
                    route_front__application_id=db_app.id,
                    name=current_parent_name).first()

                if existing_parent:
                    current_db_module.parent = existing_parent
                    current_db_module.save()
                else:
                    raise Exception("Parent Module doesn't exists")

            return True, "Transaction complete"

    except Exception as ex:
        print(str(ex))
        return False, str(ex)