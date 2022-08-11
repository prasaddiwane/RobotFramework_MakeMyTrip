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
${Exp_TitleofCompleteYourBookingPage}    Complete your booking
${TitleofCompleteYourBooking_XPath}    //h2[contains(@class,'headerTitle')]




*** Keywords ***

Validate Title of Complete your booking Page
    
    Sleep    2s    
    Switch Window    NEW
    Wait Until Element Is Visible    ${TitleofCompleteYourBooking_XPath}    
    ${TitleofCompleteYourBooking}    Get Text    ${TitleofCompleteYourBooking_XPath}
    Should Be Equal As Strings    ${Exp_TitleofCompleteYourBookingPage}    ${TitleofCompleteYourBooking}
    
Add Adult Travellers Details
    [Arguments]    ${AdultTravellers} 
    
    Scroll the Page    1000   
    Set Local Variable    ${count}    1 
    FOR    ${counter}    IN RANGE    0    ${AdultTravellers}
    
           
         Wait Until Element Is Visible    //button[contains(text(),'ADD NEW ADULT')]
         Click Element    //button[contains(text(),'ADD NEW ADULT')]    
         Input Text    (//input[@placeholder='First & Middle Name'])[${count}]    Sunny    
         
         Click Element    (//div[@class='selectTab '])[${count}]//label[1]    
         ${count}    Evaluate    ${count}+1       
    END  
    
    

        
    