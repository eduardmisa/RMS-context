from enum import Enum


class LogEnum(Enum):
    ADD = "Add"
    UPDATE = "Update"
    DELETED = "DELETED"

class LogEntitiesEnum(Enum):
    COMPANY = "COMPANY"

# MAKE SURE KEY IS EQUAL TO MODEL NAME
# e.g models.User >>> User
class PrefixEnum(Enum):
    User = "USR"
    Application = "APP"
    RoutesFront = "RTF"
    RoutesBack = "RTB"
    Permission = "PRM"
    Module = "MOD"
    Group = "GRP"
    Client = "CLI"

class PremissionPrivilegeEnum(Enum):
    CAN_ADD = "CAN_ADD"
    CAN_EDIT = "CAN_EDIT"
    CAN_DELETE = "CAN_DELETE"
    CAN_VIEW = "CAN_VIEW"

class ApiMethodEnum(Enum):
    GET = "GET"
    POST = "POST"
    PUT = "PUT"
    DELETE = "DELETE"
