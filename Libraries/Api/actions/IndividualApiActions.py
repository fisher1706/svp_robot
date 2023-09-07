import json
import requests
from Resources.Variables import UserInfo
from Resources.Variables import IndividualData


class IndividualApiActions:
    def __init__(self):
        self.json_headers = IndividualData.DEFAULT_HEADERS
        self.base_url = IndividualData.BASE_URL

    def get_otp_code_individual_email(self, individual, country_code=91, country_id=44, nationality_id=76,
                                      endpoint=IndividualData.DEFAULT_ENDPOINT):
        labor = {
            "country_code": f"+{country_code}",
            "country_id": country_id,
            "date_of_birth": f"{individual.date_of_birth}",
            "email": individual.email,
            "full_name": f"{individual.first_name} {individual.last_name}",
            "national_id": individual.national_id,
            "nationality_id": nationality_id,
            "passport_expiration_date": f"{individual.passport_expiration}",
            "passport_number": individual.passport,
            "password": UserInfo.DEFAULT_PASSWORD,
            "password_confirmation": UserInfo.DEFAULT_PASSWORD
        }

        json_body = {
            "labor": labor,
            "step": "validate_data"
        }

        resp_confirmation = requests.post(
            url=self.base_url + endpoint,
            data=json.dumps(json_body),
            headers=self.json_headers,
            timeout=1
        )

        confirmation_id = resp_confirmation.json().get('confirmation_id')

        labor.update({"confirmation_id": confirmation_id})

        json_body.update({
            "labor": labor,
            "step": "validate_email"
        })

        resp_otp = requests.post(
            url=self.base_url + endpoint,
            data=json.dumps(json_body),
            headers=self.json_headers,
            timeout=1
        )

        return resp_otp.json().get('otp_code')
