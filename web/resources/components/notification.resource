***Settings***
Documentation       Representação do component de notificação

Library         Browser

***Keywords***
Open Notifications
    Click    css=aside button


Notification Should Be 
    [Arguments]        ${text}

    ${element}        Set Variable        css=.scrollbar-container p

    Wait For Elements State    ${element}
    ...                        visible
    ...                    timeout=2

    Get Text    ${element}        equal        ${text} 