class LocatorFunction:
    @staticmethod
    def create_locator_by_text(date):
        return f'//*[text()="{date}"]'

    @staticmethod
    def create_locator_by_li_and_span(data):
        return f'//li//span[text()="{data}"]'

    @staticmethod
    def create_locator_by_span(data):
        return f'//span[text()="{data}"]'

    @staticmethod
    def create_locator_actions(data):
        return f'//span[text() = "{data}"]/../..//*[@class="actionTypeLinks"]'

    @staticmethod
    def create_locator_view(data):
        return f'//span[text() = "{data}"]/../..//*[text()="View"]'

    @staticmethod
    def create_user_locator_super_admin(data):
        return f'//*[@class="user-roles"]//*[text()="{data}"]'

    @staticmethod
    def create_open_actions_locator_super_admin_resend(locator):
        return f'{locator} li:nth-child(1) span'

    @staticmethod
    def create_open_actions_locator_super_admin(base_locator, action_type):
        return f'{base_locator}//span[text()="{action_type}"]'

    @staticmethod
    def create_role_locator_super_admin(data):
        return f'//*[@class="user-roles__item"]//span[text()="{data}"]'
