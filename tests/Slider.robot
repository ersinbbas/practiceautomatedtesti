*** Settings ***
Library    SeleniumLibrary


Suite Setup    Open de Browser en Website
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.practiceautomatedtesting.com/webelements/Slider
${TARGET_VALUE}    2.5


*** Keywords ***
Open de Browser en Website    
    Open Browser    ${URL}    chrome
    Log   Opened practiceautomated testing Slider page
    Maximize Browser Window
    Sleep    2

Verify Slider
    [Arguments]    ${target_value}
    ${slider}=    Get WebElement    css:.Slider_slider__d1Ld9
    ${min_value}=    Get Element Attribute    ${slider}    min
    ${max_value}=    Get Element Attribute    ${slider}    max
    ${current_value}=    Get Element Attribute    ${slider}    value
    ${step_value}=    Get Element Attribute    ${slider}    step
    ${total_steps}=    Evaluate    (${max_value} - ${min_value}) / ${step_value}
    ${pixels_per_step}=    Evaluate    ${max_value} / ${total_steps}
    Log     Pixels per step: ${pixels_per_step}

    ${move_increment}=    Evaluate    ${pixels_per_step} / 10
    Click Element    ${slider}
    ${i}=    Set Variable    0
    WHILE    ${current_value} < ${TARGET_VALUE}
        Press Key    ${slider}    RIGHT
        Sleep    0.1
        ${current_value}=    Get Element Attribute    ${slider}    value
        Log    Current slider value: ${current_value}
        ${i}=    Evaluate    ${i} + 1
        Exit For Loop If    ${i} > 100  # Prevent infinite loop
    END
    ${final_value}=    Get Element Attribute    ${slider}    value
    Should Be Equal As Numbers    ${final_value}    ${TARGET_VALUE}
     


*** Test Cases ***
Use to Slider and Check it
    [Documentation]    Select to Option 2 and verifying the result
    Verify Slider  2.5
    Sleep    2s






# Run keyword in the Terminal : robot -d output tests/Slider.robot