import json
import sys
import xml.etree.ElementTree as ET
from enum import Enum
from typing import List

import requests


class SlackReportWebHooks(str, Enum):
    UI = 'https://hooks.slack.com/services/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'


class TestsStatuses(str, Enum):
    PASS = 'PASS'
    FAIL = 'FAIL'
    SKIP = 'SKIP'


class SendAllureReport:
    TIMER = ':timer:'
    CHECKMARK = ':white_check_mark:'
    SCROLL = ':scroll:'
    SOS = ':sos:'
    ROCKET = ':rocket:'
    INFORMATION = ':information_source:'
    SUITE_TOTAL = ':information_source:'
    ANGER = ':anger:'
    RERUN = ':infinity:'
    MARK = ':bangbang:'
    MESSAGE_SIZE = 2000

    def __init__(self):
        self.__webhook_url = SlackReportWebHooks.UI.value
        self.__suite_name = sys.argv[1]
        self.__project_env = 'stage'
        self.__total_test = 248
        self.__failed_tests: int = 0
        self.__skipped_tests: int = 0
        self.__passed_tests: int = 0

    @staticmethod
    def get_test_from_run() -> List:
        tree = ET.parse('./Results/Reports/output.xml')
        mytag_elements = tree.findall(".//test")

        tests_statuses = []
        for _, element in enumerate(mytag_elements):
            for tag in element:
                status = tag.attrib.get('status')
                if status:
                    tests_statuses.append(status)
        return tests_statuses

    def send_slack_report(self, report: str) -> None:
        report_message = {'text': report}
        requests.post(self.__webhook_url, json.dumps(report_message), timeout=1)

    def create_message_add_to_report(self, tests_statuses: List):
        for status in tests_statuses:
            if status == TestsStatuses.PASS:
                self.__passed_tests += 1
            elif status == TestsStatuses.FAIL:
                self.__failed_tests += 1
            elif status == TestsStatuses.SKIP:
                self.__skipped_tests += 1

    def build_title(self):
        tests_statuses = self.get_test_from_run()
        self.create_message_add_to_report(tests_statuses)
        if self.__failed_tests > 0:
            title_text = f'FAILED RUN for {self.__suite_name}'
            title_side = (("-" * 20), self.MARK)
        else:
            title_text = f'SUCCESS RUN for {self.__suite_name}'
            title_side = (("-" * 20), self.CHECKMARK)
        title = f'{self.INFORMATION}{"".join(title_side)} {title_text} {"".join(title_side[::-1])}{self.INFORMATION}\n'
        self.send_slack_report(title)

    def get_allure_link(self):
        return f'https://allure-api.takamol.support/allure-docker-service/projects/' \
               f'{self.__suite_name}/reports/latest/index.html'

    def send_count_report(self):
        total = self.__passed_tests + self.__failed_tests + self.__skipped_tests
        message = f'{self.INFORMATION} Environment: {self.__project_env} \n' \
                  f'{self.SUITE_TOTAL} Suite Total: {total}/{self.__total_test} \n' \
                  f'{self.CHECKMARK} Passed tests: {self.__passed_tests} \n' \
                  f'{self.SOS} Failed tests: {self.__failed_tests} \n' \
                  f'{self.ANGER} Skipped tests: {self.__skipped_tests} \n' \
                  f'Allure link - {self.get_allure_link()}'
        self.send_slack_report(message)

    def send_report(self):
        self.build_title()
        self.send_count_report()


SendAllureReport().send_report()
