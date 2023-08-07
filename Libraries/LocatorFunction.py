class LocatorFunction:
    @staticmethod
    def create_locator_by_text(date):
        return f'//*[text()="{date}"]'
