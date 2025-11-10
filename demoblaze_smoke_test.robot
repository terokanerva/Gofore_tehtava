*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser And Go To Demoblaze
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.demoblaze.com/
${BROWSER}    Chrome

${cat_phones}    Phones
${cat_laptops}    Laptops
${cat_monitors}    Monitors

${item_phone}    imgs/HTC_M9.jpg
${item_laptop}    imgs/dell.jpg
${item_monitor}    imgs/apple_cinema.jpg

*** Test Cases ***
Verify MainPage Loads
    Verify Page Is Open

Verify Navigation Links Work
    Verify Link Contact
    Verify Link About Us
    Verify Link Cart
    Verify Link Log In
    Verify Link Sign Up

Verify Product Categories Work
    Open Categorie Phones And Select Item To Cart
    Open Categorie Laptops And Select Item To Cart
    Open Categorie Monitors And Select Item To Cart

Verify Shopping Cart Works
    Check Shopping Cart

*** Keywords ***
Open Browser And Go To Demoblaze
    [Documentation]    Opens browser and go to Demoblaze web page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Verify Page Is Open
    [Documentation]    Verifies that Demoblaze page is open and check main elements
    Page Should Contain    PRODUCT STORE
    Wait Until Page Contains Element    carouselExampleIndicators
    Page Should Contain Element    cat
    Page Should Contain Element    tbodyid
    Page Should Contain Element    prev2
    Page Should Contain Element    next2
    Page Should Contain Element    footc

Verify Link Contact
    [Documentation]    Opens and verifies dialog Contact opens
    Click Element    xpath=//a[normalize-space(text())="Contact"]
    Page Should Contain Element    exampleModal
    Log    Modal Contact opens
    Close Modal
    Log    Modal closed
    Sleep    2

Verify Link About Us
    [Documentation]    Opens and verifies dialog About us opens
    Click Element    xpath=//a[normalize-space(text())="About us"]
    Page Should Contain Element    videoModal
    Log    Modal Contact opens
    Close Modal
    Log    Modal closed
    Sleep    2

Verify Link Cart
    [Documentation]    Opens view shopping cart and this point it should be empty now
    Click Element    xpath=//a[normalize-space(text())="Cart"]
    Page Should Contain Element    orderModal
    Log    View shopping cart is open
    Click Element    xpath=//a[normalize-space(text())="Home"]

Verify Link Log In
    [Documentation]    Opens and verifies dialog Log in
    Click Element    xpath=//a[normalize-space(text())="Log in"]
    Page Should Contain Element    logInModal
    Log    Modal Log in is open
    Close Modal
    Log    Modal closed

Verify Link Sign Up
    [Documentation]    Opens and verifies dialog Sign up
    Click Element    xpath=//a[normalize-space(text())="Sign up"]
    Page Should Contain Element    signInModal
    Log    Modal Log in is open
    Close Modal
    Log    Modal closed

Open Categorie Phones And Select Item To Cart
    [Documentation]    Clicks catgorie link Phones and select one phone to shopping cart
    Wait Until Page Contains Element    xpath=//div[@id="tbodyid"]
    Sleep    1s
    Select Item To Cart    ${cat_phones}    ${item_phone}
    Add Item To Shopping Cart
    Handle Alert    ACCEPT
    Log    Item added succesfully to shopping cart
    Close Shopping Cart And Return To Homepage

Open Categorie Laptops And Select Item To Cart
    [Documentation]    Clicks catgorie link Laptops and select one laptop to shopping cart
    Wait Until Page Contains Element    xpath=//div[@id="tbodyid"]
    Sleep    1s
    Select Item To Cart    ${cat_laptops}    ${item_laptop}
    Add Item To Shopping Cart
    Handle Alert    ACCEPT
    Log    Item added succesfully to shopping cart
    Close Shopping Cart And Return To Homepage

Open Categorie Monitors And Select Item To Cart
    [Documentation]    Clicks catgorie link Monitors and select one monitor to shopping cart
    Wait Until Page Contains Element    xpath=//div[@id="tbodyid"]
    Sleep    1s
    Select Item To Cart    ${cat_monitors}    ${item_monitor}
    Add Item To Shopping Cart
    Handle Alert    ACCEPT
    Log    Item added succesfully to shopping cart
    Close Shopping Cart And Return To Homepage

Select Item To Cart
    [Arguments]
    ...    ${category}
    ...    ${selected_item}
    Wait Until Keyword Succeeds    60    2    Click Element    xpath=//a[text()="${category}"]
    Wait Until Element Is Visible    xpath=//img[@src="${selected_item}"]    10s
    Scroll Element Into View    xpath=//img[@src="${selected_item}"]
    Wait Until Keyword Succeeds    60    2    Click Element    xpath=//img[@src="${selected_item}"]
    Log    Item picture clicked

Add Item To Shopping Cart
    Wait Until Element Is Visible    xpath=//a[text()="Add to cart"]    10s
    Click Element                    xpath=//a[text()="Add to cart"]
    Log    Button "Add to cart" pressed

Check Shopping Cart
    [Documentation]    Opens view shopping cart and check it's content
    Click Element    xpath=//a[normalize-space(text())="Cart"]
    Page Should Contain Element    orderModal
    Log    View shopping cart is open
    Wait Until Page Contains    1800
    Page Should Contain    Apple monitor 24
    Page Should Contain    Dell i7 8gb
    Page Should Contain    HTC One M9
    Click Element    xpath=//a[normalize-space(text())="Home"]
    Close Shopping Cart And Return To Homepage

Close Shopping Cart And Return To Homepage
    Click Element    xpath=//a[normalize-space(text())="Home"]
    Log    Return to homepage

Close Modal
    Wait Until Page Contains Element    css=div.modal.show button[data-dismiss="modal"]    10s
    Scroll Element Into View         css=div.modal.show button[data-dismiss="modal"]
    ${ok}=    Run Keyword And Return Status    Click Element    css=div.modal.show button[data-dismiss="modal"]
    IF    '${ok}' == 'False'
        ${elem}=    Get WebElement    css=div.modal.show button[data-dismiss="modal"]
        Execute JavaScript           arguments[0].click();    ${elem}
    END
