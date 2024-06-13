*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/ScrollButtonPage
${ClickMe_Button}    //button[contains(text(),'Click Me')]
${ClickMeButton_Result}     //div[@class="message"]



*** Keywords ***
Open de Browser en Website    
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing scroll button page
    Maximize Browser Window
    Sleep    2

Scroll to Button
    [Documentation]    Scroll a button and verifying the result
    Wait Until Element Is Visible    ${ClickMe_Button}   3s
    Scroll Element Into View    ${ClickMe_Button}    
    Log   Scrolled to the button element
    Click Element    ${ClickMe_Button}
    Log   Button clicked
    Sleep    3s
    
    Scroll Element Into View    ${ClickMeButton_Result}
    Wait Until Element Is Visible    ${ClickMeButton_Result}    5s
    Log    Selected the option 1
     



*** Test Cases ***
Scroll to Button and Check it
    [Documentation]    Scroll to button and verifying the action
    Scroll to Button
    Sleep    2s






# Run keyword in the Terminal : robot -d output tests/ScrollButtonPage.robot