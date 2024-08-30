*** Settings ***
Library           SeleniumLibrary
Library           Collections
Name              Ajouter_produit_au_panier

*** Variables ***
${DELAY}   5s
${URL}    https://www.jumia.ma/ 
${xiaomi_element}    //a[@href='/xiaomi-monitor-a22i-2145in-24w-max-75hz-aspect-ratio-169-64649885.html']/ancestor::article 
${Xiaomi_ADD_TO_CART_BUTTON_XPATH}    //a[@href='/xiaomi-monitor-a22i-2145in-24w-max-75hz-aspect-ratio-169-64649885.html']/ancestor::article//footer//button[@type='button' and contains(text(),'Ajouter au panier')]

${samsung_element}    //a[@href='/samsung-43-smart-tv-4k-crystal-uhd-serie-7-recepteur-integre-noir-43678616.html']/ancestor::article 
${Samsung_ADD_TO_CART_BUTTON_XPATH}    //a[@href='/samsung-43-smart-tv-4k-crystal-uhd-serie-7-recepteur-integre-noir-43678616.html']/ancestor::article//footer//button[@type='button' and contains(text(),'Ajouter au panier')]
${PLUS_BUTTON_XPATH}    //a[@href='/samsung-43-smart-tv-4k-crystal-uhd-serie-7-recepteur-integre-noir-43678616.html']/ancestor::article//footer//button[@type='button' and @class='btn _prim _qty -pas' and @aria-label='augmenter la quantité panier']

${CART_BUTTON_XPATH}    //a[contains(@href, '/cart/') and contains(., 'Panier')]
${index}    0
${XPATH_PAGE_2}    //div[@class='pg-w -ptm -pbxl']//a[@class='pg' and contains(@aria-label, 'Page 2')]
${XPATH_INCREASE_QUANTITY}    //section[@class='cw']//button[@aria-label="augmenter la quantité panier"]
${XPATH_FINALISER_LA_COMMANDE}    //section[@class='cw']//a[contains(text(), 'Finaliser la commande')]

${XPATH_BALL_MOLTTEN}     //a[@href='/molten-ballon-de-football-en-cuir-synthetique-f5a2600-taille-5-64253679.html']/ancestor::article    
${BALL_MOLTTEN_BUTTON}    //a[@href='/molten-ballon-de-football-en-cuir-synthetique-f5a2600-taille-5-64253679.html']/ancestor::article//footer//button[contains(@class, 'add') and contains(text(),'Ajouter au panier')]

${XPATH_MAILLOT_FOOT}    //a[@href='/generic-maillot-de-football-bellingham-5-real-madrid-202425-homme-et-femme-65421220.html']/ancestor::article 
${MAILLOT_FOOT_BUTTON}     //a[@href='/generic-maillot-de-football-bellingham-5-real-madrid-202425-homme-et-femme-65421220.html']/ancestor::article//footer//button[@type='button' and contains(text(),'Ajouter au panier')]

${XPATH_TV_SAMSUNG}    //a[@href='/samsung-televiseur-55-q60c-qled-4k-qa55q60cauxmv-65144794.html']/ancestor::article
${TV_SAMSUNG_BUTTON}    //a[@href='/samsung-televiseur-55-q60c-qled-4k-qa55q60cauxmv-65144794.html']/ancestor::article//footer//button[contains(@class, 'add') and contains(text(),'Ajouter au panier')]
${TV_SAMSUNG_PLUS_BUTTON}    //a[@href='/samsung-televiseur-55-q60c-qled-4k-qa55q60cauxmv-65144794.html']/ancestor::article//footer//button[@type='button' and @class='btn _prim _qty -pas' and @aria-label='augmenter la quantité panier']    

*** Keywords ***
Humanize Delay
    Sleep  ${DELAY}

Dynamic Scroll To Element
    [Arguments]    ${xpath}
        
        Scroll Element Into View     ${xpath}
        Sleep    1s

