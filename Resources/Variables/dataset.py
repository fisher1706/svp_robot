import os

DISCORD_HOOKS = {
    'demo': {
        'ui-daily': os.environ.get('DISCORD_URL'),
    }
}


class WrongTestCenterDataset:
    OFFICIAL_CONTACT_NUMBER = ['Test', '####']
    CONTACT_INFORMATION = ['123456', '####']
    CITY = ['123456', '####']
    POSTAL_CODE = ['Test', '####']
    EMAIL = ['test', 'test@', 'test.test.com', 'test@test']


class WrongCertificateDataset:
    WRONG_CERTIFICATE = '1234567890'
    WRONG_PASSPORT_NUMBER = '123456789'
    INCORRECT_NUMBER = 'TEST'
