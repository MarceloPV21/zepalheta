***Settings***
Documentation       Login

Resource        ../../resources/base.robot

Suite Setup          Login Session

Suite Teardown       Finish Session
Test Teardown        Finish TestCase

***Test Cases***
Admin Login
    Access Login Page       
    Submit my credentials   ${admin_user}    ${admin_pass}
    Should I see logged area
