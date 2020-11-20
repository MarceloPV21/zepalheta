***Keywords***

#Login
Access Login Page
    Go to       ${base_url}

Submit my credentials   
    [Arguments]        ${email}        ${password}

    Login With  ${email}    ${password}

Should I see logged area

    Wait Until Page Contains         Aluguéis     5
 

Should I see a toaster with a message 
    [Arguments]     ${expected_message}

    Wait Until Element Contains     ${TOASTER_ERROR}   ${expected_message}


#Customer

Given I access the customer registration form
    Wait Until Element Is Visible       ${NAV_CUSTOMERS}      5
    Click Element                       ${NAV_CUSTOMERS}
    Wait Until Element Is Visible       ${CUSTOMERS_FORM}     5
    Click Element                       ${CUSTOMERS_FORM}

When I include this client
    [Arguments]         ${name}         ${cpf}      ${address}      ${phone_number}

    Remove Customer By Cpf          ${cpf}

    Register New Customer  ${name}         ${cpf}      ${address}      ${phone_number}

Then I should see the notification:

    [Arguments]         ${expect_notice}

    Wait Until Element Contains     ${TOASTER_SUCESS}    ${expect_notice}    5