import requests
import json

# DEFAULT_LOGIN = 'admin@gmail.com'
DEFAULT_LOGIN = 'qiwaqa+svp-w2dxia82@p2h.com'
DEFAULT_PASSWORD = 'Password#1'
API_URL = 'https://svp-international-api.svp.stage.devops.takamol.support/'


# def get_otp_code(email=DEFAULT_LOGIN, user_type='admin', otp_method='email'):
def get_otp_code(email=DEFAULT_LOGIN, user_type='legislator', otp_method='email'):
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
    return 'Bearer ' + resp.json().get('access_payload').get('access')


def get_access_token_2(otp_code, login=DEFAULT_LOGIN, password=DEFAULT_PASSWORD, fe_app='legislator'):
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
    return 'Bearer ' + resp.json().get('access_payload').get('access')


def create_session(token):
    json_body = {
        "exam_session":
        {
            "category_id": 51,
            "end_at": "2023-07-20T22:00:00.000Z",
            "ends_on": "2024-01-19",
            "repeat": "does_not_repeat",
            "repeat_every": 3,
            "seats": 7,
            "start_at": "2023-07-20T20:00:00.000Z",

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
    return resp.json()


if __name__ == '__main__':
    r = get_otp_code()
    t = get_access_token_2(r)

    # d = cancel_session(t)
    d = create_session(t)
