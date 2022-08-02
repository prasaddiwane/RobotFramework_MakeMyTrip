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
${ReturnDefaultText_Xpath}    //p[@data-cy='returnDefaultText']



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
    Close All Browsers
    

    

        
       
    
    


    
    


