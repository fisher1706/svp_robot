*** Settings ***
Library     OperatingSystem


*** Keywords ***
Set Common Global Variables
    Set Global Variable    ${ADMIN_URL}    https://svp-international-admin.svp.stage.devops.takamol.support/
    Set Global Variable    ${SPA_URL}    https://svp-international-spa.svp.stage.devops.takamol.support/
    Set Global Variable    ${API_URL}    https://svp-international-api.svp.stage.devops.takamol.support/
    Set Global Variable    ${ALLURE_URL}    https://allure-api.takamol.support
    Set Global Variable    ${GRID_URL}    http://localhost:4444/wd/hub
    Set Global Variable
    ...    ${DISCORD_URL}
    ...    https://discord.com/api/webhooks/1019273907892650055/Stt-bjhk-15K1vNbyoyoLttBIDd1laChmlHEm6_cYOohIK36NF5TnIpU5a3-wus2uqU5
    Set Global Variable    ${PROJECT_ENV}    demo
