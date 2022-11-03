*** Settings ***
Library  SeleniumLibrary
Resource  ${EXECDIR}/Resources/Variable.robot
Resource  ${EXECDIR}/Resources/Landingpage.robot

*** Keywords ***
Accept Cookies
    ${present}=  Run Keyword And Return Status   Element Should Be Visible  //*[@id="truste-consent-button"]
    Run Keyword If  ${present}  Click Element  //*[@id="truste-consent-button"]

*** Test Cases ***
#1
Login as France
    [documentation]  Select Region
    [tags]  Functional Test
    Open Browser  https://pat.libreview.io/.  chrome
    Maximize Browser Window
    Landingpage.Select country and language  ${SelectFR}  ${SelectFrench}
    Capture Page Screenshot
    Click Element  ${Submit}
    Accept Cookies
    Sleep  1s
    Page Should Not Contain Element  ${PatientHeader}
    Page Should Not Contain Element  ${ProfessionalHeader}
    Close Browser

#2
Login as US
    [documentation]  Select Region
    [tags]  Functional Test
    Open Browser  https://pat.libreview.io/.  chrome
    Maximize Browser Window
    Landingpage.Select country and language  ${SelectUS}  ${SelectEnglish}
    Capture Page Screenshot
    Click Element  ${Submit}
    Accept Cookies
    Sleep  1s
    Page Should Contain Element  ${PatientHeader}
    Page Should Contain Element  ${ProfessionalHeader}
    Close Browser





