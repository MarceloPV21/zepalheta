***Settings***
Documentation       Remove Customers

Resource        ../resources/base.robot

Suite Setup          Login Session

Suite Teardown       Finish Session

***Test Cases***
Remove Customer
    Given that I have an unwanted customer
    ...     Bob Dylan   44444444444     Bug street, 2000    11111111111
    And access to customer list
    When I remove this customer
    Then I should see the notification:   Cliente removido com sucesso!
    And this customer should not appear on list


