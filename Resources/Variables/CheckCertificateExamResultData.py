import string
from Libraries.random_manager import RandomManager


SPECIAL_SYMBOLS = '!@#$%ˆ&*()_'
UKR = 'абвгґдеєжзиіїйклмнопрстуфхцчшщьюя'

INVALID_CERTIFICATES = (
    f'{SPECIAL_SYMBOLS}{RandomManager.random_string(size=5)}',
    f'{UKR}{RandomManager.random_string(size=5)}'
)

INVALID_PASSPORT_NUMBERS = (
    RandomManager.random_string(size=5),
)

DEFAULT_EXPIRED_PASSPORT_SVPI = 'AS1110099'
DEFAULT_EXPIRED_CERTIFICATE_SVPI = '30162109924665016'
EXPIRED_CERTIFICATES_SVPI = (
    DEFAULT_EXPIRED_CERTIFICATE_SVPI,
    f'PAK{DEFAULT_EXPIRED_CERTIFICATE_SVPI}'
)

DEFAULT_PASSPORT_SVPI = 'JJ6677777'
DEFAULT_CERTIFICATE_SVPI = '93761517930396416'
CERTIFICATES_SVPI = (
    DEFAULT_CERTIFICATE_SVPI,
    f'IND{DEFAULT_CERTIFICATE_SVPI}'
)

DEFAULT_PASSPORT_SVPL = 'RF2003133'
DEFAULT_CERTIFICATE_SVPL = 'LSVP-PAK734723461'
CERTIFICATES_SVPL = [
    DEFAULT_CERTIFICATE_SVPL
]

NO_EXIST_PASSPORT = 'VB6105068'
DOES_NO_EXIST_CERTIFICATES = [
    93761517930396
]

INVALID_OCCUPATION_KEY = RandomManager.random_string(size=2, chars=string.digits)
INVALID_NATIONALITY_CODE = RandomManager.random_string(size=1, chars=string.digits)

PASSPORT_LABOR = 'RN2177860'
NO_EXIST_OCCUPATION_KEY = RandomManager.random_string(size=6, chars=string.digits)
NO_EXIST_NATIONALITY_CODE = RandomManager.random_string(size=3, chars=string.ascii_letters)
