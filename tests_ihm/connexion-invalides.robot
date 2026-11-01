*** Settings ***
Library    Selenium2Library 
Resource    commun.resource
Test Template    Un Message D'Erreur Doit Etre Visible Après Une Connexion Incorrecte
Test Setup    Ouvrir le navigateur et Accéder à l'Application

*** Test Cases ***
#cas de test                                             #nom d'utilisateur      #mot de passe
Test Utilisateur Valide Mot De Passe Non Valide          robot                   faux
Test Utilisateur non Valide Mot De Passe Non Valide      faux                    faux
Test Utilisateur non Valide Mot De Passe Valide          faux                    robot
Test Utilisateur Vide Mot De Passe Non Valide            ${EMPTY}                faux
Test Utilisateur Vide Mot De Passe Valide                ${EMPTY}                robot
Test Utilisateur Valide Mot De Passe Vide                robot                   ${EMPTY} 
Test Utilisateur Non Valide Mot De Passe Vide            faux                    ${EMPTY}



*** Keywords ***

Un Message D'Erreur Doit Etre Visible Après Une Connexion Incorrecte
    [Arguments]    ${nom utilisateur}    ${mot de passe}
    Accéder A La page De Connexion
    Saisir Le Nom D'Utilisateur    ${nom utilisateur}
    Saisir Le Mot De Passe    ${mot de passe}
    Soumettre Le Formulaire De Connexion
    Vérifier Que Le Message D'Erreur Est Visible
Vérifier Que Le Message D'Erreur Est Visible
     Wait Until Element Is Visible    ${ZONE_DERREUR}    timeout=15s

