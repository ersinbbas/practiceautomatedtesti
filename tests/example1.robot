*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/FormButtonElements
${name}    fetch CSS and XPATH the hard way
${email}    info@learnautomatedtesting.com
${age}    30
${last_message}    We hebben alle plekken succesvol ingevoeld.


*** Keywords ***
Open de Browser en Website
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing
    Maximize Browser Window
    Sleep    2


*** Test Cases ***

Fill Form and Submit
    [Documentation]    Open my learnportal and go to the input screen

    #input (Name) field by xpath
    Input Text    xpath://input[@name="name"]    ${name}
    Log    entered a name

    #input email by css field by xpath

    #input (Email) field by xpath
    Input Text    css:[name="email"]    ${email}
    Log    entered an email


    #input (Age) field by xpath
    Input Text    xpath://input[@name="age"]    ${age}
    Log    add an age
    
    #Click (Submit) Button
    Click Button    css:[type="submit"]

    
    # Wait for the expected text to be present in the DOM
    Wait Until Page Contains Element    xpath=//div[@id='animation']
    ${textForSubmit} =  get text   xpath=//div[@id='animation']

    Run Keyword If  '${textForSubmit}' == '${last_message}'    Log    Text found on the page
    ...    ELSE    Log    Text not found on the page

    Log    Text found on the page


    Close Browser



# Run keyword in the Terminal : robot -d output tests/example1.robot