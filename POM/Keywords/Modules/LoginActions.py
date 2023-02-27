import time

from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

from Libraries.Api.features.auth_api import AuthApi
from POM.Keywords.Modules.base_actions import BaseActions
from Resources.Variables import WarningMessage
from Resources.Variables.constants import Authentication


class LoginActions:

    def __init__(self):
        super().__init__()
        self.base_actions = BaseActions()
        self.auth_api = AuthApi()

    @staticmethod
    def __proceed_2fa(two_factor_code=None):
        is_passed = False
        for _ in range(5):
            if not two_factor_code:
                two_factor_code = BuiltIn().run_keyword('Get 2fa code')
            BuiltIn().run_keyword('Enter 2fa code', two_factor_code)
            BuiltIn().run_keyword('Click Sign In_btn')
            time.sleep(3)
            if BuiltIn().run_keyword('Is warning msg displayed'):
                two_factor_code = None
            elif BuiltIn().run_keyword('Wait Sign In btn become disabled'):
                continue
            else:
                is_passed = True
                break
        assert is_passed, WarningMessage.OTP_CODE

    def __proceed_2fa_via_email(self, email, two_factor_code=None):
        if not two_factor_code:
            self.base_actions.get_confirmation_code(email)
            two_factor_code = self.base_actions.confirmation_code
        BuiltIn().run_keyword('Enter 2fa code', two_factor_code)
        BuiltIn().run_keyword('Click Sign In_btn')

    @staticmethod
    def __proceed_2fa_api(get_otp_code, email, admin):
        is_passed = False
        for _ in range(5):
            auth_api = get_otp_code(email, admin)
            BuiltIn().run_keyword('Enter 2fa code', auth_api.otp_code)
            BuiltIn().run_keyword('Click Sign In_btn')
            time.sleep(3)
            if BuiltIn().run_keyword('Wait Sign In btn become disabled'):
                continue
            is_passed = True
            break
        assert is_passed, WarningMessage.OTP_CODE

    @keyword('Proceed 2fa')
    def proceed_2fa(self, two_factor_verification='', two_factor_code=None, email='', user_type=''):
        match two_factor_verification:
            case Authentication.EMAIL:
                self.__proceed_2fa_via_email(email, two_factor_code)
            case Authentication.API:
                if not two_factor_code:
                    two_factor_code = self.auth_api.get_otp_code()
                self.__proceed_2fa_api(two_factor_code, email, user_type)
            # TODO: Need to investigate how to get otp from network
            # case Authentication.OTP_FROM_NETWORK:
            #     two_factor_code = self.base_actions.driver_actions.get_otp_code_from_network()
            # BuiltIn().run_keyword('Enter 2fa code', two_factor_code)
            #     BuiltIn().run_keyword('Click Sign In_btn')
            case '':
                self.__proceed_2fa(two_factor_code)
