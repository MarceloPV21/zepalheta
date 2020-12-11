***Settings***
Documentation       Login Attempt

Resource        ../../resources/base.robot

Suite Setup          Login Session
#Execute one or more Keywords after execution of all steps of each test case
Suite Teardown       Finish Session

Test Template       Attempt Login 

***Keywords***
Attempt Login
    [Arguments]     ${input_email}      ${input_password}      ${output_message}

    Access Login Page
    Submit my credentials   ${input_email}     ${input_password} 
    Should I see a toaster with a message         ${output_message}

***Test Cases***
Incorrect Password          admin@zepalheta.com.br      abc123      Ocorreu um erro ao fazer login, cheque as credenciais.
Empty Password              admin@zepalheta.com.br      ${Empty}    O campo senha é obrigatório!
Empty Email                 ${Empty}                    123456      O campo email é obrigatório!
Empty Email and Password    ${Empty}                    ${Empty}    Os campos email e senha não foram preenchidos!
