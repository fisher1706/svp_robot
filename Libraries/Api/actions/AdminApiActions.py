from robot.api.deco import keyword

from Libraries.Api.actions.AuthApiActions import AuthApiActions
from Libraries.Api.features.admin_api import AdminApi
from Libraries.logger import yaml_logger
from Resources.DataSources.models.ModelBuilder import ModelBuilder

logger = yaml_logger.setup_logging(__name__)


class AdminApiActions(AdminApi):

    def __init__(self):
        super().__init__()
        self.legislator_account = None
        self.tcenter_account = None
        self.auth_api_actions = AuthApiActions()

    @keyword('Get Test Center Account')
    def get_tcenter_account(self):
        return self.tcenter_account

    @keyword('Get Legislator Account')
    def get_legislator_account(self):
        return self.legislator_account

    @keyword('Create Legislator')
    def create_legislator(self, token):
        logger.info('LEGISLATOR INFO')
        self.legislator_account = ModelBuilder.build_random_account()
        self.post_create_legislator(
            token=token,
            en_name=self.legislator_account.en_name,
            arabic_name=self.legislator_account.ar_name,
            country_id=self.legislator_account.country_id,
            city=self.legislator_account.city,
            address=self.legislator_account.address,
            phone_number=self.legislator_account.sub_number,
            country_code=self.legislator_account.country_code,
            full_name=self.legislator_account.contact_name,
            email=self.legislator_account.email,
            postal_code=self.legislator_account.postal_code,
            show_logo=self.legislator_account.show_logo
        )
        self.legislator_account.activation_link = self.activation_link[1:]
        return self

    @keyword('Create Test Center')
    def create_tcenter(self, token):
        logger.info('TEST CENTER INFO')
        self.tcenter_account = ModelBuilder.build_random_account()
        resp = self.post_create_tcenter(
            token=token,
            name=self.tcenter_account.en_name,
            country_id=self.tcenter_account.country_id,
            city=self.tcenter_account.city,
            address=self.tcenter_account.address,
            phone_number=self.tcenter_account.sub_number,
            country_code=self.tcenter_account.country_code,
            full_name=self.tcenter_account.contact_name,
            email=self.tcenter_account.email,
            legislator_id=self.legislator_id,
            postal_code=self.legislator_account.postal_code
        )
        self.tcenter_account.activation_link = resp.get('user').get('activation_link')[1:]
        return self

    @keyword('Activate Permission')
    def activate_permission(self, tcenter: bool, multiple_categories=None):
        self.auth_api_actions.request_token()
        self.put_permissions(token=self.auth_api_actions.token,
                             tcenter=tcenter,
                             multiple_categories=multiple_categories)
