*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/RadioButtonPage
${RadioButton_1}   css:[id="radio1"]
${RadioButton_Result}     xpath://div[@class='RadioButtons_message__bNdXo RadioButtons_show__WRy13']



*** Keywords ***
Open de Browser en Website    
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing radio button page
    Maximize Browser Window
    Sleep    2

Click Radio Button 1
    [Documentation]    Click a radio button and verifying this selection
    Click Element    ${RadioButton_1}
    Sleep    2s

    Wait Until Element Is Visible    ${RadioButton_Result}    5s
    Log    Selected the option 1
     

*** Test Cases ***
Press Radio Button and Check it
    [Documentation]    Test selecting a radio button and verifying the selection
    Click Radio Button 1
    Sleep    2s










# Run keyword in the Terminal : robot -d output tests/RadioButtonPage.robot