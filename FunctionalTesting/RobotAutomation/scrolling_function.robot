*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
scrolling page
    Open Browser    https://rahulshettyacademy.com/practice    Chrome
    Maximize Browser Window
    Set Selenium Speed    5
    Execute Javascript    window.scrollTo (0,7000)

