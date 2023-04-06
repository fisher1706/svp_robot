import os

DISCORD_HOOKS = {
    'demo': {
        'ui-daily': os.environ.get('DISCORD_URL'),
    }
}


class GetCreditsDataset:
    INVALID_CERTIFICATES = [0, -1, 'test']
    VALID_CARD_DETAILS = ['4111111111111111', '0130', 'Test', '000']
    INVALID_CARD_DETAILS = [
        ['1', '1', '1', '1'],
        ['1111111111111111', '1111', '1111', '1111']
    ]


class EditEmailDataset:
    INVALID_EMAIL = ['test', 'test123', 'test123@', 'test123@test', 'test123@test.test213', 'test!@#$%^&*()@test.test']


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


class PageNumbersDataset:
    PAGE_VALUES = 11
