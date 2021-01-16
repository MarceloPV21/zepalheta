***Settings***

Resource        ../../../resources/services.robot



***Test Cases***
Update a Customer

    ${payload}      Get Json    /slash.json

    Delete Customer  ${payload['cpf']}
    ${resp}=    Post Customer             ${payload}
    ${user_id}=   Convert To String       ${resp.json()['id']}

    Set To Dictionary       ${payload}      name        Saul Hudson

    ${resp}=    Put Customer  ${payload}  ${user_id}

    Status Should Be    204     ${resp}

    ${resp}=        Get Unique Customer  ${user_id}

    Should Be Equal     ${resp.json()['name']}      Saul Hudson