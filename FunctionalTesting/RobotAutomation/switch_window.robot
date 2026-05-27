*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Window switching
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    Chrome
    Click Link    xpath://div/a[1]
    Set Selenium Speed    3
    ${new_title}=    Get Title
    Switch Window    title=${new_title}
    Click Element    //li/a[contains(text(),'Home')]
    Sleep    3
    Close All Browsers

    Capture Element Screenshot    xpath://div/a[1]    C:/Users/HP/Desktop/SCREENSHOT/WINDOW.PNG

    Execute Javascript    window.scroll to(0,400)