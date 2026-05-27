*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${user_name}      rahulshettyacademy
${invalid_password}       12345
${valid_password}    Learning@830$3mK2
${url}    https://rahulshettyacademy.com/loginpagePractise/



*** Keywords ***
First steps to execute in all the testcases
    Open Browser    ${url}    Chrome
    Maximize Browser Window

wait until element passed is located on page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible   ${page_locator}



