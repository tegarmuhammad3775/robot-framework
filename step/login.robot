*** Settings ***
Library          SeleniumLibrary
Suite Setup      Open Browser    ${WebSauceDemo}  ${BROWSER}
Suite Teardown   Close Browser


*** Variables ***
${WebSauceDemo}    https://www.saucedemo.com/v1/index.html
${BROWSER}         chrome

#Locator
${UsernameField}   //input[@id='user-name']
${PasswordField}   //input[@id='password']
${LoginButton}     //*[@id="login-button"]


*** Keywords ***
Input username    
    Input Text    ${UsernameField}    standard_user
Input password
    Input Text  ${PasswordField}    secret_sauce
Input invalid username    
    Input Text    ${UsernameField}    standard_invalid
Click button login
    Click Element    ${LoginButton}
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
