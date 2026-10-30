*** Settings ***

Library    RequestsLibrary    # Import de la bibliothèque pour les requêtes HTTP
Library    Collections       # Import de la bibliothèque pour la manipulation de collections

*** Variables ***

${Base_URL}    https://mock-api-h0g7.onrender.com/    # URL de base de l'API Test Academy
${API_KEY}     Cle-API-ReqRes-test-academy            # Clé API pour l'authentification
${Id_Utilisateur}     1
${FirstName_Attendu}  George
${LastName_Attendu}   Bluth
${Email_Attendu}      george.bluth@api.testacademy.fr

*** Test Cases ***
Test Requete PUT
    &{headers}=        Create Dictionary    Authorization=Bearer ${API_KEY}
    &{Corps_Requete}=  Create Dictionary    first_name=${FirstName_Attendu}    last_name=${LastName_Attendu}    email=${Email_Attendu}
    ${Reponse}=        PUT    ${Base_URL}api/users/${Id_Utilisateur}    json=${Corps_Requete}    headers=${headers}    expected_status=200
    Log                ${Reponse.json()}
    Dictionary Should Contain Key    ${Reponse.json()}    updatedAt
    ${first_name}=     Get From Dictionary    ${Reponse.json()}    first_name
    Should Be Equal As Strings    ${FirstName_Attendu}    ${first_name}
    ${last_name}=      Get From Dictionary    ${Reponse.json()}    last_name
    Should Be Equal As Strings    ${LastName_Attendu}    ${last_name}
    ${email}=          Get From Dictionary    ${Reponse.json()}    email
    Should Be Equal As Strings    ${Email_Attendu}    ${email}


