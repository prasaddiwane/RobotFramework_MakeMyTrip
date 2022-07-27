*** Settings ***

Library    DateTime   
Library    SeleniumLibrary     
Library    OperatingSystem  
Library    AutoItLibrary 
Library    Excel.Files
Library    DatabaseLibrary


*** Variables ***
${SelectedRadioButton_Xpath}    //li[@class='selected']
${OneWayLabel_Xpath}    //li[@data-cy='oneWayTrip']
${OneWayRadioBtn_Xpath}    (//span[contains(@class,'tabsCircle')])[1]
${RoundTripRadioBtn_Xpath}    (//span[contains(@class,'tabsCircle')])[2]
${MutliCityRadioBtn_Xpath}    (//span[contains(@class,'tabsCircle')])[3]



*** Keywords ***


Verify ONEWAY label
    ${OneWayTrip}    Get Text    //li[@data-cy='oneWayTrip']
    Should Be Equal    ${OneWayTrip}    ONEWAY
    

Click on ONEWAY RadioBtn and unselect
    Click Element    ${RoundTripRadioBtn_Xpath} 
    Click Element    ${OneWayRadioBtn_Xpath}    
    ${OneWayTrip}    Get Text    //li[@data-cy='oneWayTrip']   
    


    
    


