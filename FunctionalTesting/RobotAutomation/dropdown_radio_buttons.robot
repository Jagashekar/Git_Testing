*** Settings ***
Library    SeleniumLibrary
Test Teardown    close all browser window
Resource    ../RobotAutomation/resource.robot


*** Variables ***

${url}    https://rahulshettyacademy.com/AutomationPractice/

*** Test Cases ***

Automate dropdowns and radio buttons
    Open Browser    ${url}    Chrome
    Maximize Browser Window
#    Set Selenium Speed    2
    Select Radio Button    radioButton    radio1
    Select Radio Button    radioButton    radio3
    Select Checkbox    checkBoxOption1
    Unselect Checkbox    checkBoxOption1
    Click Element    xpath://select[@name='dropdown-class-example']
    Select From List By Index    xpath://select[@name='dropdown-class-example']    2
    Element Attribute Value Should Be   //option[@value='option2']    value    option2









