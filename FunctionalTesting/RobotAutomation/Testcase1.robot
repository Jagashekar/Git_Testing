*** Settings ***
Documentation    End to End shopping cart automation
Library    SeleniumLibrary
Library    Collections
Test Setup    first test case to execute in all testcase
Test Teardown    close all browser window
Resource    ../RobotAutomation/resource.robot

*** Variables ***


*** Test Cases ***
Main Page search engine
    search the product from search tab and add all required products
#    open the cart and proceed to check out
#    enter the promo code and apply
#    place the order
#    choose the location to complete the checkout

*** Keywords ***

search the product from search tab and add all required products
    Input Text    xpath://input[@type='search']    a
    Set Selenium Implicit Wait    10
    ${elements}=    Get Webelements    xpath=//button[@type='button']
    FOR    ${element}    IN    ${elements} + 1
            Click Element    xpath=(//button[@type='button'])(${element})
    END








#open the cart and proceed to check out
#
#
#enter the promo code and apply
#
#
#place the order
#
#
#choose the location to complete the checkout
