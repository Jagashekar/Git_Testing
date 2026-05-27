*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/
${browser}    Chrome
*** Test Cases ***
Alert handling
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    //input[@id='name']    jagadish
    Click Button    //input[@id='alertbtn']
    Sleep    3
    Handle Alert    accept
#    Handle Alert    dismiss
#    Handle Alert    leave



