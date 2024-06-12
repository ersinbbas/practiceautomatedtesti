*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/DragDrop
${DRAG_ME_ELEMENT}      css:[class="draggable "]
${DROP_HERE_ELEMENT}      css:[class="dropzone"]
${RESULT_TEXT}     😊


*** Keywords ***
Open de Browser en Website
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing
    Maximize Browser Window
    Sleep    2


*** Test Cases ***
Perform Drag and Drop

    [Documentation]    Open my learnportal and go to the input screen

    # Wait until the draggable and the drop target element are present
    Wait Until Element Is Visible    ${DRAG_ME_ELEMENT}    5s
    Wait Until Element Is Visible    ${DROP_HERE_ELEMENT}   5s

    # Perform drag and drop action
    Drag And Drop    ${DRAG_ME_ELEMENT}    ${DROP_HERE_ELEMENT}
    Sleep    2s

    # Check if the drop zone contains the desired text
    ${dropzone_text}=  Get Text    ${DROP_HERE_ELEMENT}
    Should Contain    ${dropzone_text}    ${RESULT_TEXT}   Test Failed: Dropzone does not contain the emoji 😊




# Run keyword in the Terminal : robot -d output tests/DragAndDrop.robot