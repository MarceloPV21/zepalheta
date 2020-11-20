***Settings***
Documentation           Representation of Login Page and your elements and actions

***Keywords***

Login With
    [Arguments]     ${email}    ${password}

    Input Text      id:txtEmail     ${email} 
    Input Text      css:input[placeholder=Senha]        ${password}
    Click Element   xpath://button[text()='Entrar']