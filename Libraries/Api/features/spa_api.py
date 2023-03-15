import allure

from Libraries.Api.client.api_client import ApiClient
from Libraries.Api.client.api_support import ApiSupport


class SPAApi:
    def __init__(self):
        self.api = ApiClient()
        self.support = ApiSupport(self.api)

    @allure.step("GET api/v1/legislator_space/labors :: get labors info")
    def get_labors_info(self, token: str = '', expect_code: int = 200):
        # TODO: rewrite getting token from local storage when needed
        # if not token:
        #     token = self.get_item_from_local_storage('auth_token_default')
        self.api.get(url=self.api.api_url, endpoint='api/v1/legislator_space/labors?per_page=10&locale=en',
                     headers=self.support.get_headers(token))
        self.support.check_status_code(name='Get labors info', expect_code=expect_code)
        return self.support.get_response_body()

    @allure.step("GET api/v1/legislator_space/labors :: get certificate number")
    def get_certificate_number(self):
        return self.get_labors_info()['labors'][0]['certificates'][0]['certificate_number']
