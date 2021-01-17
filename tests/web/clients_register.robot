***Settings***

Documentation       Clients Register

Resource            ../../resources/base.robot

Suite Setup          Login Session

Suite Teardown       Finish Session
Test Teardown        Finish TestCase


***Test Cases***

New Clients
    [Tags]      smoke
    Given I access the customer registration form
    And that I have the following client
    ...     Bon Jovi    01317898214      Bug Street,1000     00000000001
    When I include this client
    Then I should see the notification:     Cliente cadastrado com sucesso!
    And this customer should be displayed on list

Duplicate Clients
    [Tags]      dup
    Given I access the customer registration form
    And that I have the following client
    ...     Adrian Smith    01317898111      Bug Street,1000     00000000001
    But this CPF already exists
    When I include this client
    Then I should see the error notification:     Este CPF já existe no sistema!


Required Fields
    [Tags]      allrq
    Given I access the customer registration form
    And that I have the following client
    ...     ${EMPTY}     ${EMPTY}        ${EMPTY}       ${EMPTY}  
    When I include this client
    Then I should see the texts about all required fields

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
    And that I have the following client
    ...     ${name}     ${cpf}     ${adress}     ${phone}
    When I include this client
    Then I should see a text:    ${text}




