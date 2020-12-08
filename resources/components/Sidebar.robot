***Settings***

Documentation       Representation of sidebar navigation

***Variables***

${NAV_CUSTOMERS}    css:a[href$=customers]

***Keywords***

Go to customers

    Wait Until Element Is Visible       ${NAV_CUSTOMERS}      5
    Click Element                       ${NAV_CUSTOMERS}