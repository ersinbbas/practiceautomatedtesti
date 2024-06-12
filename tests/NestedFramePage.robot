*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/NestedFramePage
${TOP_IFRAME}          //iframe [1]
${FRAME_TEXT}            //body[contains(text(), "Top Frame")]


*** Keywords ***
Open de Browser en Website
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing nested frame page
    Maximize Browser Window
    Sleep    3s

     

*** Test Cases ***





# Run keyword in the Terminal : robot -d output tests/NestedFramePage.robot