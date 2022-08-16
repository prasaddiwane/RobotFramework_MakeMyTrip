*** Settings ***

Library    DateTime   
Library    SeleniumLibrary     
Library    OperatingSystem  
Library    AutoItLibrary 
Library    Excel.Files
Library    DatabaseLibrary
Library    String    


*** Variables ***
${SelectedRadioButton_Xpath}    //li[@class='selected']
${OneWayLabel_Xpath}    //li[@data-cy='oneWayTrip']
${RoundTripLabel_Xpath}    //li[@data-cy='roundTrip']
${MultiCityLabel_Xpath}    //li[@data-cy='mulitiCityTrip']
${OneWayRadioBtn_Xpath}    (//span[contains(@class,'tabsCircle')])[1]
${RoundTripRadioBtn_Xpath}    (//span[contains(@class,'tabsCircle')])[2]
${MutliCityRadioBtn_Xpath}    (//span[contains(@class,'tabsCircle')])[3]
${ReturnDefaultText_Xpath}    //p[@data-cy='returnDefaultText']

${FROM_Label_Xpath}    (//span[contains(@class,'lbl_input latoBold')])[1]
${FROM_City_Xpath}    //*[@id='fromCity']
${TO_City_Xpath}    //*[@id='toCity']
${TO_Label_Xpath}    (//span[contains(@class,'lbl_input latoBold')])[2]
${DEPARTURE_Label_Xpath}    (//span[contains(@class,'lbl_input latoBold')])[3]
${RETURN_Label_Xpath}    (//span[contains(@class,'lbl_input latoBold')])[4] 
${MonthYearValue_Xpath}    (//div[@class='DayPicker-Caption'])[1]       
${TRAVELLERS&CLASS_Xpath}    (//span[contains(@class,'lbl_input latoBold')])[5]
${FROM_Placeholder_Xpath}    //input[@placeholder='From']
${TO_Placeholder_Xpath}    //input[@placeholder='To']
${CityFromList_Xpath}    (//ul[@role='listbox']/li)[1]
${CityTOList_Xpath}    (//ul[@role='listbox']/li)[1]    

#Travellers 
${Travellers&Class_Label_Xpath}    //div[@data-cy='flightTraveller']
${Travellers&Class_APPLY_Btn_Xpath}    //button[text()='APPLY']
${AdultTraveller_Xpath}    ((//ul[contains(@class,'guestCounter')])[1]//li)
${ChildrenTraveller_Xpath}    ((//ul[contains(@class,'guestCounter')])[2]//li)
${InfantTraveller_Xpath}    ((//ul[contains(@class,'guestCounter')])[3]//li)
#Travel Classes
${Economy_Xpath}    //li[@data-cy='travelClass-0']
${PremiumEco_Xpath}    //li[@data-cy='travelClass-1']
${BusinessClass_Xpath}    //li[@data-cy='travelClass-2']




${SEARCH_Btn_Xpath}    //a[text()='Search']

*** Keywords ***


Verify ONEWAY label
    ${OneWayTrip}    Get Text    ${OneWayLabel_Xpath}
    Should Be Equal    ${OneWayTrip}    ONEWAY
    

Click on ONEWAY RadioBtn and unselect
    Click Element    ${RoundTripRadioBtn_Xpath} 
    Click Element    ${OneWayRadioBtn_Xpath}    
    ${OneWayTrip}    Get Text    ${SelectedRadioButton_Xpath}   
    Should Be Equal    ${OneWayTrip}    ONEWAY
    

Click on ONEWAY label
    Click Element    ${RoundTripRadioBtn_Xpath}
    Sleep    1s    
    Click Element    ${OneWayLabel_Xpath}
    ${OneWayTrip}    Get Text    ${SelectedRadioButton_Xpath}   
    Should Be Equal    ${OneWayTrip}    ONEWAY
    
Verify RETURN default Message for ONEWAY
    Click Element    ${RoundTripRadioBtn_Xpath}
    Sleep    1s    
    Click Element    ${OneWayLabel_Xpath}
    sleep    1s
    ${ReturnText}    Get Text    ${ReturnDefaultText_Xpath}
    Should Be Equal    ${ReturnText}    Tap to add a return date for bigger discounts
    Capture Element Screenshot    ${ReturnDefaultText_Xpath}  
    

Verify ROUNDTRIP Radio button
    ${RoundTrip}    Get Text    ${RoundTripLabel_Xpath}
    Should Be Equal    ${RoundTrip}    ROUND TRIP
    
Click on ROUNDTRIP and Unselect
    Click Element    ${RoundTripRadioBtn_Xpath}     
    ${RoundTrip}    Get Text    ${SelectedRadioButton_Xpath}   
    Should Be Equal    ${RoundTrip}    ROUND TRIP
    Click Element    ${OneWayRadioBtn_Xpath}
    ${RadioBtnLabel}    Get Text    ${SelectedRadioButton_Xpath}
    Sleep    2s    
    Should Not Be Equal    ${RadioBtnLabel}    ROUND TRIP
    
Click on ROUNDTRIP Label
    Click Element    ${RoundTripLabel_Xpath}
    Sleep    2s    
    ${RoundTrip}    Get Text    ${SelectedRadioButton_Xpath}   
    Should Be Equal    ${RoundTrip}    ROUND TRIP    
        
Verify RETURN default Message for ROUND TRIP
    Click Element    ${OneWayRadioBtn_Xpath}
    Click Element    ${RoundTripRadioBtn_Xpath}
    Element Should Not Be Visible    ${ReturnDefaultText_Xpath} 
    
Verify MULTI CITY Label
    ${MultiCity}    Get Text    ${MultiCityLabel_Xpath}
    Should Be Equal    ${MultiCity}    MULTI CITY   
    
Click on MULTI CITY and Unselect
    Click Element    ${MutliCityRadioBtn_Xpath}
    ${MultiCity}    Get Text    ${SelectedRadioButton_Xpath}
    Should Be Equal    ${MultiCity}    MULTI CITY            
    Click Element    ${OneWayRadioBtn_Xpath}
    Sleep    1s    
    ${RadioBtnLabel}    Get Text    ${SelectedRadioButton_Xpath}
    Should Not Be Equal    ${RadioBtnLabel}    MULTI CITY  
    
Click on MULTICITY Label
    Click Element    ${MultiCityLabel_Xpath}
    Sleep    2s    
    ${MultiCity}    Get Text    ${SelectedRadioButton_Xpath}
    Should Be Equal    ${MultiCity}    MULTI CITY  
    Close Browser   
    
Verify FROM combobox
    ${FROM}    Get Text    ${FROM_Label_Xpath}
    log    ${FROM} 
    
Verify FROM Placeholder 
    Click Element    ${FROM_Label_Xpath}
    Sleep    2s    
    ${FROM_Placeholder}    Get Element Attribute    ${FROM_Placeholder_Xpath}    placeholder       
    Should Be Equal    ${FROM_Placeholder}    From
    
    
Search FROM City
    Set Local Variable    ${SearchedCity}    Mumbai     
    Input Text    ${FROM_Placeholder_Xpath}    ${SearchedCity}
    sleep    3s
    Element Attribute Value Should Be    ${FROM_Placeholder_Xpath}    value    ${SearchedCity}     
    
Verify FROM Search city
    [Arguments]    ${SearchedCity}
    Set Local Variable    ${SearchedCity}    ${SearchedCity}  
    Input Text    ${FROM_Placeholder_Xpath}    ${SearchedCity}   
    Sleep    2s    
    Click Element    ${CityFromList_Xpath}    
    sleep    2s
    ${City}    Get Element Attribute    ${FROM_City_Xpath}    value
    Should Be Equal    ${City}    ${SearchedCity}    
     

Verify TO Search city
    [Arguments]    ${SearchedCity}
    Set Local Variable    ${SearchedCity}    ${SearchedCity}
    Input Text    ${TO_Placeholder_Xpath}    ${SearchedCity} 
    Sleep    2s
    Click Element    ${CityTOList_Xpath} 
    sleep    2s
    ${City}    Get Element Attribute    ${TO_City_Xpath}    value
    #Should Be Equal    ${City}    ${SearchedCity}
    Should Contain    ${City}    ${SearchedCity}    ignore_case=True    
Click NextMOnth
    Click Element    //span[@aria-label='Next Month']  
    Sleep    1s    
    
Click Date
    [Arguments]    ${Day}
    
    Click Element    ((//div[@class='DayPicker-Month'])[1]//div[@class='DayPicker-Day'])[${Day}]           
    
DEPARTURE DATE
    [Arguments]    ${MonthYear}    ${Day}
   
    Set Local Variable    ${InputMonthYear}    ${MonthYear}
    
    FOR    ${counter}    IN RANGE    0    999
         Wait Until Element Is Visible    ${MonthYearValue_Xpath}    
         ${MonthYearValue}    Get Text    ${MonthYearValue_Xpath}
         Run Keyword If    "${InputMonthYear}"!="${MonthYearValue}"    Click NextMOnth    
         Exit For Loop If    "${InputMonthYear}"=="${MonthYearValue}"
    END  
    Click Date    ${Day} 
    
Select Travellers
    [Arguments]    ${Adult_Travellers}    ${Children_Travellers}    ${Infants_Travellers}
    
    ${Children_Travellers}    Evaluate    ${Children_Travellers}+1    
    ${Infants_Travellers}    Evaluate    ${Infants_Travellers}+1   
     
    Click Element    ${Travellers&Class_Label_Xpath}    
    Sleep    1s
    
    ${AdultTraveller_Xpath}    Catenate    SEPARATOR=    ${AdultTraveller_Xpath}    [${Adult_Travellers}]             
    Click Element    ${AdultTraveller_Xpath} 
    Sleep    1s  
    
    ${ChildrenTraveller_Xpath}    Catenate    SEPARATOR=    ${ChildrenTraveller_Xpath}    [${Children_Travellers}]              
    Click Element    ${ChildrenTraveller_Xpath}          
    Sleep    1s  
    
    ${InfantTraveller_Xpath}    Catenate    SEPARATOR=    ${InfantTraveller_Xpath}    [${Infants_Travellers}]        
    Click Element    ${InfantTraveller_Xpath}   
    Sleep    1s
    
Click on Economy Travel Class
    
    Click Element    ${Economy_Xpath}    
    
Click on Premium Economy Travel Class
    
    Click Element    ${PremiumEco_Xpath}    
    
Click on Business Travel Class
   
    Click Element    ${BusinessClass_Xpath}    
    
Select Travel Class
    [Arguments]    ${TravelClass}
    
    Sleep    1s    
    Run Keyword If    "${TravelClass}"=="Economy"    Click on Economy Travel Class    ELSE IF    "${TravelClass}"=="Premium"
    ...    Click on Premium Economy Travel Class    ELSE IF    "${TravelClass}"=="Business"    Click on Business Travel Class  
    
    Sleep    2s    
    Click Element    ${Travellers&Class_APPLY_Btn_Xpath}                         
    

Click on SEARCH Button
    Click Element    ${SEARCH_Btn_Xpath}    
     
    


    
    

    
    
         
 


                     
    

        
       
    
    


    
    


