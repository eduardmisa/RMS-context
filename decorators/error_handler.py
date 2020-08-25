from rest_framework.response import Response
from rest_framework import status
import json


def error_safe(function):
    def wrap(request, *args, **kwargs):
        try:
                return function(request, *args, **kwargs)
        except Exception as ex:
            data = ''
            try:
                data = str(ex)
                print(f'ERROR: {data}')
            except Exception as ex2:
                pass
            return Response(data={"error": data},
                            status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    wrap.__doc__ = function.__doc__
    wrap.__name__ = function.__name__
    return wrap
