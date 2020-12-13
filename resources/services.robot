***Settings***

Documentation       Service Layer of automation project

Library             RequestsLibrary
Library             Collections

Resource            helpers.robot

***Variables***
${base_api_url}=    http://zepalheta-api:3333

***Keywords***
Get Session Token
    ${resp}=        Post Session  admin@zepalheta.com.br  pwd123

    ${token}        Convert To String   Bearer ${resp.json()['token']}

    [return]        ${token}  

Post Session
    [Arguments]     ${email}                ${password}
    
    Create Session  ze-api                  ${base_api_url}
    &{headers}=     Create Dictionary       Content-Type=application/json
    &{payload}=     Create Dictionary       email=${email}        password=${password}     
    ${resp}=        Post Request            ze-api      /sessions      data=${payload}     headers=${headers}

    [return]        ${resp}

Post Customer
    [Arguments]     ${payload}

    Create Session  ze-api                  ${base_api_url}

    ${token}=           Get Session Token
    &{headers}=         Create Dictionary       content-type=application/json   authorization=${token}
    
    ${resp}=            Post Request    ze-api      /customers      data=${payload}     headers=${headers}

    [return]            ${resp}

Put Customer
    [Arguments]     ${payload}  ${user_id}

    Create Session  ze-api                  ${base_api_url}

    ${token}=           Get Session Token
    &{headers}=         Create Dictionary       content-type=application/json   authorization=${token}
    
    ${resp}=            Put Request    ze-api      /customers/${user_id}      data=${payload}     headers=${headers}

    [return]            ${resp}

Get Customer
    Create Session      zp-api      ${base_api_url}

    ${token}=       Get Session Token       
    &{headers}=     Create Dictionary       Content-Type=application/json   Authorization=${token}

    ${resp}=        Get Request     zp-api      /customers      headers=${headers}

    [return]    ${resp}

Get Unique Customer

    [Arguments]         ${user_id}

    Create Session      zp-api      ${base_api_url}

    ${token}=       Get Session Token       
    &{headers}=     Create Dictionary       Content-Type=application/json   Authorization=${token}

    ${resp}=        Get Request     zp-api      /customers/${user_id}      headers=${headers}

    [return]    ${resp}

Delete Customer

    [Arguments]         ${cpf}
    
    ${token}=           Get Session Token
    &{headers}=         Create Dictionary       content-type=application/json   authorization=${token}
    
    ${resp}=    Delete Request      ze-api      /customers/${cpf}     headers=${headers}

    [return]        ${resp}
