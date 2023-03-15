from POM.Locators.SPAPaymentLocators import SPAPaymentLocators

HEADER = '.header-section h1'
SUCCESS = '.alert-text-holder p',
EMAIL_CODE = '.login-form__text.pb-3',
INVALID_CREDENTIALS_ERROR = '.validation-message--margin-bottom > span',
LEGISLATOR_CREATION = '.alert-message > p',
PASS_WARNING = '.validation-message--default > span > span',
TOKEN_WARNING = '.validation-message--margin-bottom > span',
SPA_USER_TYPE = '.user-info__role',
CARD_NUMBER = SPAPaymentLocators.WARNING_MSG_CARD_NUMBER,
CARD_EXPIRY_DATE = SPAPaymentLocators.WARNING_MSG_EXPIRY_DATE,
CARD_CVV = SPAPaymentLocators.WARNING_MSG_CVV,
CARD_HOLDER = SPAPaymentLocators.WARNING_MSG_CARD_HOLDER,
POPUP_EDIT_EMAIL = '.validation-message__text span',
ACTIVE_CERTIFICATE = '.modal-form__heading',
TEST_CENTER_CREATION_LOCATOR = "div[role='status'] div"
SPA_LOGIN = '.sign-template__header h1',
HEADER_PAYMENT = '.payment-box__header-text',
SPA = '.q-page-box__header h2',
MODAL = '.modal-box .q-page-box__header',
HOME = '.home-section__heading'
OLD_WAITING_SPINNER = '.q-spinner-inner'
WAITING_SPINNER = '.app-spinner span'
CONTINUE_BUTTON = '#continue_button'
SPA_NO_DATA_AVAILABLE = '.modal-box--empty-text'
ADMIN_NO_DATA_AVAILABLE = '.table-no-data'


MESSAGE_LOCATOR = {
    'success': '.alert-text-holder p',
    'email code': '.login-form__text.pb-3',
    'invalid credentials error': '.validation-message--margin-bottom > span',
    'legislator creation': '.alert-message > p',
    'pass warning': '.validation-message--default > span > span',
    'token warning': '.validation-message--margin-bottom > span',
    'spa user type': '.user-info__role',
    'card number': SPAPaymentLocators.WARNING_MSG_CARD_NUMBER,
    'card expiry date': SPAPaymentLocators.WARNING_MSG_EXPIRY_DATE,
    'card cvv': SPAPaymentLocators.WARNING_MSG_CVV,
    'card holder': SPAPaymentLocators.WARNING_MSG_CARD_HOLDER,
    'popup edit email': '.validation-message__text span',
    'active certificate': '.modal-form__heading'
}
TITLE_LOCATOR = {
    'spa login': '.sign-template__header h1',
    'header payment': '.payment-box__header-text',
    'spa': '.q-page-box__header h2',
    'modal': '.modal-box .q-page-box__header',
    'home': '.home-section__heading'
}
