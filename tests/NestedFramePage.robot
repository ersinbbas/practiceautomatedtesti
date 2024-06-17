*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/NestedFramePage
${TOP_IFRAME}          //iframe[@title='top']
${FRAME_TEXT}            //body[contains(text(), "Top Frame")]


*** Keywords ***
Open de Browser en Website
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing nested frame page
    Maximize Browser Window
    Sleep    3s

Test Nested Frame Page
    [Documentation]    This test case opens a URL, switches to an iframe, checks for text, and performs a hover action.
    Wait Until Element Is Visible    ${TOP_IFRAME}    10s
    Select Frame    ${TOP_IFRAME}
    Log    Switched to iframe with title 'top'
    Wait Until Element Is Visible    ${FRAME_TEXT}    10s
    Element Should Be Visible    ${FRAME_TEXT}
    Log    Frame text 'Top Frame' found
    Mouse Over    ${FRAME_TEXT}
    Log    Hover action performed on the text element
    Sleep    3s     

*** Test Cases ***
Test Nested Frame
    [Documentation]    Test switching to a nested iframe and verifying text inside it
    Test Nested Frame Page
    Sleep    3




# Run keyword in the Terminal : robot -d output tests/NestedFramePage.robot