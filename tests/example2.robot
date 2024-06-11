*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/Checkboxes



*** Keywords ***
Open de Browser en Website
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing
    Maximize Browser Window
    Sleep    2


*** Test Cases ***

Click Checkbox
    [Documentation]    Open my learnportal and click the checkbox1

    #click checkbox 1 button by xpath
    Click Element    xpath://label[contains(@for,"checkbox1")]   
    Log    checkbox1 clicked
    Sleep   2

    
    # Wait for the expected text to be present in the DOM
    Wait Until Page Contains Element    css=[class="checkbox-label checked"]

    ${result}=    Run Keyword And Return Status    Element Should Be Visible    css=[class="checkbox-label checked"]
    
    Run Keyword If    ${result}    Log    Checkbox1 is clicked
    ...    ELSE    Log    Checkbox1 is not clicked


# Run keyword in the Terminal : robot -d output tests/example2.robot