Click Button Multiple Times
    [Arguments]    ${locator}    ${times}=10    ${delay}=2s
    
   

    WHILE    ${index} < ${times}
        ${is_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    5s

        IF    ${is_visible}
            Wait Until Element Is Visible    ${locator}
            Click Element    ${locator}
            Sleep    ${delay}
        ${index}    Evaluate    ${index} + 1
        ELSE
            Log    Element is no longer visible after ${index} clicks, stopping the loop.
            BREAK
        END
    END

*** Test Cases ***
CT13-Ajouter un produit disponible
    # Start the browser session & Open the target URL
    Open Browser   ${URL}   edge
    Maximize Browser Window

    # Close pop-up window
    Wait Until Element Is Visible  css=#pop .cls  10s
    Humanize Delay
    Click Element  css=#pop .cls

    Wait Until Element Is Visible    class=cls    20s
    Click Element    class=cls

    # Click the link to "Informatique" category
    Wait Until Element Is Visible    xpath=//a[@href='/ordinateurs-accessoires-informatique/']//span[text()='Informatique']    20s
    Mouse Over    xpath=//a[@href='/ordinateurs-accessoires-informatique/']//span[text()='Informatique']

    # Click on 'Pc Gamer et composants'
    Wait Until Element Is Visible    xpath=//a[text()='Pc Gamer et composants']    20s
    Humanize Delay
    Click Element    xpath=//a[text()='Pc Gamer et composants']
    
    # Scroll To Preferred Product
    Dynamic Scroll To Element   ${xiaomi_element}
    Wait Until Element Is Visible    ${Xiaomi_ADD_TO_CART_BUTTON_XPATH}    10S
    Humanize Delay
    Click Element    ${Xiaomi_ADD_TO_CART_BUTTON_XPATH}

    Wait Until Element Is Visible    ${CART_BUTTON_XPATH}    10S
    Humanize Delay
    Click Element    ${CART_BUTTON_XPATH}

    Sleep    10s
    Close Browser
CT14-Ajouter plusieurs quantités du même produit
    # Start the browser session & Open the target URL
    Open Browser   ${URL}   edge
    Maximize Browser Window

    # Close pop-up window
    Wait Until Element Is Visible  css=#pop .cls  10s
    Humanize Delay
    Click Element  css=#pop .cls

    Wait Until Element Is Visible    class=cls    20s
    Click Element    class=cls

    # Click the link to "Informatique" category
    Wait Until Element Is Visible    xpath=//a[@href='/electronique/']//span[text()='TV & Hi Tech']    20s
    Mouse Over    xpath=//a[@href='/electronique/']//span[text()='TV & Hi Tech']

    # Click on 'Pc Gamer et composants'
    Wait Until Element Is Visible    xpath=//a[text()='Smart TV']    20s
    Humanize Delay
    Click Element    xpath=//a[text()='Smart TV']

    # Scroll To Preferred Product
    
    Dynamic Scroll To Element   ${samsung_element}
    Wait Until Element Is Visible    ${Samsung_ADD_TO_CART_BUTTON_XPATH}    20S
    Humanize Delay
    Click Element    ${Samsung_ADD_TO_CART_BUTTON_XPATH}
    
    # Click plus button multiple times 
    Humanize Delay
    Click Button Multiple Times    ${PLUS_BUTTON_XPATH}

    # Click the cart button 
    Wait Until Element Is Visible    ${CART_BUTTON_XPATH}    10S
    Humanize Delay
    Click Element    ${CART_BUTTON_XPATH}

    # Close the browser after 10s
    Sleep    10s
    Close Browser

CT15-Ajouter plusieurs produits
    # Start the browser session & Open the target URL
    Open Browser   ${URL}   edge
    Maximize Browser Window

    # Close pop-up window
    Wait Until Element Is Visible  css=#pop .cls  10s
    Click Element  css=#pop .cls

    # Locate the "accepter les cookies" button by its text
    Wait Until Element Is Visible    xpath=//button[contains(text(), 'accepter les cookies')]    20s
    Humanize Delay
    Click Button    xpath=//button[contains(text(), 'accepter les cookies')] 

    # Locate the close button and click it
    Wait Until Element Is Visible    xpath=//button[@class='cls' and @aria-label='Fermer la bannière']    20s
    Humanize Delay
    Click Button    xpath=//button[@class='cls' and @aria-label='Fermer la bannière']

    # Click the link to "Sports & Loisirs" category
    Wait Until Element Is Visible    xpath=//a[@href='/sports-loisirs/']//span[text()='Sports & Loisirs']    20s
    Mouse Over    xpath=//a[@href='/sports-loisirs/']//span[text()='Sports & Loisirs']

    # Click on 'Sports d'équipe'
    Wait Until Element Is Visible    xpath=//a[@href='/sports-d-equipe/']    20s
    Humanize Delay
    Click Element     xpath=//a[@href='/sports-d-equipe/']
    
    # Scroll To Preferred Product 1
    Humanize Delay
    Dynamic Scroll To Element   ${XPATH_BALL_MOLTTEN}
    Wait Until Element Is Visible  ${BALL_MOLTTEN_BUTTON}   20s
    Double Click Element    ${BALL_MOLTTEN_BUTTON} 
    

    # Navigate to the second page  
    Humanize Delay
    Dynamic Scroll To Element    ${XPATH_PAGE_2}
    Wait Until Element Is Visible    ${XPATH_PAGE_2}    10s
    Click Element    ${XPATH_PAGE_2}

    # Scroll To Preferred Product 2
    Humanize Delay
    # Dynamic Scroll To Element   //a[@href='/generic-maillot-de-football-bellingham-5-real-madrid-202425-homme-et-femme-65421220.html']/ancestor::article 
    Humanize Delay
    Dynamic Scroll To Element   ${XPATH_MAILLOT_FOOT}
    Wait Until Element Is Visible    ${MAILLOT_FOOT_BUTTON}    20s    
    Double Click Element    ${MAILLOT_FOOT_BUTTON}
    # Wait until the parent div of size M is visible
    Wait Until Element Is Visible    ${XPATH_INCREASE_QUANTITY}    10s
    Wait Until Element Is Enabled    ${XPATH_INCREASE_QUANTITY}    10s
    Click Button Multiple Times    ${XPATH_INCREASE_QUANTITY}    2    2s

    # click the button to get redirected to cart page 
    Humanize Delay
    Wait Until Element Is Visible    ${XPATH_FINALISER_LA_COMMANDE}    10s
    Click Element    ${XPATH_FINALISER_LA_COMMANDE}

    # Close the browser after 10s
    Sleep    10s
    Close Browser

CT16-Vérification du stock avant ajout
     # Start the browser session & Open the target URL
    Open Browser   ${URL}   edge
    Maximize Browser Window

    # Close pop-up window
    Wait Until Element Is Visible  css=#pop .cls  10s
    Click Element  css=#pop .cls
    
     # Locate the "accepter les cookies" button by its text
    Wait Until Element Is Visible    xpath=//button[contains(text(), 'accepter les cookies')]    20s
    Humanize Delay
    Click Button    xpath=//button[contains(text(), 'accepter les cookies')] 

    # Locate the close button and click it
    Wait Until Element Is Visible    xpath=//button[@class='cls' and @aria-label='Fermer la bannière']    20s
    Humanize Delay
    Click Button    xpath=//button[@class='cls' and @aria-label='Fermer la bannière']

    # Click the link to "Sports & Loisirs" category
    Wait Until Element Is Visible    xpath=//a[@href='/electronique/']//span[text()='TV & Hi Tech']    20s
    Mouse Over    xpath=//a[@href='/electronique/']//span[text()='TV & Hi Tech']

    # Click on 'Sports d'équipe'
    Wait Until Element Is Visible    xpath=//a[@href='/mlp-tv-qled/']    20s
    Humanize Delay
    Click Element     xpath=//a[@href='/mlp-tv-qled/']
    
    # Scroll To Preferred Product 1
    Humanize Delay
    Dynamic Scroll To Element   ${XPATH_TV_SAMSUNG}
    Wait Until Element Is Visible    ${TV_SAMSUNG_BUTTON}
    Double Click Element    ${TV_SAMSUNG_BUTTON}
      
    # Click plus button multiple times 
    Humanize Delay
    Click Button Multiple Times    ${TV_SAMSUNG_PLUS_BUTTON}    10    3
    
    # Click the cart button 
    Wait Until Element Is Visible    ${CART_BUTTON_XPATH}    10S
    Humanize Delay
    Click Element    ${CART_BUTTON_XPATH}

    # Close the browser after 10s
    Sleep    10s
    Close Browser