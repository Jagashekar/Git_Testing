*** Settings ***
Documentation    To validate login form
Library    SeleniumLibrary
Library    DataDriver    ../Testdata/Data_new.csv
Resource    ../PO/Generic.robot
Suite Setup    First steps to execute in all the testcases
Suite Teardown    Close Browser
Test Template    Validate unSuccessful Login

*** Variables ***
${error_message_login}    css:.alert-danger

*** Test Cases ***
login with user ${user_name} and password ${password}    xyv    123456


*** Keywords ***
Validate unSuccessful Login
    [Tags]    Regression
    [Arguments]    ${user_name}    ${password}
    open the browser with mortgage payment url
    Fill the login form    ${user_name}    ${password}
    wait until it checks and displays error message
    verify error message is correct

open the browser with mortgage payment url
    Open Browser  https://rahulshettyacademy.com/loginpagePractise/  Chrome
    Maximize Browser Window

Fill the login form
    [Arguments]    ${user_name}    ${password}
    Input Text    username    ${user_name}
    Input Password    password    ${password}
    Click Button    signInBtn

wait until it checks and displays error message
    Wait Until Element Is Visible    ${error_message_login}

verify error message is correct
    ${result}=    Get Text    ${error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${error_message_login}    Incorrect username/password.


