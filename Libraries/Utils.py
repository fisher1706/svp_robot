import re
import calendar
from datetime import datetime, timedelta
from robot.api.deco import keyword
from random_manager import RandomManager
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

    @staticmethod
    @keyword('Time New Session')
    def time_new_session(delta=3, correct_start='False', num=0):
        data = [
            datetime.now().strftime('%-d'),
            (datetime.now() - timedelta(days=1)).strftime('%-d'),
        ]
        if correct_start == 'False':
            add = [
                (datetime.now() + timedelta(hours=num+1)).strftime('%H:00'),
                (datetime.now() + timedelta(hours=num+delta)).strftime('%H:00'),
                (datetime.now() + timedelta(hours=num+1)).strftime('%d/%m/%Y %H:00')
            ]
        elif correct_start == 'Less':
            add = [
                f"{(datetime.now() + timedelta(hours=1)).strftime('%H:')}30",
                (datetime.now() + timedelta(hours=delta)).strftime('%H:00'),
            ]
        else:
            add = [
                (datetime.now() - timedelta(hours=4)).strftime('%H:00'),
                (datetime.now() - timedelta(hours=2)).strftime('%H:00'),
            ]
        return data + add

    @staticmethod
    @keyword('Return Random Number Limit')
    def return_random_number_limit(start=1, end=99):
        return RandomManager().random_number_limit(start, end)

    @staticmethod
    @keyword('Return Random Data List')
    def return_random_data_list(data):
        return RandomManager.random_from_list(data)

    @staticmethod
    @keyword('Reverse Date')
    def reverse_date(data):
        inner = data.split(' ')[0].split('/')
        inner.reverse()
        return '-'.join(inner)

    @staticmethod
    @keyword('Get Month Interval')
    def get_month_interval():
        date = datetime.now().strftime('%Y-%m')
        last_day = calendar.monthrange(int(date.split('-')[0]), int(date.split('-')[1]))[1]
        return [f"{date}-01", f"{date}-{last_day}"]

    @staticmethod
    @keyword('Get Current Date')
    def get_current_date():
        date = datetime.now().strftime('%d-%m-%Y')
        return date

    @staticmethod
    @keyword('Reformat Data Filter')
    def reformat_filters_data(data):
        return list(data.keys())[0], list(data.values())[0]

    @staticmethod
    @keyword('Get Randon String')
    def get_random_string():
        return RandomManager().random_name()
