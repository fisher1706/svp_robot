import os
import sys


class DirPath:
    BASE_DIR = sys.path[1]
    RESOURCES = os.path.join(BASE_DIR, 'Resources')
    DATA_SOURCES = os.path.join(RESOURCES, 'DataSources')
    TEST_FILES = os.path.join(DATA_SOURCES, 'test_files')
    PNG_FILE = os.path.join(TEST_FILES, 'valid_3.png')
    CSV = os.path.join(TEST_FILES, 'sample_attributes.csv')
    CSV_5 = os.path.join(TEST_FILES, 'sample_attributes_5.csv')
    CSV_TEMPLATE = os.path.join(TEST_FILES, 'sample_attributes_template.csv')
    CSV_OCCUPATION = os.path.join(TEST_FILES, 'sample_upload_occupations.csv')
    CSV_CATEGORIES = os.path.join(TEST_FILES, 'sample_upload_categories.csv')
    TEMP_FOLDER = os.path.join(TEST_FILES, 'temp')
