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
Resource    BookFlightPage.resource

*** Variables ***
${Exp_TitleofCompleteYourBookingPage}    Complete your booking
${TitleofCompleteYourBooking_XPath}    //h2[contains(@class,'headerTitle')]
${AddNewAdultBtn_Xpath}    //button[contains(text(),'ADD NEW ADULT')]
${AddNewChildBtn_Xpath}    //button[contains(text(),'ADD NEW CHILD')]
${AddNewInfantBtn_Xpath}    //button[contains(text(),'ADD NEW INFANT')]

${MobNo_Xpath}    //input[@placeholder='Mobile No']
${Email_Xpath}    //input[@placeholder='Email']
${ContinueBtn_Xpath}    //button[text()='Continue']
${GotItBtn_Xpath}    //button[text()='Got it']
${ConfirmBtn_Xpath}    //button[text()='CONFIRM']

${GreatValueSeatsLabel_Xpath}    //p[text()='We have picked great-value seats for you!']
${YesPleaseBtn_Xpath}    //button[text()='Yes, Please']
${ReviewAddOn_Btn}    //button[@class='reviewAddonsBtn']
${ProceedToPayBtn}    //button[text()='Proceed to pay']    

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
    
           
         Wait Until Element Is Visible    ${AddNewAdultBtn_Xpath}
         Click Element    ${AddNewAdultBtn_Xpath}    
         
         ${rndstr}    Generate Random String    length=5    chars=[LETTERS]   
         Input Text    (//input[@placeholder='First & Middle Name'])[${count}]    ${rndstr}    
         
         Click Element    (//div[@class='selectTab '])[${count}]//label[1]    
         ${count}    Evaluate    ${count}+1   
         
    
    END  
    
Add Child Travellers Details
    [Arguments]    ${ChildTravellers}
    Set Local Variable    ${count}    1
    
    FOR    ${counter}    IN RANGE    0    ${ChildTravellers}
        
    Wait Until Element Is Visible    ${AddNewChildBtn_Xpath}
    Click Element    ${AddNewChildBtn_Xpath}    
    
    ${rndstr}    Generate Random String    length=6    chars=[LETTERS]
    Input Text    (//div[@id='wrapper_CHILD']//input[@placeholder='First & Middle Name'][1])[${count}]    ${rndstr}   
    
    Click Element    (//div[@id='wrapper_CHILD']//div[@class='selectTab '])[${count}]//label[1]        
    ${count}    Evaluate    ${count}+1
    
    END
    
    
Verify Child Travellers are added and Add Child Travellers Details
    [Arguments]    ${ChildTravellers}    
    
    Run Keyword If    "${ChildTravellers}"=="0"    Log    No Child Travellers are added    ELSE    Add Child Travellers Details    ${ChildTravellers}        


Add Infants Travellers Details
    [Arguments]    ${InfantsTravellers}
    Set Local Variable    ${count}    1
    
    FOR    ${counter}    IN RANGE    0    ${InfantsTravellers} 
        
    Wait Until Element Is Visible    ${AddNewInfantBtn_Xpath}
    Click Element    ${AddNewInfantBtn_Xpath}
         
    ${rndstr}    Generate Random String    length=6    chars=[LETTERS]
    Input Text    (//div[@id='wrapper_INFANT']//input[@placeholder='First & Middle Name'])[${count}]    ${rndstr}    
    
    Click Element    (//div[@id='wrapper_INFANT']//div[@class='selectTab '])[${count}]//label[1]    
    
	#Select Date 
	Click Element    ((//div[@class='adultItemSelect'])[${count}]//div[@class='selectInner'])[1]
	Press Keys    None    01
	#Sleep    02    
	Press Keys    None    TAB
	
    #Select Month
    Click Element    ((//div[@class='adultItemSelect'])[${count}]//div[@class='selectInner'])[2]    
	Press Keys    None    Jan
	#Sleep    02    
	Press Keys    None    TAB
	
    #Select Year
    Click Element    ((//div[@class='adultItemSelect'])[${count}]//div[@class='selectInner'])[3]    
	Press Keys    None    2022
	#Sleep    02    
	Press Keys    None    TAB
    
	
        
    ${count}    Evaluate    ${count}+1
    
    END   
    
    
Verify Infant Travellers are added and Add Infant Travellers Details
    [Arguments]    ${InfantsTravellers}
    
    Run Keyword If    "${InfantsTravellers}"=="0"    Log    No Infants Travellers are added    ELSE    Add Infants Travellers Details    ${InfantsTravellers}                
     
Input Booking Details-Mobile No,Email
    
    Input Text    ${MobNo_Xpath}    9175917190    
    
    Input Text    ${Email_Xpath}    prasad@gmail.com 
    Click Element    //div[@class='emailId']       
    
       
Click on CONTINUE Button
    Sleep    3s    
    Wait Until Element Is Visible    ${ContinueBtn_Xpath}    
    Click Element    ${ContinueBtn_Xpath}   
     
    
Accept the Necessary Changes 
    
    Click Element    ${GotItBtn_Xpath}  
    

Click on CONFIRM button
    
    Wait Until Element Is Visible    ${ConfirmBtn_Xpath}    
    Click Element    ${ConfirmBtn_Xpath}
    
Select Seats for Non Stop Flight
    
    Accept Great Value Seats
    
    Click on CONTINUE Button
    
    Click on CONTINUE Button
    
    Review Add ons
    
Select Seats for Connecting Flights
    [Arguments]    ${No_Of_Flight}     
    
    FOR    ${counter}    IN RANGE    0    ${No_Of_Flight}  
        
    Accept Great Value Seats
    
    Click on CONTINUE Button
    
    Accept Great Value Seats
    
    Click on CONTINUE Button
    
    Click on CONTINUE Button
    
    Click on CONTINUE Button
    
    Review Add ons          
  
    END  
    
    
Verify No of Flights and Select The Seat
    
    ${FlightLayoverInfo}    Get Variable Value    ${FlightLayoverInfo}              
    Log    ${FlightLayoverInfo}[0]     
    Set Global Variable    ${No_Of_Flight}    ${FlightLayoverInfo}[0]
    
    Run Keyword If    "${No_Of_Flight}"=="Non"    Select Seats for Non Stop Flight    ELSE    Select Seats for Connecting Flights    ${No_Of_Flight}        
    
    


    
Accept Great Value Seats 
    
    #Wait Until Element Is Visible    ${GreatValueSeatsLabel_Xpath}  
    Sleep    5s    
    Click Element    ${YesPleaseBtn_Xpath}  
    
Review Add ons
    Sleep    3s    
    Click Element    ${ReviewAddOn_Btn}    
    
Click on PROCEED TO PAY Button    
    
    Wait Until Element Is Visible    ${ProceedToPayBtn}    
    Click Element    ${ProceedToPayBtn}        
      
    

        

      
   