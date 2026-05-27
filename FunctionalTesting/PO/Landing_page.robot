*** Settings ***
Documentation    All the objects and keywords of Landing page

Library    SeleniumLibrary
Library    BuiltIn
Resource    ../PO/Generic.robot



*** Variables ***
${error_message_login}    css:.alert-danger

*** Keywords ***
Fill the login form
    [Arguments]    ${user_name}    ${password}
    Input Text    username    ${user_name}
    Input Password    password    ${password}
    Click Button    signInBtn

wait until element is located in page
    wait until element passed is located on page    ${error_message_login}

verify error message is correct
    ${result}=    Get Text    ${error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${error_message_login}    Incorrect username/password.

Fill the login details and select the user option
    [Arguments]    ${user_name}    ${password}
    Input Text    username    ${user_name}
    Input Password    password    ${password}
    Click Element    css:input[value='user']
    Wait Until Element Contains    id:okayBtn    Okay
    Click Button     id:okayBtn
    Select From List By Value    css:select.form-control    consult
    Select Checkbox    id:terms
    Click Button    id:signInBtn


check payment is successful
    Input Text
