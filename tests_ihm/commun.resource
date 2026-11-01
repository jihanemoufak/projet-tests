*** Settings ***
Library    Selenium2Library
  

*** Variables ***
${URL}    http://livraison3.testacademy.fr
${NAVIGATEUR}    chrome
${LIEN_SE_CONNECTER}    xpath=//a[contains(text(),'Se connecter')]
${SE_DECONNECTER}    xpath=(//a[contains(text(),'Se déconnecter')])[3]
${CHAMP_NOM_UTILISATEUR}  xpath=//input[@name='username']
${CHAMP_MOT_DE_PASSE}    xpath=//input[@name='password']
${UTILISATEUR_VALIDE}    robot
${MOT_DE_PASSE_VALIDE}    robot
${BOUTON_SE_CONNECTER}    css=.homey_login_button
${ZONE_DERREUR}    css=#modal-login .error
${TITRE_PAGE_TABLEAU_DE_BORD}    Tableau de bord - Livraison 3

# ---------- Contacter l'hôte : page de l'annonce (source : form_contact.html / page_listing.html) ----------
${URL_ANNONCE}    ${URL}/index.php/listing/large-and-modern-bedroom/
${TITRE_PAGE_ANNONCE}    Large And Modern Bedroom - Livraison 3

# ---------- Contacter l'hôte : éléments qui ouvrent la modale (source : HTML) ----------
${BOUTON_CONTACTER_HOTE_LATERAL}    xpath=//button[@data-target='#modal-contact-host']
${LIEN_CONTACTER_HOTE_SECTION_HOTE}    xpath=//a[@data-target='#modal-contact-host']

# ---------- Contacter l'hôte : modale (source : HTML) ----------
${MODALE_CONTACT_HOTE}    css=#modal-contact-host
${TITRE_MODALE_CONTACT_HOTE}    css=#modal-contact-host .modal-title
${TEXTE_TITRE_MODALE_CONTACT_HOTE}    Contactez l'hôte
${BOUTON_FERMER_MODALE_CONTACT_HOTE}    css=#modal-contact-host .close
${CHAMP_CONTACT_NOM}    css=#modal-contact-host input[name='name']
${CHAMP_CONTACT_EMAIL}    css=#modal-contact-host input[name='email']
${CHAMP_CONTACT_TELEPHONE}    css=#modal-contact-host input[name='phone']
${CHAMP_CONTACT_MESSAGE}    css=#modal-contact-host textarea[name='message']
${BOUTON_SOUMETTRE_CONTACT}    css=#modal-contact-host .contact_listing_host
${ZONE_MESSAGES_CONTACT}    css=#modal-contact-host .homey_contact_messages

# ---------- Contacter l'hôte : champs cachés rattachant le message à l'annonce (source : HTML) ----------
${CHAMP_CACHE_TITRE_ANNONCE}    css=#modal-contact-host input[type='hidden'][name='listing_title']
${CHAMP_CACHE_PERMALIEN}    css=#modal-contact-host input[type='hidden'][name='permalink']
${TITRE_ANNONCE}    Large And Modern Bedroom

# ---------- Contacter l'hôte : placeholders et libellé du bouton (source : HTML) ----------
${PLACEHOLDER_CONTACT_NOM}    Nom
${PLACEHOLDER_CONTACT_EMAIL}    Email
${PLACEHOLDER_CONTACT_TELEPHONE}    Téléphone
${PLACEHOLDER_CONTACT_MESSAGE}    Message
${TEXTE_BOUTON_SOUMETTRE_CONTACT}    Soumettre

# ---------- Contacter l'hôte : jeu de données (source : Utiliser_IA.side) ----------
${CONTACT_NOM_VALIDE}    MK
${CONTACT_EMAIL_VALIDE}    jmoufak@gmail.com
${CONTACT_TELEPHONE_VALIDE}    0678342908
${CONTACT_MESSAGE_VALIDE}    Test IA

*** Keywords ***
Ouvrir le navigateur et Accéder à l'Application
    Open Browser    ${URL}    ${NAVIGATEUR}
    Maximize Browser Window

Accéder A La page De Connexion
     Click Link    ${LIEN_SE_CONNECTER}
Saisir Le Nom D'Utilisateur
    [Arguments]    ${utilisateur valide}
    Wait Until Element Is Visible    ${CHAMP_NOM_UTILISATEUR}    timeout=15s
    Click Element    ${CHAMP_NOM_UTILISATEUR}
    Input Text    ${CHAMP_NOM_UTILISATEUR}    ${utilisateur valide}
Saisir Le Mot De Passe
    [Arguments]    ${mot de passe}
    Click Element    ${CHAMP_MOT_DE_PASSE}
    Input Password    ${CHAMP_MOT_DE_PASSE}    ${mot de passe}

Soumettre Le Formulaire De Connexion
    Click Button    ${BOUTON_SE_CONNECTER}

# ---------- Contacter l'hôte ----------
Accéder A La Page De L'Annonce
    Go To    ${URL_ANNONCE}
    Wait Until Element Is Visible    ${BOUTON_CONTACTER_HOTE_LATERAL}    timeout=15s
    Title Should Be    ${TITRE_PAGE_ANNONCE}

Ouvrir La Modale Contacter L'Hôte Depuis Le Bouton Latéral
    Wait Until Element Is Visible    ${BOUTON_CONTACTER_HOTE_LATERAL}    timeout=15s
    Click Element    ${BOUTON_CONTACTER_HOTE_LATERAL}

Ouvrir La Modale Contacter L'Hôte Depuis La Section Hôte
    Wait Until Element Is Visible    ${LIEN_CONTACTER_HOTE_SECTION_HOTE}    timeout=15s
    Click Element    ${LIEN_CONTACTER_HOTE_SECTION_HOTE}

Fermer La Modale Contacter L'Hôte
    Wait Until Element Is Visible    ${BOUTON_FERMER_MODALE_CONTACT_HOTE}    timeout=15s
    Click Element    ${BOUTON_FERMER_MODALE_CONTACT_HOTE}

Saisir Le Nom Du Contact
    [Arguments]    ${nom}
    Wait Until Element Is Visible    ${CHAMP_CONTACT_NOM}    timeout=15s
    Click Element    ${CHAMP_CONTACT_NOM}
    Input Text    ${CHAMP_CONTACT_NOM}    ${nom}

Saisir L'Email Du Contact
    [Arguments]    ${email}
    Click Element    ${CHAMP_CONTACT_EMAIL}
    Input Text    ${CHAMP_CONTACT_EMAIL}    ${email}

Saisir Le Téléphone Du Contact
    [Arguments]    ${telephone}
    Click Element    ${CHAMP_CONTACT_TELEPHONE}
    Input Text    ${CHAMP_CONTACT_TELEPHONE}    ${telephone}

Saisir Le Message Du Contact
    [Arguments]    ${message}
    Click Element    ${CHAMP_CONTACT_MESSAGE}
    Input Text    ${CHAMP_CONTACT_MESSAGE}    ${message}

Soumettre Le Formulaire De Contact
    Click Button    ${BOUTON_SOUMETTRE_CONTACT}
