from django.urls import path, include
from rest_framework import routers
from django.conf.urls import url

from .views import *

router = routers.DefaultRouter()

router.register(r'applications', ApplicationViewSet)
router.register(r'modules', ModuleViewSet)
router.register(r'endpoints', EndpointViewSet)
router.register(r'groups', GroupViewSet)
router.register(r'users', UserViewSet)
router.register(r'clients', ClientViewSet)

urlpatterns = (
    path('', include(router.urls)),
)
