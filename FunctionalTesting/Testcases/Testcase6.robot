*** Settings ***
Documentation  To validate login form
Library  SeleniumLibrary
Library    Collections
Test Setup        First steps to execute in all the testcases
Test Teardown        Close Browser
Library    ../Custom_keywords/ShopPage.py
Resource  ../PO/ShopPage.robot
Resource    ../PO/Generic.robot


*** Variables ***
@{Product_list}    Samsung Note 8    Nokia Edge


*** Test Cases ***
#Validate unSuccessful Login
#    [Tags]    Regression
#
#    Fill the login form    ${user_name}    ${invalid_password}
#    wait until element is located in page    ${error_message_login}
##    verify error message is correct

verify cards display in shopping page
    Fill The Login Form    ${user_name}    ${valid_password}    
    wait until element is located in page    ${shop_page_load}
    verify cards titles in shop page
    Add Items To Cart And Checkout    ${Product_list}
#    Select The Card    Samsung Note 8

Select the form and navigate to child window
    Fill the login details and select the user option    ${user_name}    ${valid_password}


*** Keywords ***

Fill the login form
    [Arguments]    ${user_name}    ${password}
    Input Text    username    ${user_name}
    Input Password    password    ${password}
    Click Button    signInBtn

wait until element is located in page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

#verify error message is correct
##    ${result}=    Get Text    ${error_message_login}
##    Should Be Equal As Strings    ${result}    Incorrect username/password.
#    Element Text Should Be    ${error_message_login}    Incorrect username/password.


verify cards titles in shop page
    @{expected_list} =  Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =  Get Webelements    css:.card-title
    ${actual_list} =    Create List    
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actual_list}    ${element.text}
        
    END
    Lists Should Be Equal    ${expected_list}    ${actual_list}

Select The Card
    [Arguments]    ${card_name}
    ${elements} =  Get Webelements    css:.card-title
    ${index} =    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${card_name}' == '${element.text}'
        ${index} =  Evaluate    ${index} + 1
    END
    Click Button    xpath : (//*[@class='card-footer'])[${index}]/button
        

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

