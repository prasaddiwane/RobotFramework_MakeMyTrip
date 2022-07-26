*** Settings ***

Library    DateTime   
Library    SeleniumLibrary     
Library    OperatingSystem  
Library    AutoItLibrary 
Library    Excel.Files
Library    DatabaseLibrary



*** Test Cases ***

TC1_Check GIT
    Log    Hi    
    Log To Console    Hi there...    