***Settings***

Resource        ../../resources/services.robot

***Test Cases***
New Customer
    
    &{payload}=         Create Dictionary       name=Flea   cpf=777.777.777-77  address=Bug Street,200   phone_number=92982705014

    Delete Customer     ${payload['cpf']}

    ${resp}=            Post Customer       ${payload}

    Status Should Be    200     ${resp}

Name is required

   
    &{payload}=         Create Dictionary       cpf=777.777.777-77  address=Bug Street,200   phone_number=92982705014
    
    ${resp}=            Post Customer       ${payload}

    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "name" is required

Cpf is required

    
    &{payload}=         Create Dictionary       name=Flea     address=Bug Street,200   phone_number=92982705014

    ${resp}=            Post Customer       ${payload}

    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "cpf" is required

Adress is required

    
    &{payload}=         Create Dictionary       name=Flea     cpf=777.777.777-77    phone_number=92982705014
    ${resp}=            Post Customer       ${payload}

    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "address" is required

Phone Number is required

  
    &{payload}=         Create Dictionary       name=Flea     cpf=777.777.777-77   address=Bug Street,200   
    ${resp}=            Post Customer       ${payload}
    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "phone_number" is required

