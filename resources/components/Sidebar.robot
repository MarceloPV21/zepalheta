***Settings***

Documentation       Representation of sidebar navigation

***Variables***

${NAV_CUSTOMERS}    css:a[href$=customers]
${NAV_CONTRACTS}    css:a[href$=contracts]

***Keywords***

Go to customers

    Wait Until Element Is Visible       ${NAV_CUSTOMERS}      5
    Click Element                       ${NAV_CUSTOMERS}

Go to contracts

    Wait Until Element Is Visible       ${NAV_CONTRACTS}      5
    Click Element                       ${NAV_CONTRACTS}