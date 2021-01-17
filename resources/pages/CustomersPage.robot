***Settings***

Documentation       Representation of Customers Page with your elements and actions.

***Variables***

${CUSTOMERS_FORM}       css:a[href$=register]
${LABEL_NAME}           css:label[for=name]
${LABEL_CPF}            css:label[for=cpf] 
${LABEL_ADRESS}         css:label[for=address] 
${LABEL_PHONE_NUMBER}   css:label[for=phone_number]
${CUSTOMER_LIST}        css:table

***Keywords***

Register New Customer
    [Arguments]         ${name}         ${cpf}      ${address}      ${phone_number}

    Reload Page

    Input Text          id:name             ${name}     
    Input Text          id:cpf              ${cpf}
    Input Text          id:address          ${address}
    Input Text          id:phone_number     ${phone_number}

    Click Element       xpath://button[text()='CADASTRAR']


Go to customer details

    [Arguments]     ${formatted_cpf}

    ${element}=     Set Variable    xpath://td[text()='${formatted_cpf}']

    Wait Until Element Is Visible       ${element}     5
    Click Element                       ${element}

Click remove customer

    ${element}=     Set Variable     xpath://button[text()='APAGAR']   
    
    Wait Until Element Is Visible       ${element}   5
    Click Element                       ${element}

 