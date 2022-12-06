*** Settings ***
Documentation            Exemplo Robot + Appium

Library        AppiumLibrary

*** Test Cases ***
Deve abrir o app da Smartbit

    Open Application       http://localhost:4723/wd/hub
    ...                    alias=Smartbit
    ...                    automationName=UiAutomator2
    ...                    platformName=Android
    ...                    platformVersion=7.0	
    ...                    deviceName=Android Virtual
    ...                    app=${EXECDIR}/app/smartbit-beta.apk
    ...                    udid=emulator-5554
    ...                    autoGrantPermissions=true


    Sleep    10

    Close Application
