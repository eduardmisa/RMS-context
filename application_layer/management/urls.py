from django.urls import path, include
from rest_framework import routers
from django.conf.urls import url

from .service.views import ServiceViewSet
from .service_route.views import ServiceRouteViewSet
from .permission.views import PermissionViewSet
from .group.views import GroupViewSet
from .user.views import UserViewSet
from .client.views import ClientViewSet

router = routers.DefaultRouter()

router.register(r'services', ServiceViewSet)
router.register(r'service-routes', ServiceRouteViewSet)
router.register(r'permissions', PermissionViewSet)
router.register(r'groups', GroupViewSet)
router.register(r'users', UserViewSet)
router.register(r'clients', ClientViewSet)

urlpatterns = (
    path('', include(router.urls)),
)
