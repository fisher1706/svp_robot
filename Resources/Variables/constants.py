class SupportedBrowser:
    VERSION = {
        "chrome": "107.0",
        "firefox": "93.0",
        "opera": "80.0"
    }


class EmailConst:
    INBOX_FOLDER = '"Inbox"'
    UNSEEN_EMAILS = 'UNSEEN'
    IMAP_SESSION_ACTIVE = 'SELECTED'
    EMAIL_FORMAT = "(RFC822)"
    IMAP_DOMAIN = 'imap.gmail.com'
    STATUS_OK = 'OK'
    FLAG_SEEN = r'\Seen'
    ADD_FLAG = '+FLAGS'


class TransactionState:
    SUCCESS = 'Success'
    USER_CANCELED = 'User canceled'
    PENDING = 'Pending'
    LIMIT_EXCEEDED = 'Error, limit exceeded'
    MANY_TRIES = 'Error, too many tries'
    PREPARED_CHECKOUT = 'prepared checkout'
    TRANSACTION_STATE_LIST = [SUCCESS, USER_CANCELED, PENDING, LIMIT_EXCEEDED, MANY_TRIES, PREPARED_CHECKOUT]


class TransactionStatuses:
    SUCCESS = 'Success'
    PREPARED_CHECKOUT = 'Statuses.Prepared_Checkout'
    FAILED = 'Failed'
    TRANSACTION_STATUSES_LIST = {
        'success': SUCCESS,
        'prepared checkout': PREPARED_CHECKOUT,
        'failed': FAILED
    }


class Labels:
    FILE_ID = 'File ID'
    STATUS = 'Status'
    DATE = 'Date'
    EMAIL = 'Email'


class DateType:
    DATE_SEP_DASH = '%Y-%m-%d'
    DATE_SEP_SLASH = '%d/%m/%Y'
    DATE_SEP_SPACE = '%d %B %Y'


class Credits:
    AMOUNT = 25
