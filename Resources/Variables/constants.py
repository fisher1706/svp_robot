import os
import sys


class SupportedBrowser:
    VERSION = {
        "chrome": "107.0",
        "firefox": "93.0",
        "opera": "80.0"
    }


class DirPath:
    BASE_DIR = sys.path[1]
    RESOURCES = os.path.join(BASE_DIR, 'Resources')
    DATA_SOURCES = os.path.join(RESOURCES, 'DataSources')
    TEST_FILES = os.path.join(DATA_SOURCES, 'test_files')
    PNG_FILE = os.path.join(TEST_FILES, 'valid_3.png')
    CSV = os.path.join(TEST_FILES, 'sample_attributes.csv')
    CSV_5 = os.path.join(TEST_FILES, 'sample_attributes_5.csv')
    TEMP_FOLDER = os.path.join(TEST_FILES, 'temp')


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


class ExamResult:
    ALL = 'All'
    PASSED = 'Passed'
    FAILED = 'Failed'
    PENDING = 'Pending'
    REJECTED = 'Rejected'
    LIST_EXAM_RESULTS = [PASSED, FAILED, PENDING, REJECTED]
    LIST_ALL_EXAM_RESULTS = [ALL, PASSED, FAILED, PENDING, REJECTED]


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
