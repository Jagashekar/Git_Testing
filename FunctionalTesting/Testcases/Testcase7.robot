*** Settings ***
Documentation  To validate login form
Library  SeleniumLibrary
Library    Collections
Test Setup        First steps to execute in all the testcases
Test Teardown        Close Browser
Resource  ../PO/Generic.robot
Resource  ../PO/Landing_page.robot
Resource    ../PO/ShopPage.robot
Library    ../Custom_keywords/ShopPage.py

*** Variables ***
${Product_lists}    Samsung Note 8    Nokia Edge

*** Test Cases ***
Validate unSuccessful Login
    [Tags]    Regression

    Landing_page.Fill the login form    ${user_name}    ${invalid_password}
    Landing_page.wait until element is located in page
    Landing_page.verify error message is correct

verify cards display in shopping page
    Landing_page.Fill The Login Form    ${user_name}    ${valid_password}
    ShopPage.wait until element is located in page
    ShopPage.verify cards titles in shop page
    add_items_to_cart_and_checkout    ${Product_lists}
    Select The Card    Samsung Note 8

Select the form and navigate to child window
    Landing_page.Fill the login details and select the user option    ${user_name}    ${valid_password}


*** Keywords ***


