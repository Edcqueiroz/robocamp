***Settings***
Documentation       Representação do component toast

Library         Browser

***Keywords***

Verify Toaster

    [Arguments]     ${expected_message}
    Wait For Elements State     
    ...     css=.Toastify__toast-body div >> text=${expected_message}
    ...     visible     5
    sleep       5

    Wait For Elements State
    ...     css=.Toastify__toast div
    ...     detached    10