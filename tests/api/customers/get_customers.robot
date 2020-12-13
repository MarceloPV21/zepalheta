***Settings***

Resource        ../../../resources/services.robot



***Test Cases***
Get Customer List
    
    ${list}=        Get Json    /list.json

    FOR         ${item}         IN          @{list['data']}
            Log To Console      ${item}
            Post Customer  ${item}
    END

    ${resp}=        Get Customer
    Status Should Be    200     ${resp}
    #Log To Console      ${resp.text}
    ${total}=            Get Length          ${resp.json()}
    Should Be True       ${total} > 0

Get Unique Customer

    ${origin}=          Get Json        /unique.json

    Delete Customer     ${origin['cpf']}
    ${resp}=            Post Customer               ${origin}
    ${user_id}=         Convert To String           ${resp.json()['id']}

    ${resp}=            Get Unique Customer         ${user_id}

    Status Should Be    200                         ${resp}
    Should Be Equal     ${resp.json()['cpf']}       ${origin['cpf']}
    
Customer Not Found

    ${resp}=        Get Unique Customer     098f6bcd4621d373cade4e832627b4f6
    Status Should Be    404     ${resp}
    Should Be Equal     ${resp.json()['message']}       Customer not found