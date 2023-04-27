from robot.api.deco import keyword
from Resources.Variables.constants import Credits


class Utils:
    @staticmethod
    @keyword('Return Total Price')
    def return_total_price(amount, unit_price=Credits.AMOUNT, full=True):
        amount = str(unit_price * int(amount)) + '$' if full else str(unit_price * int(amount))
        return amount
