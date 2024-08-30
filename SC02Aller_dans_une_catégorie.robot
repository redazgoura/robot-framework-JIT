*** Settings ***
Library           SeleniumLibrary
Library           Collections
Name              Aller_dans_une_categorie

*** Variables ***
${DELAY}   10s
${URL_Search}    https://www.jumia.ma/ 
${URL}    https://www.jumia.ma/ordinateurs-accessoires-informatique/


*** Keywords ***
Humanize Delay
    Sleep  ${DELAY}

*** Test Cases ***
CT07-Accès à la catégorie via le menu principal
    Open Browser    https://www.jumia.ma/    edge

    Maximize Browser Window

    # Wait until the "pop up" window is visible
    Wait Until Element Is Visible  css:#pop .cls  5s
    Humanize Delay
    Click Element  css:#pop .cls

    # Wait until the "Informatique" category link is present
    Wait Until Element Is Visible  xpath=//a[@href='/ordinateurs-accessoires-informatique/']//span[text()='Informatique']  10s

    # Introduce a delay to simulate human interaction
    Humanize Delay

    # Click the "Informatique" category link
    Click Element  xpath=//a[@href='/ordinateurs-accessoires-informatique/']//span[text()='Informatique']

    Humanize Delay
    Close Browser

CT08-Accès à une catégorie via la barre de recherche    
    Open Browser  about:blank  edge
    Maximize Browser Window

    # Open the target URL and log the action
    Go To  ${URL_Search}

    # Close pop-up window
    Wait Until Element Is Visible  css=#pop .cls  10s
    Humanize Delay
    Click Element  css=#pop .cls
   
    # Locate the search input field
    Wait Until Element Is Visible  id=fi-q  10s
    Humanize Delay
    Input Text  id=fi-q  Informatique

    # Locate and click the search button
    Wait Until Element Is Visible  css=form#search button.btn._prim._md.-mls.-fsh0  10s
    Humanize Delay
    Click Element  css=form#search button.btn._prim._md.-mls.-fsh0

    # Optionally, close the browser if this is the end of the test case
    Humanize Delay
    Close Browser

CT09-Accès à une catégorie via un lien directe
    # Log and start the browser session
    Open Browser  about:blank  edge
    Maximize Browser Window
    
    # Open the target URL and log the action
    Humanize Delay
    Go To  ${URL}

    # Wait until the pop-up close button is clickable, then close the pop-up and log the action
    Wait Until Element Is Visible  css=#pop .cls  10s
    Humanize Delay
    Click Element  css=#pop .cls
    
    Humanize Delay
    # Optionally, close the browser if this is the end of the test case
    Close Browser

