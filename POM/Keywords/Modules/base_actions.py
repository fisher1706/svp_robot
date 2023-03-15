from Libraries.email.email_client import EmailClient
from Libraries.random_manager import RandomManager


class BaseActions:

    def __init__(self):
        self.confirmation_url = None
        self.random_manager = RandomManager()

    def activate_account(self, email_to_confirm):
        email_client = EmailClient()
        email_client.receive_confirmation_url(email_to_confirm)
        self.confirmation_url = email_client.confirmation_url
        return self

    @staticmethod
    def get_confirmation_code(email):
        email_client = EmailClient()
        email_client.get_confirmation_code(email)
        return email_client.confirmation_code

    @staticmethod
    def verify_expected_result(actual, expected, condition=False):
        result = actual in expected if condition else actual == expected
        assert result, f"Actual result does not match expected\n" \
                       f"Actual: {actual}\n" \
                       f"Expected: {expected}"

    @staticmethod
    def make_lower_case_first_char_of_second_name(text: str):
        text = text.split(' ')
        return text[0] + ' ' + text[1].lower()
    # TODO: uncomment method when needed in future tests
    # def wait_until_page_updates(self, action, expected_title, arg=None):
    #     for _ in range(10):
    #         try:
    #             if arg:
    #                 action(arg)
    #             else:
    #                 action()
    #             break
    #         except (TimeoutException, NoSuchElementException, AssertionError):
    #             time.sleep(1)
    #             self.refresh_page()
    #             self.verify_expected_title(expected_title)
    #             continue
