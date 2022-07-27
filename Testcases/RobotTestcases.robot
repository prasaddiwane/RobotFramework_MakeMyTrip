*** Settings ***

Library    DateTime   
Library    SeleniumLibrary     
Library    OperatingSystem  
Library    AutoItLibrary 
Library    Excel.Files
Library    DatabaseLibrary
Resource    ../Resources/CommonFunctionalities.resource
Resource    ../Resources/HomePage.resource


*** Test Cases ***

MMT-FLIGHTS-TC-001   
    [Documentation]
    ...    This Testcase Verify that Radio button is available and label text of ONEWAY radio button is "ONEWAY".
    
    Open MakemyTrip Application
    
    Run Keyword And Ignore Error    Handle Notification
    
    Verify ONEWAY label
    

MMT-FLIGHTS-TC-002
    [Documentation]
    ...    This Testcase Verify that ONEWAY radio button selectable and unselectable or not on clicking other radio buttons
        
    Click on ONEWAY RadioBtn and unselect      
    

MMT-FLIGHTS-TC-003
    [Documentation]
    ...    This Testcase Verify that if on clicking on the label text of ONEWAY, radio button value ONEWAY should be selected.
   
    Click on ONEWAY label 
      