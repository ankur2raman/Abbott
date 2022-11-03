*** Settings ***
Library  SeleniumLibrary
Resource  ${EXECDIR}/Resources/Variable.robot
*** Keywords ***
Select country and language
    [arguments]  ${SelectCountry}  ${Selectlanguage}
    [documentation]
    [tags]  Functional
    ${ele}    Get WebElement    ${SelectCountry}
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele}
    Sleep  1s
    ${ele1}    Get WebElement    ${Selectlanguage}
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele1}

