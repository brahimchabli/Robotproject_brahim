*** Settings ***
Library    SeleniumLibrary   
*** Variables ***
${url}=   https://opensource-demo.orangehrmlive.com/index.php/auth/login  
${browser}=    gc

*** Test Cases ***
TC_001_ValidationText
    Open Browser  ${url}      ${browser}    
    Maximize Browser Window
    Input Text    id=txtUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin   
    #Page Should Contain    Dashboard
    Page Should Not Contain    Dashboard845       
    Click Element    id=welcome 
    Sleep    4s
    Click Link    link=Logout 
    Close Browser
              
TC_002_ValidationTextFailed
    Open Browser  ${url}      ${browser}    
    Maximize Browser Window
    #Page Should Contain Textfield    id=txtUsername
    Page Should Not Contain Textfield    id=txtus           
    Input Text    id=txtUsername    Admin
    #Page Should Contain Textfield    id=txtPassword 
    Page Should Not Contain Textfield    id=txt        
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin   
    #Page Should Contain    Dashboard
    Page Should Not Contain    Dashboard845       
    Click Element    id=welcome 
    Sleep    4s
    Click Link    link=Logout 
    Close Browser
  
TC_003_Validationcheckbox
    Open Browser    https://login.salesforce.com/    gc
    Maximize Browser Window
    Click Element    id=rememberUn
    Checkbox Should Be Selected    id=rememberUn  
    Sleep    4s     
    Click Element    id=rememberUn
    Sleep    4s    
    Checkbox Should Not Be Selected    id=rememberUn  
    
TC_004_ValidationMessageerreur
    Open Browser     https://login.salesforce.com/    gc
    Maximize Browser Window
    Input Text    id=username    text
    Input Password    id=password    Abcd
    Sleep    4s    
    Click Button    id=Login
    Sleep    4s    
    #Element Text Should Be    id=error    aVérifiez votre nom d'utilisateur et votre mot de passe. Si vous ne parvenez toujours pas à vous connecter, contactez votre administrateur Salesforce. 
    #Element Text Should Not Be    id=error    aVérifiez votre nom d'utilisateur et votre mot de passe. Si vous ne parvenez toujours pas à vous connecter, contactez votre administrateur Salesforce.  
    #Element Should Contain    id=error    votre nom d'utilisateur et votre mot de passe
    Element Should Not Contain    id=error    votre nom d'utilisateur et votre mot de passe   
    
TC_005_Validationelement
    Open Browser     https://login.salesforce.com/    gc
    Maximize Browser Window 
    Title Should Be    Connexion | Salesforce
    #Element Should Be Enabled    id=username
    #Element Should Be Disabled    id=username
    Element Should Be Visible    id=username    
    
    