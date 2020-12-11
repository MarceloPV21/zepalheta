***Settings***

Library         OperatingSystem

***Keywords***

Get Json

    [Arguments]             ${file}

    ${json_file}             Get File        ${EXECDIR}/resources/fixtures/customers/${file}
    ${json_dict}=            Evaluate        json.loads($json_file)     json

    [return]     ${json_dict}   