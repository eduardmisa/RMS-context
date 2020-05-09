from django.urls import path, include
from rest_framework import routers
from django.conf.urls import url

from .views import *

router = routers.DefaultRouter()

router.register(r'applications', ApplicationViewSet)
router.register(r'routes-front', RoutesFrontViewSet)
router.register(r'routes-back', RoutesBackViewSet)
router.register(r'permissions', PermissionViewSet)
router.register(r'modules', ModuleViewSet)
router.register(r'groups', GroupViewSet)
router.register(r'users', UserViewSet)
router.register(r'clients', ClientViewSet)

urlpatterns = (
    path('', include(router.urls)),
)
