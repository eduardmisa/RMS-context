from entities import models
from django.conf import settings
import requests

def get_request_values(request):

    req = request

    client_header = dict(req.headers)
    client_body = req.data
    client_files = dict(req.FILES)
    client_method = str(req.method)
    client_path = str(req.path)
    client_query = req.query_params

    client_path = client_path.replace('gw/','')

    query = '&'.join("{!s}={!r}".format(key,val) for (key,val) in client_query.items()).replace("'","")
    if query:
        query = "?" + query

    destination_url = ""
    token = ""
    
    if "Authorization" in client_header and "Bearer" in client_header["Authorization"]:
        token = client_header["Authorization"].replace("Bearer ", "")
    elif "Authorization" in client_header:
        token = client_header["Authorization"]
    else:
        pass

    currentSession = models.UserSession.objects.filter(token=token).first()

    if currentSession:
        destination_url = currentSession.service.base_url

    target_destination = destination_url + client_path + query

    return {"client_header": client_header,
            "client_body": client_body,
            "client_files": client_files,
            "client_method": client_method,
            "client_path": client_path,
            "client_query": client_query,
            "target_destination": target_destination}