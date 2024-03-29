import json
import time

from robot.api.deco import keyword

from Libraries.Api.features.auth_api import AuthApi


class AuthApiActions:

    def __init__(self):
        self.token = None
        self.user_info = None
        self.auth_api = AuthApi()

    @keyword('Get Token')
    def get_token(self):
        return self.token

    @keyword('Get User Info')
    def get_user_info(self):
        return json.dumps(self.user_info)

    @keyword('Request Token')
    def request_token(self):
        self.auth_api.get_otp_code()
        for _ in range(4):
            self.auth_api.get_access_token(self.auth_api.otp_code)
            if self.auth_api.support.api.response.status_code == 200:
                self.token = 'Bearer ' + self.auth_api.support.get_response_body()['access_payload']['access']
                self.user_info = self.auth_api.support.get_response_body()['user']
                break
            time.sleep(1)
        assert self.token, 'Token wasn\'t received after 5 attempts'
