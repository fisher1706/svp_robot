from datetime import date
import calendar


my_date = date.today()
day = calendar.day_name[my_date.weekday()]

session_repeat = [
    'Does not repeat',
    'Daily',
    f'Weekly {day}',
    # f'Monthly on the first {day}',
    'Custom'
]

custom_repeat = [
    'Day',
    'Week',
    'Month'
]
