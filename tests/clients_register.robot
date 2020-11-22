***Settings***

Documentation       Clients Register

Resource        ../resources/base.robot

Suite Setup          Login Session

Suite Teardown       Finish Session



***Test Cases***

New Clients
    Given I access the customer registration form
    When I include this client
    ...     Bon Jovi    01317898214      Bug Street,1000     00000000001
    Then I should see the notification:     Cliente cadastrado com sucesso!

Required Fields
    Given I access the customer registration form
    When I include this client
    ...     ${EMPTY}     ${EMPTY}        ${EMPTY}       ${EMPTY}  
    Then I should see the notification:     Cliente cadastrado com sucesso!

Name is Required
    [Tags]      required
    [Template]      Fields Validation
    ${EMPTY}        01317898756    56          36413755    Nome é obrigatório

Cpf is Required
    [Tags]      required
    [Template]      Fields Validation
    Marcelo         ${EMPTY}       56          36413755    CPF é obrigatório

Adress is Required
    [Tags]      required
    [Template]      Fields Validation
    Marcelo             01317898756    ${EMPTY}    36413755    Endereço é obrigatório

Phone is Required
    [Tags]      required
    [Template]      Fields Validation
    Marcelo             01317898756    56          ${EMPTY}    Telefone é obrigatório

Incorrect Phone
    [Tags]      required
    [Template]      Fields Validation
    Marcelo             01317898245     56          3641554656      Telefone inválido       

***Keywords***

Fields Validation
    [Arguments]     ${name}     ${cpf}     ${adress}     ${phone}       ${text}
    
    Given I access the customer registration form
    When I include this client
    ...     ${name}     ${cpf}     ${adress}     ${phone}
    Then I should see a text:    ${text}




