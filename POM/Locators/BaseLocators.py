from POM.Locators.SPAPaymentLocators import SPAPaymentLocators


class BaseLocators:
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
        'active certificate': '.modal-form__heading',
        'test center creation': "div[role='status'] div"
    }
    TITLE_LOCATOR = {
        'header': '.header-section h1',
        'spa login': '.sign-template__header h1',
        'header payment': '.payment-box__header-text',
        'spa': '.q-page-box__header h2',
        'modal': '.modal-box .q-page-box__header',
        'home': '.home-section__heading'
    }
    OLD_WAITING_SPINNER = '.q-spinner-inner'
    WAITING_SPINNER = '.app-spinner span'
    CONTINUE_BUTTON = '#continue_button'
    SPA_NO_DATA_AVAILABLE = '.modal-box--empty-text'
    ADMIN_NO_DATA_AVAILABLE = '.table-no-data'
