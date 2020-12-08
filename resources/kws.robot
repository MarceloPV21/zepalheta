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

    Wait Until Element Contains     ${TOASTER_ERROR_P}   ${expected_message}


#Customer

Given I access the customer registration form
    Go to customers
    Wait Until Element Is Visible       ${CUSTOMERS_FORM}     5
    Click Element                       ${CUSTOMERS_FORM}

And that I have the following client

    [Arguments]         ${name}         ${cpf}      ${address}      ${phone_number}

    Remove Customer By Cpf          ${cpf}

    Set Test Variable       ${name}
    Set Test Variable       ${cpf}
    Set Test Variable       ${address}
    Set Test Variable       ${phone_number}
    
But this CPF already exists

    Insert Customer         ${name}     ${cpf}      ${address}      ${phone_number}

When I include this client

    Register New Customer  ${name}         ${cpf}      ${address}      ${phone_number}

Then I should see the notification:

    [Arguments]         ${expect_notice}

    Wait Until Element Contains     ${TOASTER_SUCESS}    ${expect_notice}    5

Then I should see the error notification:

    [Arguments]         ${expect_notice}

    Wait Until Element Contains     ${TOASTER_ERROR}    ${expect_notice}    5

Then I should see messages informing that register client fields are required

    Wait Until Element Contains        ${LABEL_NAME}               Nome é obrigatório              5
    Wait Until Element Contains        ${LABEL_CPF}                  CPF é obrigatório               5
    Wait Until Element Contains        ${LABEL_ADRESS}              Endereço é obrigatório          5
    Wait Until Element Contains        ${LABEL_PHONE_NUMBER}         Telefone é obrigatório          5

Then I should see a text:

    [Arguments]     ${expect_text}

    Wait Until Page Contains     ${expect_text}     5

And this customer should be displayed on list

    ${formatted_cpf} =      Format Cpf      ${cpf}
    Go Back
    Wait Until Element Is Visible   ${CUSTOMER_LIST} 
    Table Should Contain            ${CUSTOMER_LIST}        ${formatted_cpf}

#Remove Customer

Given that I have an unwanted customer
    [Arguments]     ${name}     ${cpf}     ${adress}     ${phone_number}
    Remove Customer By cpf      ${cpf}
    Insert Customer  ${name}     ${cpf}     ${adress}     ${phone_number}   

    Set Test Variable       ${cpf}

And access to customer list

    Go to customers

When I remove this customer

    ${formatted_cpf}=      Format Cpf          ${cpf}
    Set Test Variable       ${formatted_cpf}

    Go to customer details  ${formatted_cpf}
    Click remove customer

And this customer should not appear on list

    Wait Until Page Does Not Contain   ${formatted_cpf}       