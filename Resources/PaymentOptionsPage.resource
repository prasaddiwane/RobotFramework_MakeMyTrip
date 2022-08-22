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

${PaymentOptionsHeader_XPath}    //*[text()='Payment options']
${UPIPaymentHeader_Xpath}    //div[@class='payment__options__tab']//*[text()='UPI']
${CreditDebitATMHeader_Xpath}    //div[@class='payment__options__tab']//*[text()='Credit/Debit/ATM Card']
${PayLaterHeader_Xpath}    //div[@class='payment__options__tab']//*[text()='Pay Later']
${NetBankingHeader_Xpath}    //div[@class='payment__options__tab']//*[text()='Net Banking']
${GiftCardWalletHeader_Xpath}    //div[@class='payment__options__tab']//*[text()='Gift Cards, Wallets & More']
${EMIHeader_Xpath}    //div[@class='payment__options__tab']//*[text()='EMI']
${GooglePayHeader_Xpath}    //div[@class='payment__options__tab']//*[text()='GooglePay']



*** Keywords ***

Validate Title of Payment Options Page
    
    Wait Until Element Is Visible    ${PaymentOptionsHeader_XPath}    timeout=10s    
    Element Should Be Visible    ${PaymentOptionsHeader_XPath}
    
Validate Payment Options are Present or not
    [Documentation]    Verifies Different Payment Options are Present or Not
    
    Element Should Be Visible    ${UPIPaymentHeader_Xpath}
    
    Element Should Be Visible    ${CreditDebitATMHeader_Xpath}
    
    Element Should Be Visible    ${PayLaterHeader_Xpath}
    
    Element Should Be Visible    ${NetBankingHeader_Xpath}
    
    Element Should Be Visible    ${GiftCardWalletHeader_Xpath}
    
    Element Should Be Visible    ${EMIHeader_Xpath}
    
    Element Should Be Visible    ${GooglePayHeader_Xpath}        
    
    
    


    