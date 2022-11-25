**Settings***
Documentation       Tudo começa aqui

Resource        components/navbar.resource
Resource        components/toast.resource
Resource        pages/login.resource
Resource        pages/enroll.resource
Resource        database.resource
Library         JSONLibrary

***Keywords***
# Helpers
Do Login
    [Arguments]     ${user}

    Go to Login Page
    Fill Credentials    ${user}[email]      ${user}[pass]
    Submit Credentials
    User Should Be Logged In    ${user}[name]


Get Fixtures

    [Arguments]             ${fixture_file}


    ${fixture}              Load JSON From File     
    ...                     ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...                     encoding=UTF-8

    [return]                ${fixture}