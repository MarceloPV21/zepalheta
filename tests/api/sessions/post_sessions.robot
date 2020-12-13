***Settings***

Resource        ../../../resources/services.robot

***Test Cases***
Login Successful

    ${resp}=        Post Session  email=admin@zepalheta.com.br   password=pwd123

    Status Should Be        200       ${resp}

Incorrect Password

    ${resp}=        Post Session  email=admin@zepalheta.com.br   password=pwd

    Status Should Be        401       ${resp}

User does not exist

    ${resp}=        Post Session            email=404@yahoo.com    password=pwd123

    Status Should Be        401       ${resp}


