*** Settings ***

Library    DateTime   
Library    SeleniumLibrary     
Library    OperatingSystem  
Library    AutoItLibrary 
Library    Excel.Files
Library    DatabaseLibrary


*** Variables ***

${URL}    https://www.makemytrip.com/
${BROWSER}    chrome
${NotificationFrame_Xpath}    //iframe[contains(@title,'notification')]
${Close_Notification_Xpath}    //a[@class='close']   
${LangCardClose_Xpath}    //span[@class='langCardClose']     



*** Keywords ***

Open MakemyTrip Application
    
    Append To Environment Variable    Path    ${EXECDIR}${/}Drivers
    Open Browser    browser=${BROWSER}
    Go To    ${URL}
    Maximize Browser Window
    Set Selenium Implicit Wait    5
       
    
Handle Notification
    Select Frame    ${NotificationFrame_Xpath}
    Click Element    ${Close_Notification_Xpath} 
    Unselect Frame
    sleep    2s
    
    
Handle Language Notification
    Click Element    ${LangCardClose_Xpath}    
    

    
    


