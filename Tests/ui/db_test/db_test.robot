*** Settings ***
Documentation    this test for db connection
Library    OperatingSystem
Library    String
Library    DatabaseLibrary
Suite Setup       Connect To Database    psycopg2   ${POSTGRES_DB}    ${POSTGRES_USER}
...    ${POSTGRES_PASS}    ${POSTGRES_HOST}    ${POSTGRES_PORT}
Suite Teardown   Disconnect From Database


*** Variables ***
${POSTGRES_DB}     stage_svp_international_api
${POSTGRES_USER}   qa_gitlab_reader
${POSTGRES_PASS}   QA01@git-ru534
${POSTGRES_HOST}   192.168.20.86
${POSTGRES_PORT}       5432


*** Test Cases ***
Connect to DB and update table "users"
  [Documentation]    update full name  where id = 723
  [Tags]   update
  ${OUTPUT}=  Execute Sql String    UPDATE users set full_name='ahmed' WHERE users.id = 723;
  Log To Console    ${OUTPUT}
  Should Be Equal As Strings    ${OUTPUT}    None
