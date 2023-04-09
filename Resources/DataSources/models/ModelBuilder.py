from datetime import date

from robot.api.deco import keyword

from Libraries.logger import yaml_logger
from Libraries.random_manager import RandomManager
from Resources.DataSources.models.account import Account
from Resources.DataSources.models.email import Email
from Resources.DataSources.models.labor import Labor
from Resources.Variables import CategoriesIdsDataset
from Resources.Variables.constants import DirPath

logger = yaml_logger.setup_logging(__name__)


class ModelBuilder:
    LOGO = DirPath.PNG_FILE
    COUNTRY = 'Ukraine'
    COUNTRY_ID = '5'
    COUNTRY_CODE = '+380'
    CITY = 'Kiev'
    ADDRESS = 'Address'
    CONTACT_NAME = 'Contact Name'
    CATEGORY = CategoriesIdsDataset.ENGINE_MECHANICS['name']
    POSTAL_CODE = 111111

    @staticmethod
    @keyword('Create New Account')
    def build_random_account(en_name=None,
                             ar_name='',
                             logo=LOGO,
                             country=COUNTRY,
                             country_id=COUNTRY_ID,
                             country_code=COUNTRY_CODE,
                             category=CATEGORY,
                             city=CITY,
                             address=ADDRESS,
                             postal_code=POSTAL_CODE,
                             contact_name=CONTACT_NAME,
                             sub_number=None,
                             phone_number=None,
                             email=None,
                             show_logo=False):
        random_manager = RandomManager()
        en_name = en_name if en_name else random_manager.random_name()
        email = email if email else random_manager.random_email()
        sub_number = sub_number if sub_number else random_manager.random_number()
        phone_number = phone_number if phone_number else country_code + sub_number
        logger.info(f"USER EMAIL: {email}, USER NAME: {en_name}")
        return Account(en_name=en_name,
                       ar_name=ar_name,
                       logo=logo,
                       country=country,
                       country_id=country_id,
                       country_code=country_code,
                       category=category,
                       city=city,
                       address=address,
                       postal_code=postal_code,
                       contact_name=contact_name,
                       sub_number=sub_number,
                       phone_number=phone_number,
                       email=email,
                       show_logo=show_logo)

    @staticmethod
    def build_email(mail):
        return Email(_from=mail['from'],
                     _to=mail['to'],
                     date=mail['date'],
                     subject=mail['subject'],
                     body=mail.get_payload()
                     )

    @staticmethod
    @keyword('Create new random labor')
    def build_random_labor(national_id=None, labor_name=None, passport=None, email=None,
                           occupation=CATEGORY, exam_date=None, exam_result=None, scope=33):
        random_manager = RandomManager()
        national_id = national_id if national_id else random_manager.random_name()
        labor_name = labor_name if labor_name else random_manager.random_name()
        email = email if email else random_manager.random_email()
        passport = passport if passport else random_manager.random_letters(size=2) + str(random_manager.random_number())
        # exam_date = exam_date if exam_date else datetime.date.today() - datetime.timedelta(days=1)
        exam_date = exam_date if exam_date else date.today()
        exam_result = exam_result if exam_result else random_manager.random_number(size=2)
        return Labor(national_id=national_id,
                     labor_name=labor_name,
                     passport=passport,
                     email=email,
                     occupation=occupation,
                     exam_date=exam_date,
                     exam_result=exam_result,
                     scope=scope)
