*** Settings ***
Documentation    Browser invoke from centralized
Library    SeleniumLibrary


*** Variables ***
${Base_Url}    https://rahulshettyacademy.com/seleniumPractise/#/
${browser}    Chrome


*** Keywords ***
first test case to execute in all testcase
    Open Browser    ${Base_Url}    ${browser}
    Maximize Browser Window

close all browser window
    Close All Browsers

