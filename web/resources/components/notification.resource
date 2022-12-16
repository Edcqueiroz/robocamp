***Settings***
Documentation       Representação do component de notificação

Library         Browser

***Keywords***
Open Notifications
    Click    css=aside button


Notification Should Be 
    [Arguments]        ${text}

    ${element}        Set Variable        xpath=//div/p[contains(text(),'${text}')]

    Wait For Elements State    ${element}
    ...                        visible
    ...                    timeout=2

    Get Text    ${element}        equal        ${text} 



Answer Notification 
    [Arguments]        ${text}    ${answer}

    ${element}        Set Variable        xpath=//div/p[contains(text(),'${text}')]

    Wait For Elements State    ${element}
    ...                        visible
    ...                    timeout=2

    Click    ${element}
    Fill Text       css=textarea[name='answer']        ${answer}               

Submit Answer
    Click           css=button >> text=Enviar resposta