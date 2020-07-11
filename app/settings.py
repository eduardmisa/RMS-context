"""
Django settings for src project.

Generated by 'django-admin startproject' using Django 3.0.3.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.0/ref/settings/
"""

import os
import configparser

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.0/howto/deployment/checklist/


# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Reads app config
config = configparser.ConfigParser()
config_file = os.path.join(BASE_DIR, 'env.ini')
config.read(config_file)

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = config['APPLICATION']['SECRET_KEY']

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = config['APPLICATION']['DEBUG']

# SECURITY WARNING: Filter hosts that are allowed to access this application
ALLOWED_HOSTS = ['*']
CORS_ORIGIN_ALLOW_ALL = True

# Application definition
INSTALLED_APPS = [
    # 'django.contrib.admin',
    # 'django.contrib.auth',
    # 'django.contrib.contenttypes',
    # 'django.contrib.sessions',
    # 'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'corsheaders',
    'django_filters',

    'application_layer',
    'data_layer',
    'entities'
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    # 'django.middleware.security.SecurityMiddleware',
    # 'django.contrib.sessions.middleware.SessionMiddleware',
    # 'django.middleware.common.CommonMiddleware',
    # 'django.middleware.csrf.CsrfViewMiddleware',
    # 'django.contrib.auth.middleware.AuthenticationMiddleware',
    # 'django.contrib.messages.middleware.MessageMiddleware',
    # 'django.middleware.clickjacking.XFrameOptionsMiddleware',

    # 'corsheaders.middleware.CorsMiddleware',
    'middleware.current_user.main.CurrentUserMiddleware'
]

ROOT_URLCONF = 'app.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'app.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases
DATABASES = {
    'default': {
        'ENGINE': config['DATABASE']['DATABASE_ENGINE'],
        'NAME': config['DATABASE']['DATABASE_NAME'],
        'USER': config['DATABASE']['DATABASE_USER'],
        'PASSWORD': config['DATABASE']['DATABASE_PASSWORD'],
        'HOST': config['DATABASE']['DATABASE_HOST'],
        'PORT': config['DATABASE']['DATABASE_PORT'],
    }
}

# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/
LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Asia/Singapore'

USE_I18N = True

USE_L10N = True

USE_TZ = False


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/
STATIC_URL = '/static/'

# REST_SESSION_LOGIN = True

REST_FRAMEWORK = {
    'DEFAULT_RENDERER_CLASSES': [
        'rest_framework.renderers.JSONRenderer',
        'rest_framework.renderers.BrowsableAPIRenderer',
        'rest_framework.renderers.AdminRenderer',
    ],
    'DEFAULT_PERMISSION_CLASSES': [
        'middleware.security.IsAuthenticated',
        'middleware.security.AllowAny',
    ],
    'DEFAULT_AUTHENTICATION_CLASSES': [
        'middleware.security.AppTokenAuthentication'
    ],
    'DEFAULT_FILTER_BACKENDS': ['django_filters.rest_framework.DjangoFilterBackend'],
    'DEFAULT_PAGINATION_CLASS': 'application_layer.paginator.SimplePageNumberPagination',
    # 'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 10,
    'UNAUTHENTICATED_USER': None
}


SESSION_TIMEOUT = config['APPLICATION']['SESSION_TIMEOUT']