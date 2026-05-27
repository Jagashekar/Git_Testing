*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/#top
${browser}    Chrome

*** Test Cases ***
Testing frames
    Open Browser  ${url}    ${browser}
    Maximize Browser Window
    Select Frame    //iframe[@name='iframe-name']
    Click Link    /html/body/div/header/div[3]/div/div/div[2]/nav/div[2]/ul/li[2]/a
    Unselect Frame

    Close Browser

    Switch Window

    sw

