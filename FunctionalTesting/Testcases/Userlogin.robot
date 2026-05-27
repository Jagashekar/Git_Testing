*** Settings ***
Documentation     E‑commerce Login Window – Automated tests (positive, negative, security, stability)
Library           SeleniumLibrary
Test Setup        Open Browser To Login Page
Test Teardown     Close Browser



*** Variables ***
${URL}            http://localhost:5000
${BROWSER}        chrome
${VALID_USER}     alice@shop.com
${VALID_PASS}     SecurePass123
${LOCK_USER}      bob_builder
${LOCK_PASS}      ToolTime99

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    E‑commerce Login

Attempt Login
    [Arguments]    ${username}    ${password}
    Input Text    name=username    ${username}
    Input Text    name=password    ${password}
    Click Button    //button[text()='Login']

Get Message Text
    ${msg}=    Get Text    css=.error, .success
    [Return]    ${msg}

*** Test Cases ***

Positive Login – Valid Credentials
    [Documentation]    Verify successful login with correct username and password.
    Attempt Login    ${VALID_USER}    ${VALID_PASS}
    Wait Until Page Contains    ✅ Login successful! Welcome back.

Negative Login – Wrong Password
    [Documentation]    Existing user with wrong password.
    Attempt Login    ${VALID_USER}    wrongpassword
    Wait Until Page Contains    ❌ Invalid username or password

Negative Login – Non‑existent User
    [Documentation]    Username not in database.
    Attempt Login    ghost@unknown.com    anypass
    Wait Until Page Contains    ❌ Invalid username or password

Negative Login – Empty Fields
    [Documentation]    Both fields empty.
    Attempt Login    ${EMPTY}    ${EMPTY}
    Wait Until Page Contains    ❌ Invalid username or password

Security – SQL Injection in Username
    [Documentation]    Attempt SQL injection payload.
    Attempt Login    ' OR '1'='1 --    dummy
    Wait Until Page Contains    ❌ Invalid characters in input

Security – XSS Attempt in Username
    [Documentation]    Try script injection.
    Attempt Login    <script>alert('XSS')</script>    pass
    Wait Until Page Contains    ❌ Invalid characters in input

Security – Account Lockout After 3 Failures
    [Documentation]    Three wrong attempts lock the account.
    FOR    ${i}    IN RANGE    3
        Attempt Login    ${LOCK_USER}    wrong
        Wait Until Page Contains    ❌ Invalid username or password
    END
    # Fourth attempt (even correct) should be locked
    Attempt Login    ${LOCK_USER}    ${LOCK_PASS}
    Wait Until Page Contains    🔒 Account locked. Try again in

Stability – Long Input Does Not Crash
    [Documentation]    Send a very long username (5000 chars) – server must not break.
    ${long_str}=    Evaluate    "A" * 5000
    Attempt Login    ${long_str}    pass
    # Should not crash; either invalid chars or invalid user – but no 5xx error in UI
    Page Should Contain Element    css=.error, .success

Stability – Repeated Rapid Logins
    [Documentation]    Send 20 requests quickly – app remains responsive.
    FOR    ${i}    IN RANGE    20
        Attempt Login    user${i}@test.com    pass
        # Wait a tiny moment for page refresh
        Sleep    0.2s
        Go To    ${URL}
    END
    Title Should Be    E‑commerce Login