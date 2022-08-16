*** Settings ***

Library    DateTime   
Library    SeleniumLibrary     
Library    OperatingSystem  
Library    AutoItLibrary 
Library    Excel.Files
Library    DatabaseLibrary
Library    String    
Resource    ../Resources/CommonFunctionalities.resource
Resource    ../Resources/HomePage.resource
Resource    ../Resources/BookFlightPage.resource
Resource    ../Resources/CompleteBookingPage.resource

*** Variables ***
${FROM_Indian_CITY}    Mumbai
${TO_Indian_CITY}    Chennai
${Departure_MonthYear}    November 2022
${Departure_Date}    04
${AdultTravellers}    2
${ChildTravellers}    2
${InfantsTravellers}    2
${TravelClass}    Economy

*** Test Cases ***

MMT-FLIGHTS-TC-001   
    [Documentation]
    ...    This Testcase Verify that Radio button is available and label text of ONEWAY radio button is "ONEWAY".
    
    Open MakemyTrip Application
    
    Run Keyword And Ignore Error    Handle Notification
    
    Handle Language Notification
    
    Verify ONEWAY label
    

MMT-FLIGHTS-TC-002
    [Documentation]
    ...    This Testcase will Verify that ONEWAY radio button selectable and unselectable or not on clicking other radio buttons
        
    Click on ONEWAY RadioBtn and unselect      
    

MMT-FLIGHTS-TC-003
    [Documentation]
    ...    This Testcase will Verify that if on clicking on the label text of ONEWAY, radio button value ONEWAY should be selected.
   
    Click on ONEWAY label 
    
MMT-FLIGHTS-TC-004
    [Documentation]
    ...    This Testcase will Verify that User should able to see "Tap to add a return date for bigger discounts" label under RETURN.
    
    Verify RETURN default Message for ONEWAY
    
MMT-FLIGHTS-TC-005
    [Documentation]
    ...    This Testcase will Verify that If the radio button selectable and unselectable or not on clicking all radio buttons
    
    Verify ROUNDTRIP Radio button
    
MMT-FLIGHTS-TC-006
    [Documentation]
    ...    This Testcase will Verify that If the radio button selectable and unselectable or not on clicking all radio buttons

    Click on ROUNDTRIP and Unselect
    
MMT-FLIGHTS-TC-007
    [Documentation]
    ...    This Testcase will Verify that on clicking on the label text, radio button value should be selected.
    
    Click on ROUNDTRIP Label
    
MMT-FLIGHTS-TC-008
    [Documentation]
    ...    This Testcase will Verify that For ROUNDTRIP Radio button, User should not able to see "Tap to add a return date for bigger discounts" label under RETURN.   

    Verify RETURN default Message for ROUND TRIP   
    
MMT-FLIGHTS-TC-009
    [Documentation]
    ...    This Testcase will Verify that  Radio button is available and label text of MULTICITY radio button is "MULTICITY".
    
    Verify MULTI CITY Label
    
MMT-FLIGHTS-TC-010
    [Documentation]
    ...    This Testcase will Verify if the radio button selectable and unselectable or not on clicking on other radio buttons.( for MULTICITY)
    
    Click on MULTI CITY and Unselect
    
MMT-FLIGHTS-TC-011
    [Documentation]
    ...    This Testcase will Verify that on clicking on the label text, radio button value should be selected.
    
    Click on MULTICITY Label
    
MMT-FLIGHTS-TC-012
    [Documentation]
    ...    This Testcase will Verify 'FROM' combo box should be available on page.
    Open MakemyTrip Application
    
    Run Keyword And Ignore Error    Handle Notification
    
    Handle Language Notification
    
    Verify FROM combobox
    
MMT-FLIGHTS-TC-013
    [Documentation]
    ...    This Testcase will Verify that 'FROM' placeholder is available  or not.
    
    Verify FROM Placeholder
   
MMT-FLIGHTS-TC-014
    [Documentation]
    ...    This Testcase will Verify that User is able to search City on Search Box(for FROM).
    
    Search FROM City

MMT-FLIGHTS-TC-015
    [Documentation]
    ...    This Testcase will Verify that Searched City from Combo box and Selected City is same(for FROM).
    
    Verify FROM Search city    Mumbai
    

MMT-FLIGHTS-TC-016
    [Documentation]
    ...    This Testcase will Verify that User is able to book Flights after giving required inputs.(FOR ONEWAY TRIP)
    
    Log    ${TEST_NAME}
    
    Open MakemyTrip Application
    
    Run Keyword And Ignore Error    Handle Notification
    
    Handle Language Notification
    
    Click on ONEWAY label
    
    #Click on FROM Button
    Verify FROM Placeholder
    
    #Input FROM City
    Verify FROM Search city    ${FROM_Indian_CITY}
    
    #Input TO CIty
    Verify TO Search city    ${TO_Indian_CITY}
   
    DEPARTURE DATE    ${Departure_MonthYear}    ${Departure_Date}
    
    Select Travellers    ${AdultTravellers}    ${ChildTravellers}    ${InfantsTravellers}
    
    #Select options from (Economy,Premium,Business)
    Select Travel Class    ${TravelClass}
    
    HomePage.Click on SEARCH Button
    
    Run Keyword And Ignore Error    Handle Lock Price&Pay Later! Notification      
    
    #Validate Title of the Page    ${FROM_Indian_CITY}    ${TO_Indian_CITY}
    
    Get Flights Layover Info
    
    Click on VIEW PRICES Button
    
    Click on BOOK NOW BUTTON
    
    Validate Title of Complete your booking Page
    
    Add Adult Travellers Details    ${AdultTravellers}   
    
    Verify Child Travellers are added and Add Child Travellers Details    ${ChildTravellers} 
    
    Verify Infant Travellers are added and Add Infant Travellers Details    ${InfantsTravellers}    ${ChildTravellers}  
    
    Input Booking Details-Mobile No,Email
    
    Click on CONTINUE Button
    
    Accept the Necessary Changes 
    
    Click on CONTINUE Button  
    
    Click on CONFIRM button
    
    Run Keyword And Ignore Error    Verify No of Flights and Select The Seat
    
    Click on PROCEED TO PAY Button
    
     
    
    
    
    

TC_DEMO
   
    #${Departure_Date}    Convert To Integer    ${Departure_Date}      
    Log    ${Departure_Date}        
    ${Departure_Date}    Evaluate    ${Departure_Date}+1    
    Log    ${Departure_Date}  
    

TC_DEMO_1
        
    ${rndstr}    Generate Random String    length=5    chars=[LETTERS]
    Log    ${rndstr} 
    
    
    

    