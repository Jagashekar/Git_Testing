*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Iterate and print
    FOR  ${i}    IN RANGE    1    10    2
        Log    ${i}

    END
