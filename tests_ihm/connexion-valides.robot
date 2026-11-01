*** Settings ***
Library    Selenium2Library
Resource    commun.resource


*** Test Cases ***
Le Tableau De Bord Doit Etre Visible Apres Une Connexion Réussie
    [Setup]    Effectuer Une Connexion Réussie
    Vérifier Que Le Tableau De Bord Est Visible
    Effectuer Une Déconnexion Réussie

Le Lien De Connexion Devrait Etre Visible Après Une Déconnexion Réussie
    [Setup]    Effectuer Une Connexion Réussie
    Vérifier Que Le Tableau De Bord Est Visible
    Effectuer Une Déconnexion Réussie 
    Vérifier Que Le Lien De Connexion Est Visible
    

*** Keywords ***
Effectuer Une Connexion Réussie
    Ouvrir le navigateur et Accéder à l'Application
    Accéder A La page De Connexion
    Saisir Le Nom D'Utilisateur    ${UTILISATEUR_VALIDE} 
    Saisir Le Mot De Passe    ${MOT_DE_PASSE_VALIDE}
    Soumettre Le Formulaire De Connexion
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
    Input Password    ${CHAMP_MOT_DE_PASSE}    ${MOT_DE_PASSE_VALIDE}

Soumettre Le Formulaire De Connexion
    Click Button    ${BOUTON_SE_CONNECTER}
Vérifier Que Le Tableau De Bord Est Visible
    Wait Until Element Is Not Visible    ${CHAMP_NOM_UTILISATEUR}
    Title Should Be    ${TITRE_PAGE_TABLEAU_DE_BORD}

Effectuer Une Déconnexion Réussie
    Click Element    ${SE_DECONNECTER}
Vérifier Que Le Lien De Connexion Est Visible
    Wait Until Element Is Visible    ${LIEN_SE_CONNECTER}

