*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/SelectBoxPage
${SelectBox}  //select
${Option}  Option 2
${Result_Text}   //div[@class="SelectBox_message__MfIha SelectBox_show__Ybh4F"]



*** Keywords ***
Open de Browser en Website    
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing scroll button page
    Maximize Browser Window
    Sleep    2

Select a Box
    [Documentation]    Scroll a button and verifying the result
    Wait Until Element Is Visible    ${SelectBox}   3s

    Select From List By Value    xpath:${SelectBox}    ${Option}
    Log    Selected 'Option 2'
    Sleep    2s

    Wait Until Element Is Visible    ${Result_Text}    5s
    ${Result}=  Get Text    ${Result_Text}
    
    Run Keyword If    '${Result}' == 'You selected: Option 2'  Log    Selected the option 2
    ...  ELSE  Log   failed: The result is correct.
     


*** Test Cases ***
Select a Box and Check it
    [Documentation]    Select to Option 2 and verifying the result
    Select a Box
    Sleep    2s






# Run keyword in the Terminal : robot -d output tests/SelectBoxPage.robot