*** Settings ***
Library  SeleniumLibrary
Library  Collections
Name    Choisir_un_produit

*** Variables ***
${DELAY}  5s
${URL}    https://www.jumia.ma/
${PRODUCT_XPATH}  //a[@href='/msi-katana-17-b13vgk-16gb1tb-i9-13900h-rtx-40708gb-gddr6-black-azerty-remis-a-neuf-65226237.html']
${INFORMATIQUE_CAT_XPATH}  //div//a[@href='/ordinateurs-accessoires-informatique/']//span[text()='Informatique']
${PC_GAMER_XPATH}  //a[text()='Pc Gamer et composants']
${PRODUCT_XPATH_2}  //a[@href='/xiaomi-monitor-a22i-black-64643040.html']
${POPUP_CLOSE_CSS}  css:#pop .cls


*** Keywords ***
Humanize Delay
    Sleep  ${DELAY}

*** Test Cases ***
CT10-Rechercher un Produit par Nom
    # Start the browser session
    Open Browser  about:blank  edge
    Maximize Browser Window

    # Open the target URL and log the action
    Go To  ${URL}

    # Close pop-up window
    Wait Until Element Is Visible  css=#pop .cls  10s
    Humanize Delay
    Click Element  css=#pop .cls

    # Locate the search input field
    Wait Until Element Is Visible  id=fi-q  10s
    Humanize Delay
    Input Text  id=fi-q  Msi Katana 17 B13VGK 16GB/1TB I9-13900H RTX 4070/8GB GDDR6 BLACK AZERTY Remis à Neuf

    # Locate and click the search button
    Wait Until Element Is Visible  css=form#search button.btn._prim._md.-mls.-fsh0  10s
    Humanize Delay
    Click Element  css=form#search button.btn._prim._md.-mls.-fsh0

    # Click the specific product link
    Wait Until Element Is Visible  ${PRODUCT_XPATH}  20s
    Humanize Delay
    Click Element  ${PRODUCT_XPATH}

    # Wait for 10 seconds before closing the browser
    Sleep  10s

    # Close the browser
    Close Browser

CT11-Recherche d'un Produit par Catégorie
    # Start the browser session
    Open Browser  about:blank  edge
    Maximize Browser Window

    # Open the target URL and log the action
    Go To  ${URL}

    # Close pop-up window if present
    Wait Until Element Is Visible  ${POPUP_CLOSE_CSS}  10s
    Humanize Delay
    Click Element  ${POPUP_CLOSE_CSS}

    # Click the link to "Informatique" category
    Wait Until Element Is Visible  ${INFORMATIQUE_CAT_XPATH}  20s
    Humanize Delay
    Mouse Over  ${INFORMATIQUE_CAT_XPATH}

    # Click "Pc Gamer et composants"
    Wait Until Element Is Visible  ${PC_GAMER_XPATH}  20s
    Humanize Delay
    Click Element  ${PC_GAMER_XPATH}

    # Scroll to the preferred product
    Execute Javascript  window.scrollTo(0, 300)

    # Wait for the element to be present in the DOM and visible 
    Wait Until Element Is Visible  ${PRODUCT_XPATH_2}  20s
    Humanize Delay
    Click Element  ${PRODUCT_XPATH_2}

    # Wait before closing the window
    Sleep  30s

    # Close the browser
    Close Browser

CT12-Appliquer des Filtres aux Résultats de Recherche
    
    # Open the target URL and log the action
    Open Browser  about:blank  edge
    Maximize Browser Window
    Go To  ${URL}

    # Close pop-up window if present
    Wait Until Element Is Visible  ${POPUP_CLOSE_CSS}  10s
    Humanize Delay
    Click Element  ${POPUP_CLOSE_CSS}

    # Click the link to "Informatique" category
    Wait Until Element Is Visible    xpath=//a[@href='/ordinateurs-accessoires-informatique/']//span[text()='Informatique']    20s
    Mouse Over    xpath=//a[@href='/ordinateurs-accessoires-informatique/']//span[text()='Informatique']

    # Click on 'Pc Gamer et composants'
    Wait Until Element Is Visible    xpath=//a[text()='Pc Gamer et composants']    20s
    Click Element    xpath=//a[text()='Pc Gamer et composants']

    # Scroll to the preferred product
    Execute Javascript  window.scrollTo(0, 200)

    # Open the dropdown menu
    Wait Until Element Is Visible    xpath=//label[@for='dpdw-sort']    30s
    Click Element    xpath=//label[@for='dpdw-sort']
    
    # Click "Les mieux notés"
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Les mieux notés')]    20s
    Click Element    xpath=//a[contains(text(),'Les mieux notés')]

    # Scroll down to the preferred product
    Execute JavaScript    window.scrollTo(0, 600)

    # Click the preferred product
    Wait Until Element Is Visible    xpath=//a[@href='/ecran-27-pouces-full-hd-ips-75hz-led-freesync-gaming-monitor-s2721hn-dell-mpg963687.html']    20s
    Click Element    xpath=//a[@href='/ecran-27-pouces-full-hd-ips-75hz-led-freesync-gaming-monitor-s2721hn-dell-mpg963687.html']

    # Wait before closing the window
    Sleep  20s

    # Close the browser
    Close Browser