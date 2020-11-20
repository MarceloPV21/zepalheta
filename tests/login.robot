***Settings***
Documentation       Login

Resource        ../resources/base.robot



Suite Setup          Start Session

Suite Teardown       Finish Session

***Test Cases***
Admin Login
    Access Login Page       
    Submit my credentials   ${admin_user}    ${admin_pass}
    Should I see logged area
