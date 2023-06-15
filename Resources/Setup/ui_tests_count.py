import os
from robot.api import TestSuiteBuilder


path = os.path.join(os.path.dirname(__file__), '../..')


class UiTestCounts(TestSuiteBuilder):
    def __init__(self):
        super().__init__()
        self.count = 0
        self.test_folders = ['admin', 'legislator', 'test_center_owner']

    def get_total_count(self):
        for _folder in self.test_folders:
            for _file in os.listdir(path + '/' + 'Tests/ui' + '/' + _folder):
                if _file.endswith('robot'):
                    suite = TestSuiteBuilder().build(path + '/' + 'Tests/ui' + '/' + _folder + '/' + _file)
                    self.count += suite.test_count
        return self.count


if __name__ == '__main__':
    p = UiTestCounts()
    x = p.get_total_count()
    print(x)
