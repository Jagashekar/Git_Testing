*** Settings ***
Documentation    All the objects and keywords of shopping page

Library    SeleniumLibrary
Library    Collections
Resource    ../PO/Generic.robot

*** Variables ***
${shop_page_load}    css:.nav-link

*** Keywords ***

wait until element is located in page
    wait until element passed is located on page    ${shop_page_load}

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
    @{elements} =  Get Webelements    css:.card-title
    ${index} =    Set Variable    1
    FOR    ${element}    IN    ${elements}
        Exit For Loop If    '${card_name}' == '${element.text}'
        ${index} =  Evaluate    ${index} + 1
    END
    Click Button    xpath : (//*[@class='card-footer'])[${index}]/button