*** Settings ***
Library          SeleniumLibrary
Suite Setup      Open Browser    ${WebSauceDemo}  ${BROWSER}
Suite Teardown   Close Browser
Variables        ../resources/login_locator.yaml

*** Variables ***
${WebSauceDemo}    https://www.saucedemo.com/v1/index.html
${BROWSER}         chrome


*** Keywords ***
Input username    
    Input Text    ${txtUsername}    standard_user
Input password
    Input Text  ${txtPassword}    secret_sauce
Input invalid username    
    Input Text    ${txtUsername}    standard_invalid
Click button login
    Click Element    ${btnLogin}
    Sleep   1s
Verify on login page
    Page Should Contain    Products


*** Test Cases ***
User login with valid data
  Input username
  Input password
  Click button login
  Verify on login page

# User login with invalid data
#   Input invalid username
#   Input password
#   Click button login
