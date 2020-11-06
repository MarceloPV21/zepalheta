***Settings***
Documentation       Login

Library         SeleniumLibrary

***Test Cases***
Admin Login
    Access Login Page
    Submit my credentials   admin@zepalheta.com.br    pwd123
    Should I see logged area

***Keywords***
Access Login Page
    Open Browser        http://zepalheta-web:3000/      chrome
    Maximize Browser Window

Submit my credentials   
    [Arguments]        ${email}        ${password}

    Input Text          id:txtEmail                    ${email}
    Input Text          css:input[placeholder=Senha]    ${password}
    Click Element       xpath://button[text()='Entrar']

Should I see logged area

    Wait Until Page Contains         Aluguéis     5
    Close Browser