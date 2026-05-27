*** Settings ***
Documentation    Dictionary validation
Library    Collections

*** Test Cases ***
create a dictionary of my profile
    &{data} =    Create Dictionary     name=jagadish    age=38    gender=male
    Log    ${data}
    Dictionary Should Contain Key    ${data}    age
    log    ${data}[name]
    ${Gen}=    Get From Dictionary    ${data}    gender
    log    ${gen}






