*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/AlertPage
${Show_Alert}   xpath=//button[contains(text(),'Show Alert')]
${Show_Confirm}   xpath=//button[contains(text(),'Show Confirm')]
${Show_Prompt}   xpath=//button[contains(text(),'Show Prompt')]
${Show_Prompt_InputText}   practiceautomatedtesting.com

*** Keywords ***
Open de Browser en Website
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing Alert Page
    Maximize Browser Window
    Sleep    2


*** Test Cases ***

Handle Show Alert
    [Documentation]    Open my learnportal and handle the alerts

    # Locate the Show Alert button and click it
    Wait Until Element Is Visible    ${Show_Alert}    5s
    Click Button    ${Show_Alert}
    Log    Show Alert button clicked  
    Sleep  2s

    # Handle the "Show Alert" button
    ${alert_message1}=    Handle Alert  action=ACCEPT
    # Alert Should Be Present    action=ACCEPT   timeout=5s
    Log   ${alert_message1}
    Log    Alert button found en accepted
    Sleep    2s
    Run Keyword If    '${alert_message1}' == 'This is a JavaScript alert!'    Log    Alert is visible en accepted
    ...    ELSE    Log    Alert is not visible 


Handle Show Confirm
    # Locate and click the "Show Confirm" button
     Wait Until Element Is Visible   ${Show_Confirm}     10s
     Click Button    ${Show_Confirm}
     Log    Show Confirm button clicked
    
    # Handle the confirm alert
    ${alert_message2}=    Handle Alert  action=ACCEPT    # DISMISS (cancel)
    Log   ${alert_message2}
    Log    Confirm button found en accepted
    Sleep    1s
    Run Keyword If    '${alert_message2}' == 'Do you confirm this action?'    Log    Confirm button is visible en accepted
    ...    ELSE    Log    confirm button is not visible 
    Sleep    1s

    ${alert_message3}=    Handle Alert  action=ACCEPT  
    Log   ${alert_message3}
    Run Keyword If    '${alert_message3}' == 'User confirmed: true'    Log    Second button is visible en accepted
    ...    ELSE    Log    second button is not visible


Handle Show Prompt
    # Locate and click the "Show Prompt" button
    Wait Until Element Is Visible    ${Show_Prompt}    5s
    Click Button    ${Show_Prompt}
    Log    Prompt button clicked
    
    # Handle the prompt alert
    Input Text Into Alert  ${Show_Prompt_InputText}
    ${alert_message4} =  Handle Alert  ACCEPT  5s
    Log    ${alert_message4}
    Sleep    2s
    
    Run Keyword If    '${alert_message4}' == 'User input: '+ '${alert_message4}'    Log    Show Prompt button accepted with input
    ...    ELSE    Log    Show Prompt button did not accept with input
    


# Run keyword in the Terminal : robot -d output tests/HandelAlert.robot
