*** Settings ***
Documentation    To validate login form
Library    SeleniumLibrary

*** Variables ***
${error_message_login}    css:.alert-danger

*** Test Cases ***
Validate unSuccessful Login
    [Tags]    Regression
    open the browser with mortgage payment url
    Fill the login form
    wait until it checks and displays error message
    verify error message is correct


*** Keywords ***
open the browser with mortgage payment url
    Open Browser  https://rahulshettyacademy.com/loginpagePractise/    Chrome
    Maximize Browser Window

Fill the login form
    Input Text    username    rahulshettyacademy
    Input Text    password    12345
    Click Button    signInBtn

wait until it checks and displays error message
    Wait Until Element Is Visible    ${error_message_login}

verify error message is correct
    ${result}=    Get Text    ${error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${error_message_login}    Incorrect username/password.


