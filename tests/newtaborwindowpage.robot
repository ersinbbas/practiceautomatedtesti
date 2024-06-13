*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/newtaborwindowpage
${OPEN_NEW_TAB_BUTTON}    //button[text()='Open New Tab']
${BODY_ELEMENT}          body
${original_tab}=  Open Browser    ${URL}    chrome

*** Keywords ***
Open de Browser en Website    
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing new tab or window page
    Maximize Browser Window
    Sleep    2


Switch To New Tab And Verify
    Wait Until Element Is Visible    ${OPEN_NEW_TAB_BUTTON}    
    ${handle}=  Switch Window
    Click Element    ${OPEN_NEW_TAB_BUTTON}
    Log    Open New Tab button clicked
    Sleep    2
    
    ${all_tabs}=    Get Window Handles
    
    FOR    ${tab}    IN    @{all_tabs}
        Run Keyword Unless    '${tab}' == '${original_tab}'    Switch Window    ${tab}
    END
    Log    Switched to the new tab

    Wait Until Element Is Visible    css:${BODY_ELEMENT}    10s
    Log    Element found in the new tab
        
    Switch Window  ${handle}
    Sleep    2s
    Log    Closed the new tab and switched back to the original tab

     

*** Test Cases ***
Press Button and Check Result
    [Documentation]    Open my learnportal and go to the input screen
    Switch To New Tab And Verify

# Run keyword in the Terminal : robot -d output tests/newtaborwindowpage.robot