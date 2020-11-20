***Settings***

Documentation       Clients Register

Resource        ../resources/base.robot

Test Setup          Login Session

Test Teardown       Finish Session


***Test Cases***

New Clients
    Given I access the customer registration form
    When I include this client
    ...     Bon Jovi    01317898214      Bug Street,1000     00000000001
    Then I should see the notification:     Cliente cadastrado com sucesso!

Required fields
    [tags]   temp
    Given I access the customer registration form
    When I include this client
    ...     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Then I should see messages informing that register client fields are required


