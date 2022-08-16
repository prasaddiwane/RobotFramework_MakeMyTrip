*** Settings ***

Library    DateTime   
Library    SeleniumLibrary     
Library    OperatingSystem  
Library    AutoItLibrary 
Library    Excel.Files
Library    DatabaseLibrary
Library    String    
Resource    HomePage.resource
Resource    CommonFunctionalities.resource

*** Variables ***
${TitleofBookFlightPage_Xpath}    //p[contains(@class,'journey-title')]
${ViewPricesBtn_Xpath}    (//*[contains(@class,'ViewFareBtn')])[1]
${BookNowBtn_Xpath}    (//button[contains(@class,'buttonPrimary')])[1]
${FlightLayoverInfo_Xpath}    (//*[@class='flightsLayoverInfo'])[1]



*** Keywords ***

Validate Title of the Page
    [Arguments]    ${FROM_Indian_CITY}    ${To_Indian_CITY}   
    Sleep    3s    
    ${TitleofBookFlightPage}    Get Text    ${TitleofBookFlightPage_Xpath}
    Log    ${TitleofBookFlightPage} 
  
    ${Req_TitleofBookFlightPage}    Catenate    Flights from    ${FROM_Indian_CITY}    to    ${To_Indian_CITY}
    Should Be Equal As Strings    ${Req_TitleofBookFlightPage}    ${TitleofBookFlightPage}   
    
Get Flights Layover Info
    
    Wait Until Element Is Visible    ${FlightLayoverInfo_Xpath}    
    ${No_Stops}    Get Text    ${FlightLayoverInfo_Xpath}        
    Set Global Variable    ${No_Stops}    
         
    

Click on VIEW PRICES Button
    
    Wait Until Element Is Visible    ${ViewPricesBtn_Xpath}
    Click Element    ${ViewPricesBtn_Xpath} 
    
    ${FlightLayoverInfo}    Get Text    ${FlightLayoverInfo_Xpath}
    ${FlightLayoverInfo}    Split String    ${FlightLayoverInfo}    
    log    ${FlightLayoverInfo}[0]
    Set Global Variable    ${FlightLayoverInfo}    

Click on BOOK NOW BUTTON
    
    Execute Javascript    ${ScrollingPage}
    
    Wait Until Element Is Visible    ${BookNowBtn_Xpath}    
    Click Element    ${BookNowBtn_Xpath}      
          

    