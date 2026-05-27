*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${url}    http://demowebshop.tricentis.com/register
${url_1}    http://automationpractice.com/index.php
${browser}    Chrome
*** Test Cases ***
My Testcase
    Open Browser    ${url}    ${browser}
    Maximize Browser Window


    Open Browser    ${url_1}    ${browser}
    Maximize Browser Window


    Close Browser
