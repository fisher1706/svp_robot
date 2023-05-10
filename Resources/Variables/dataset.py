import os

DISCORD_HOOKS = {
    'demo': {
        'ui-daily': os.environ.get('DISCORD_URL'),
    }
}


class WrongCertificateDataset:
    WRONG_CERTIFICATE = '1234567890'
    WRONG_PASSPORT_NUMBER = '123456789'
    INCORRECT_NUMBER = 'TEST'
