*** Settings ***

Library    DateTime   
Library    SeleniumLibrary     
Library    OperatingSystem  
Library    AutoItLibrary 
Library    Excel.Files
Library    DatabaseLibrary
Resource    ../Resources/CommonFunctionalities.resource


*** Test Cases ***

TC1
    
    Open MakemyTrip Application
    Run Keyword And Ignore Error    Handle Notification
     
     