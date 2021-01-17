***Settings***

Documentation       Representation of Contracts Page.

***Variables***

${CONTRACTS_FORM}               css:a[href$=register]
${SELECT_BUTTON_LOCATOR}        class:react-select__indicators
${SELECT_ITEM_LOCATOR}          xpath://div[contains(text(),'Adam Warlock')]
${DELIVERY_PRICE}               id:delivery_price
${SELECT_BUTTON_EQUIPO}         class:react-select__indicator
${SELCT_ITEM_EQUIPO}            xpath:
${QUANTITY}                     id:quantity


***Keywords***
Create New Contract

    [Arguments]     ${customer_name}    ${equipo_name}

    Click Element   xpath://div[contains(text(),'Escolha o locatário')]
    Click Element   xpath://div[contains(text(),'${customer_name}')]
    
    Click Element   xpath://div[contains(text(),'Escolha o item')]
    Click Element   xpath://div[contains(text(),'${equipo_name}')]
   
    Input Text      id:delivery_price       150
    Input Text      id:quantity             1

    Click Element   css:button[type=submit]
    Click Element   xpath://button[text()='CADASTRAR']



