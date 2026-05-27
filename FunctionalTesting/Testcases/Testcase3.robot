*** Settings ***
Documentation    child window functions
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup    First steps to execute in all the testcases
Test Teardown    Close Browser


Resource    ../PO/Generic.robot

*** Variables ***


*** Test Cases ***
validate child window functionality
    [Tags]    smoke
    select the link of child window
    verify the user is switched to child window
    grab the email id from the child window
    Switch to parent window and enter the email


*** Keywords ***
select the link of child window
    Click Link    xpath:(//div/a[1])
    Sleep    5
    
verify the user is switched to child window
    Switch Window    New 
    Element Text Should Be    css:h1    DOCUMENTS REQUEST


grab the email id from the child window
    ${text} =    Get Text    css:.red
    @{words} =    Split String    ${text}    at
    ${text_split} =    Get From List   ${words}    1
    Log    ${text_split}
    @{words_2} =    Split String    ${text_split}
    ${email} =  Get From List    ${words_2}   0
    Set Global Variable    ${email}

Switch to parent window and enter the email
    Switch Window      Main
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    username    mentor@rahulshettyacademy.com
    Sleep              5





    


