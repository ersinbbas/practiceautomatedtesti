*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/shadowdompage


*** Keywords ***
Open de Browser en Website    
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing shadow DOM page
    Maximize Browser Window
    Sleep    2


Interact With Shadow DOM
    Wait Until Page Contains Element    css:#shadow-host    10s
    Execute JavaScript    return document.querySelector("#shadow-host").shadowRoot.querySelector("#shadow-input").value = 'Hello, Shadow DOM!'    
    Sleep    3s

*** Test Cases ***
Shadow Dom
    [Documentation]    Check it
    Interact With Shadow DOM
    Sleep    2s






# Run keyword in the Terminal : robot -d output tests/shadowdompage.robot