*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/HoverToClickButton
${Hover_Element_Field}     css:[class="HoverToClickButton_hoverText__wtIgh"]
${Hidden_Button}     css:[class="HoverToClickButton_hiddenButton__WL3-l"]

*** Keywords ***
Open de Browser en Website
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing
    Maximize Browser Window
    Sleep    2


Perform Hover
    # Move the mouse to Hover_Element_Field area
    Wait Until Element Is Visible    ${Hover_Element_Field}   5s
    Mouse Over    ${Hover_Element_Field}
    Sleep    2s


Check Hidden Buton
    # Check the visibility of the hidden button
    Wait Until Element Is Visible    ${Hidden_Button}   5s
    ${Hidden_Button_Displayed}=  Run Keyword And Return Status    Element Should Be Visible    ${Hidden_Button}
    Run Keyword If    ${Hidden_Button_Displayed}    Log    OK: Hidden button is now visible.



*** Test Cases ***
Perform and Check Hidden Button
    [Documentation]    Open my learnportal and go to the input screen
    Perform Hover
    Check Hidden Buton
  




# Run keyword in the Terminal : robot -d output tests/HoverToRevealButton.robot