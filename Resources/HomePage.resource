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
${RoundTripLabel_Xpath}    //li[@data-cy='roundTrip']
${MultiCityLabel_Xpath}    //li[@data-cy='mulitiCityTrip']
${OneWayRadioBtn_Xpath}    (//span[contains(@class,'tabsCircle')])[1]
${RoundTripRadioBtn_Xpath}    (//span[contains(@class,'tabsCircle')])[2]
${MutliCityRadioBtn_Xpath}    (//span[contains(@class,'tabsCircle')])[3]
${ReturnDefaultText_Xpath}    //p[@data-cy='returnDefaultText']\

${FROM_Label_Xpath}    (//span[contains(@class,'lbl_input latoBold')])[1]
${FROM_City_Xpath}    //*[@id='fromCity']
${TO_Label_Xpath}    (//span[contains(@class,'lbl_input latoBold')])[2]
${DEPARTURE_Xpath}    (//span[contains(@class,'lbl_input latoBold')])[3]
${RETURN_Xpath}    (//span[contains(@class,'lbl_input latoBold')])[4]        
${TRAVELLERS&CLASS_Xpath}    (//span[contains(@class,'lbl_input latoBold')])[5]
${FROM_Placeholder_Xpath}    //input[@placeholder='From']
${CityFromList_Xpath}    (//ul[@role='listbox']/li)[1]


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
     
 


                     
    

        
       
    
    


    
    


