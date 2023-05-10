import re
from robot.api.deco import keyword
from Resources.Variables.constants import Credits


class Utils:
    @staticmethod
    @keyword('Return Total Price')
    def return_total_price(amount, unit_price=Credits.AMOUNT, full=True):
        amount = str(unit_price * int(amount)) + '$' if full else str(unit_price * int(amount))
        return amount

    @staticmethod
    @keyword('Reformat Date')
    def reformat_date(date):
        return date.split('\n')[0]

    @staticmethod
    @keyword('Find Certificate Number')
    def find_certificate_number(data):
        return [item for item in data if re.findall(r'\d{17}', item)][0]

    @staticmethod
    @keyword('Cap String')
    def cap_str(data):
        return data.title()

    @staticmethod
    @keyword('Low String')
    def low_str(data):
        return data.lower()
