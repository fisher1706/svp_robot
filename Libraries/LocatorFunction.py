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
