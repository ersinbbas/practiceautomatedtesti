*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/KeyPressesPage
${TEXT_BOX}           css:.KeyPresses_inputBox__-5die
${RESULT_FIELD}          css:.KeyPresses_keyPressed__k5B5a
${INPUT_TEXT}   c
${EXPECTED_TEXT}       You pressed: c


*** Keywords ***
Open de Browser en Website
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing key presses page
    Maximize Browser Window
    Sleep    2


Click the input box and send a key press
    # Click the input box
    Click Element    ${TEXT_BOX}

    # Press the key
    Input Text    ${TEXT_BOX}    ${INPUT_TEXT}

    # Verify the result displayed
    Element Should Be Visible    ${RESULT_FIELD}   Log : Result is displayed


Validate the result
    ${result_text}=  Get Text  ${RESULT_FIELD}
    Should Be Equal    ${EXPECTED_TEXT}    ${result_text} 
    # or
    Run Keyword If    '${EXPECTED_TEXT}'=='${result_text}'  Log    OK: The result is correct.   
    ...  ELSE   Log    failed: The result is correct.
     

*** Test Cases ***
Press Button and Check Result
    [Documentation]    Open my learnportal and go to the input screen
    Click the input box and send a key press
    Validate the result
  




# Run keyword in the Terminal : robot -d output tests/KeyPressesPage.robot