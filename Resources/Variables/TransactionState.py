SUCCESS = 'Success'
USER_CANCELED = 'User canceled'
PENDING = 'Pending'
LIMIT_EXCEEDED = 'Error, limit exceeded'
MANY_TRIES = 'Error, too many tries'
PREPARED_CHECKOUT = 'prepared checkout'
FAILED = 'Failed'

TRANSACTION_STATE_LIST = [
    SUCCESS,
    USER_CANCELED,
    PENDING,
    LIMIT_EXCEEDED,
    MANY_TRIES,
    PREPARED_CHECKOUT
]

TRANSACTION_STATUSES = [
    SUCCESS,
    PREPARED_CHECKOUT,
    FAILED
]
