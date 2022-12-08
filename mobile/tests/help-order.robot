*** Settings ***
Documentation            Suíte de testes de perdido de ajuda

Resource        ../resources/base.resource

# Test Setup           Start App
# Test Teardown        Finish App

*** Test Cases ***
Deve poder solicitar ajuda
    ${admin}    Get Fixture    admin
    ${papito}    Get Fixture    papito

    Reset Student    ${papito}[student][email]

    ${token}        Get Service Token        ${admin}
    POST New Student    ${token}             ${papito}[student]