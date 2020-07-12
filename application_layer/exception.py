from rest_framework.views import exception_handler
from rest_framework.serializers import ValidationError

def custom_exception_handler(exc, context):
    response = exception_handler(exc, context)
    if response is not None:
        if type(exc) is ValidationError:
            response.data = { "detail": ' '.join([' '.join(x for x in l) for l in list(exc.detail.values())]) }
            response.data['status_code'] = 406
            response.status_code = 406
        else:
            response.data = { "detail": str(exc) }
            response.data['status_code'] = response.status_code

    return response