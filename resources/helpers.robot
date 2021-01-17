***Settings***

Library         OperatingSystem

***Keywords***

Get Json

    [Arguments]             ${file}

    ${json_file}             Get File        ${EXECDIR}/resources/fixtures/${file}
    ${json_dict}=            Evaluate        json.loads($json_file)     json

    [return]     ${json_dict}   