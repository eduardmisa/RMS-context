from middleware.current_user.data import set_current_user
from rest_framework.authentication import TokenAuthentication
from rest_framework import exceptions
from rest_framework import permissions
from datetime import datetime, timedelta
from django.conf import settings
from application_layer.gateway import utils
from data_layer.session_data_layer import get_current_user, get_current_user_scope
import re
from entities import models



class AppTokenAuthentication(TokenAuthentication):
    keyword = 'Bearer'

    def authenticate_credentials(self, key):

        user_session = models.UserSession.objects.filter(token=key).first()

        if not user_session:
            raise exceptions.AuthenticationFailed('Invalid token')

        if user_session.expires < datetime.now():
            raise exceptions.AuthenticationFailed('Token has expired')

        user_session.expires = datetime.now() + timedelta(hours=1)
        user_session.save()

        set_current_user(user_session.user)

        return (user_session.user,
                user_session)


class IsAuthenticated(permissions.BasePermission):        

    def url_regex_exact_matched (self, regex, string):
        reg = '^' + regex + '$'
        return True if re.match(reg, string) != None else False

    def has_permission(self, request, view):

        if not request.user and not request.auth:
            return False

        user_context = None

        inputs = utils.get_request_values(request)

        rms_context_allowed_urls = set([
            '/api/v1/auth/login/', 
            '/api/v1/auth/current-user/',
            '/api/v1/auth/current-user/scope/'])

        if inputs['client_path'] in rms_context_allowed_urls:
            return True

        user_context = get_current_user(request.user, request.auth)

        if not user_context:
            return False

        if user_context.is_superuser:
            return True

        user_context_scope = get_current_user_scope(request.user, request.auth)

        permissions = user_context_scope['service_routes']
        client_path = inputs.get('client_path')
        client_method = inputs.get('client_method')

        return len(
            list(filter(lambda item: self.url_regex_exact_matched(item['url'], client_path)
                                 and item['method'] == client_method,
                        permissions))
        ) > 0


class AllowAny(permissions.BasePermission):        

    def has_permission(self, request, view):
        return True
