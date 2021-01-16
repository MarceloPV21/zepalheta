***Settings***

Resource        ../../../resources/services.robot



***Test Cases***
Delete Customer 
    
    ${origin}=        Get Json    /delete.json

    Delete Customer  ${origin['cpf']}

    ${resp}=        Post Customer  ${origin}

    ${resp}=        Delete Customer     ${origin['cpf']} 
    Status Should Be    204     ${resp}
    
  
Customer Not Found

    ${resp}=        Delete Customer                     013.188.922-00
    Status Should Be    405                             ${resp}
    Should Be Equal     ${resp.json()['message']}       Customer not found