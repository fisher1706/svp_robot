import requests
import json

DEFAULT_LOGIN = 'admin@gmail.com'
# DEFAULT_LOGIN = 'qiwaqa+svp-8l0z9zdb@p2h.com'
DEFAULT_PASSWORD = 'Password#1'
API_URL = 'https://svp-international-api.svp.stage.devops.takamol.support/'


def get_otp_code(email=DEFAULT_LOGIN, user_type='admin', otp_method='email'):
    json_body = {
        'user': {
            'login': email,
            'password': DEFAULT_PASSWORD,
            'fe_app': user_type,
            'otp_method': otp_method
        }
    }
    resp = requests.post(
        url=API_URL + 'api/v1/login?locale=en',
        data=json.dumps(json_body),
        headers={'Content-Type': 'application/json'}
    )
    print(resp.json())
    return resp.json().get('otp_code')


def get_access_token(otp_code, login=DEFAULT_LOGIN, password=DEFAULT_PASSWORD, fe_app='admin'):
    json_body = {
        'user': {
            'login': login,
            'password': password,
            'fe_app': fe_app,
            'otp_attempt': otp_code
        }
    }
    resp = requests.post(
        url=API_URL + 'api/v1/login?locale=en',
        data=json.dumps(json_body),
        headers={'Content-Type': 'application/json'})
    print(resp.json())
    return 'Bearer ' + resp.json().get('access_payload').get('access')


def create_session(token):
    json_body = {
        "exam_session":
        {
            "end_at": "2025-10-07 10:00:00.000",
            "repeat": "does_not_repeat",
            "seats": 7,
            "start_at": "2025-10-07 10:00:00.000",
            "category_id": 1,
            "repeat_every": 3,
            "ends_on": "2019-12-07",
            "ends_after": 5,
            "repeat_on": [1, 3, 4]
        }
    }

    resp = requests.post(
        url=API_URL + 'api/v1/test_center_owner_space/exam_sessions',
        data=json.dumps(json_body),
        headers={
            'Content-Type': 'application/json',
            'authorization': token
        }
    )
    print(resp.json())
    return resp.json()


def cancel_session(token):
    resp = requests.post(
        url='https://svp-international-api.svp.demo.devops.takamol.support/api/v1/admin_space/'
            'exam_sessions/1282/cancel?cancellation_reason=test&give_credit=false',
        headers={
            'Content-Type': 'application/json',
            'authorization': token
        }
    )
    print(resp.json())
    return resp.json()


if __name__ == '__main__':
    r = get_otp_code()
    t = get_access_token(r)
    print(t)

    d = cancel_session(t)
    print(d)
