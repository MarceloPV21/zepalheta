***Settings***

Library     SeleniumLibrary

Resource    kws.robot
Resource    hooks.robot
Resource    services.robot

Library     libs/db.py

Resource    pages/LoginPage.robot
Resource    pages/CustomersPage.robot
Resource    pages/ContractsPage.robot


Resource    components/Sidebar.robot
Resource    components/Toaster.robot

***Variables***

${base_url}     http://zepalheta-web:3000
${admin_user}   admin@zepalheta.com.br
${admin_pass}   pwd123