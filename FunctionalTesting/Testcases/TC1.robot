*** Settings ***
Library    SeleniumLibrary
Test Setup    First steps to execute in all the testcases
Test Teardown    Close Browser
Resource  ../PO/Generic.robot

*** Variables ***


*** Test Cases ***
iterate and get the card titles
    Collect the cards details from shopping page


*** Keywords ***
Collect the cards details from shopping page
    ${expected_list} =  Create List    Iphone X    Samsung Note 8    Nokia Edge    BlackBerry
    ${actual_elements} =  Get Webelements    css:.card-title
    FOR    ${element}    IN    @{actual_elements}
        Log    ${element.text}
    END

