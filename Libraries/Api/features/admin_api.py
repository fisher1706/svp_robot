import json

import allure
from robot.api.deco import keyword

from Libraries.Api.client.api_client import ApiClient
from Libraries.Api.client.api_support import ApiSupport
from Resources.Variables import CategoriesIdsDataset


class AdminApi:

    def __init__(self):
        self.api = ApiClient()
        self.support = ApiSupport(self.api)
        self.legislator_id = None
        self.activation_link = None

    @staticmethod
    def __add_categories(json_body):
        json_body['categories'] += [
            {'id': 2, 'min_score': '99'},
            {'id': 3, 'min_score': '99'},
            {'id': 4, 'min_score': '99'},
            {'id': 5, 'min_score': '99'},
            {'id': 6, 'min_score': '99'},
            {'id': 7, 'min_score': '99'},
            {'id': 8, 'min_score': '99'},
            {'id': 9, 'min_score': '99'},
            {'id': 10, 'min_score': '99'},
            {'id': 11, 'min_score': '99'},
            {'id': 12, 'min_score': '99'},
            {'id': 13, 'min_score': '99'},
            {'id': 14, 'min_score': '99'},
            {'id': 15, 'min_score': '99'},
            {'id': 16, 'min_score': '99'},
            {'id': 17, 'min_score': '99'},
            {'id': 18, 'min_score': '99'},
            {'id': 19, 'min_score': '99'},
            {'id': 20, 'min_score': '99'},
        ]
        return json_body

    @allure.step("PUT api/v1/admin_space/permissions?locale=en :: put country settings")
    @keyword('Put Permissions')
    # pylint: disable=W0613
    def put_permissions(self, token: str, country_id: int = 5, tcenter: bool = True, multiple_categories: bool = False,
                        expect_code: int = 200):
        print(f"TCENER: {tcenter}")
        legislator = not tcenter
        json_body = {
            'permissions': {
                'legislator': {
                    'test_centers': {
                        'create': legislator,
                        'create_owner': legislator,
                        'edit': legislator,
                        'view': legislator,
                        'delete': legislator
                    },
                    'labors': {
                        'create': legislator,
                        'create_group': legislator,
                        'view_uploaded_files': True,
                        'view': True
                    },
                    'payment': {
                        'make_payment': legislator,
                        'view_transaction_history': True,
                        'view_certificate': True,
                        'withdraw': legislator
                    }
                },
                'test_center_owner': {
                    'test_centers': {
                        'edit': tcenter,
                        'view': tcenter
                    },
                    'labors': {
                        'create': tcenter,
                        'create_group': tcenter,
                        'view_uploaded_files': True,
                        'view': True
                    },
                    'payment': {
                        'make_payment': tcenter,
                        'view_transaction_history': True,
                        'view_certificate': True,
                        'withdraw': tcenter
                    }
                }
            },
            'categories': [
                {
                    'id': 51,
                    'min_score': 99
                }
            ],
            'country_id': country_id,
            'expiry_years': 3,
            'nationalities': [],
            'trial_mode': False,
            'trial_balance': {
                'test_centers': [],
                'legislators': []
            }
        }

        # TODO test request body for permissions -> stage version
        # json_body = {
        #     'permissions': {
        #         'legislator': {
        #             'test_centers': {
        #                 'create': tcenter,
        #                 'create_owner': tcenter,
        #                 'edit': tcenter,
        #                 'view': tcenter,
        #                 'delete': tcenter
        #             },
        #             'labors': {
        #                 'create': legislator,
        #                 'create_group': legislator,
        #                 'view_uploaded_files': True,
        #                 'view': True
        #             },
        #             'payment': {
        #                 'make_payment': tcenter,
        #                 'view_transaction_history': True,
        #                 'view_certificate': True,
        #                 'withdraw': tcenter
        #             }
        #         },
        #         'test_center_owner': {
        #             'test_centers': {
        #                 'edit': legislator,
        #                 'view': legislator
        #             },
        #             'labors': {
        #                 'create': tcenter,
        #                 'create_group': tcenter,
        #                 'view_uploaded_files': True,
        #                 'view': True
        #             },
        #             'payment': {
        #                 'make_payment': legislator,
        #                 'view_transaction_history': True,
        #                 'view_certificate': True,
        #                 'withdraw': legislator
        #             }
        #         }
        #     },
        #     'categories': [
        #         {
        #             'id': 51,
        #             'min_score': 99
        #         }
        #     ],
        #     'country_id': country_id,
        #     'expiry_years': 3,
        #     'nationalities': [],
        #     'trial_mode': False,
        #     'trial_balance': {
        #         'test_centers': [],
        #         'legislators': []
        #     }
        # }

        if multiple_categories:
            json_body = self.__add_categories(json_body)

        print(f"JSON: {json_body}")

        self.api.put(url=self.api.api_url, endpoint='api/v1/admin_space/permissions?locale=en',
                     body=json.dumps(json_body), headers=self.support.get_headers(token))
        # TODO off assert status code -> stage version
        self.support.check_status_code(name='Update country settings', expect_code=expect_code)

    @allure.step("POST api/v1/admin_space/legislators?locale=en :: create legislator")
    def post_create_legislator(self, token: str,
                               en_name: str,
                               arabic_name: str,
                               country_id: str,
                               city: str,
                               address: str,
                               phone_number: str,
                               country_code: str,
                               full_name: str,
                               email: str,
                               postal_code: str,
                               show_logo: bool = False,
                               expect_code: int = 200):
        json_body = {
            'legislator': {
                'english_name': en_name,
                'arabic_name': arabic_name,
                'country_id': country_id,
                'city': city,
                'address': address,
                'postal_code': postal_code,
                'show_logo': show_logo
            },
            'contact': {
                'email': email,
                'full_name': full_name,
                'phone_number': phone_number,
                'country_code': country_code
            }
        }
        self.api.post(url=self.api.api_url, endpoint='api/v1/admin_space/legislators?locale=en',
                      body=json.dumps(json_body), headers=self.support.get_headers(token))
        self.support.check_status_code(name='Create legislator', expect_code=expect_code)
        self.legislator_id = self.support.get_response_body()['id']
        self.activation_link = self.support.get_response_body()['user']['activation_link']
        return self

    @allure.step("POST api/v1/admin_space/test_centers?locale=en :: create test center")
    def post_create_tcenter(self, token: str,
                            name: str,
                            country_id: str,
                            city: str,
                            address: str,
                            phone_number: str,
                            country_code: str,
                            full_name: str,
                            email: str,
                            postal_code: str,
                            legislator_id: int = 754,
                            expect_code: int = 200):
        json_body = {
            "test_center": {
                "name": name,
                "country_id": country_id,
                "city": city,
                "address": address,
                "category_ids": [
                    CategoriesIdsDataset.ENGINE_MECHANICS['id']
                ],
                "phone_number": phone_number,
                "country_code": country_code,
                "postal_code": postal_code,
                "legislator_id": legislator_id
            },
            "owner": {
                "full_name": full_name,
                "email": email
            }
        }
        self.api.post(url=self.api.api_url, endpoint='api/v1/admin_space/test_centers?locale=en',
                      body=json.dumps(json_body), headers=self.support.get_headers(token))
        self.support.check_status_code(name='Create test center', expect_code=expect_code)
        return self.support.get_response_body()

    @allure.step("GET api/v1/admin_space/labors :: get certificates info")
    def get_certificates_info(self, token: str, labor_id: str = '12345BI', expect_code: int = 200):
        self.api.post(url=self.api.api_url, endpoint=f'api/v1/admin_space/labors/{labor_id}',
                      headers=self.support.get_headers(token))
        self.support.check_status_code(name='Get certificates info', expect_code=expect_code)
        return self.support.get_response_body()

    @allure.step("GET api/v1/admin_space/labors :: get certificates serial number")
    def get_certificate_serial_number(self, token: str, labor_id: str = '12345BI'):
        return self.get_certificates_info(token, labor_id)['certificates'][0]['certificate_number']
