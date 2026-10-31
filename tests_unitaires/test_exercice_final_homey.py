# Tests unitaires pour le système de gestion Homey - À compléter par les étudiants

import unittest
from exercice_final_homey import HomeyManager, Propriete

class TestHomeyManager(unittest.TestCase):
    """
    Classe de tests unitaires pour le système de gestion Homey.
    
    TODO: Complétez les tests en utilisant toutes les assertions apprises :
    - assertEqual, assertTrue, assertFalse  
    - assertIsNone, assertIsNotNone
    - assertIn, assertNotIn
    - assertRaises
    """
    
    def setUp(self):
    
        # TODO: Initialiser self.manager et ajouter quelques propriétés de test
        self.manager = HomeyManager()
        self.propriete1 = self.manager.ajouter_propriete(1, "Villa Océan", 150)
        self.propriete2 = self.manager.ajouter_propriete(2, "Appartement Paris", 100)
        self.propriete3 = self.manager.ajouter_propriete(3, "Maison Bretagne", 120)



    # TODO: Tests pour ajouter_propriete()
    # 1. Test ajout propriété valide (assertEqual)
    def test_ajouter_propriete_valide (self):
        nouvelle_propriete = self.manager.ajouter_propriete(4, "Chalet Montagne", 200)
        self.assertEqual(nouvelle_propriete.nom, "Chalet Montagne")
        self.assertEqual(nouvelle_propriete.prix_par_nuit, 200)
        self.assertTrue(nouvelle_propriete.est_disponible)
        
    # 2. Test ajout propriété avec ID en double (assertRaises)
    def test_ajouter_propriete_id_double(self):
        with self.assertRaises(ValueError):
             self.manager.ajouter_propriete(1, "Nouvelle Villa", 180)

    # 3. Test ajout propriété avec prix négatif (assertRaises)
    def test_ajouter_propriete_prix_negatif(self):
        with self.assertRaises(ValueError):
            self.manager.ajouter_propriete(5, "Villa Samy", -5)

    # TODO: Tests pour supprimer_propriete()
    # 4. Test suppression propriété existante (assertTrue)
    def test_supprimer_propriete_existante(self):
        resultat = self.manager.supprimer_propriete(1)
        self.assertTrue(resultat)
        propriete = self.manager.obtenir_propriete(1)
        self.assertIsNone(propriete)

    # 5. Test suppression propriété inexistante (assertFalse)
    def test_supprimer_propriete_inexistante(self):
        resultat = self.manager.supprimer_propriete(6)
        self.assertFalse(resultat)

    # TODO: Tests pour obtenir_propriete()
    # 6. Test obtention propriété existante (assertIsNotNone)
    def test_obtenir_propriete_existante(self):
        resultat = self.manager.obtenir_propriete(1)
        self.assertIsNotNone(resultat)
        self.assertEqual(resultat.nom, "Villa Océan")

    # 7. Test obtention propriété inexistante (assertIsNone)
    def test_obtenir_propriete_inexistante(self):
        resultat = self.manager.obtenir_propriete(99)
        self.assertIsNone(resultat)
    
    # TODO: Tests pour rechercher_par_nom()
    # 8. Test recherche nom existant (assertIn)
    def test_rechercher_nom_propriete_existante(self):
        resultat = self.manager.rechercher_par_nom("Villa Océan")
        self.assertIn(self.propriete1, resultat)
        self.assertNotIn(self.propriete2, resultat)

    # 9. Test recherche nom inexistant (liste vide)
    def test_rechercher_nom_propriete_inexistante(self):
        resultat = self.manager.rechercher_par_nom("Château")
        self.assertEqual(len(resultat), 0)

    # TODO: Tests pour reserver_propriete()
    # 10. Test réservation valide (assertTrue)
    def test_reserver_propriete_disponible(self):
        resultat = self.manager.reserver_propriete(1)
        self.assertTrue(resultat)
        self.assertFalse(self.propriete1.est_disponible)

    # 11. Test réservation propriété inexistante (assertFalse)
    def test_reserver_propriete_inexistante(self):
        resultat = self.manager.reserver_propriete(99)
        self.assertFalse(resultat)

    # 12. Test réservation propriété déjà réservée (assertFalse)
    def test_reserver_propriete_deja_reserve(self):
        premier_resultat = self.manager.reserver_propriete(1)
        self.assertTrue(premier_resultat)
        deuxieme_resultat = self.manager.reserver_propriete(1)
        self.assertFalse(deuxieme_resultat)

    # TODO: Tests pour les listes de propriétés
    # 13. Test obtenir propriétés disponibles (assertIn/assertNotIn)
    def test_obtenir_proprietes_disponibles(self):
        resultat = self.manager.obtenir_proprietes_disponibles()
    # Au départ : combien de propriétés disponibles ?
        self.assertEqual(len(resultat),3)

    # On réserve la propriété 1
        self.manager.reserver_propriete(1)

    # On récupère la nouvelle liste
        resultat = self.manager.obtenir_proprietes_disponibles()

    # La propriété 1 ne doit plus être disponible
        self.assertNotIn(self.propriete1, resultat)

     # La propriété 2 doit toujours être disponible
        self.assertIn(self.propriete2, resultat)   
     # Combien en reste-t-il ?
        self.assertEqual(len(resultat), 2)

    # 14. Test obtenir propriétés réservées (assertIn/assertNotIn)
    def test_obtenir_proprietes_reservees(self):
        resultat = self.manager.obtenir_proprietes_reservees()
        self.assertEqual(len(resultat), 0)
# On réserve la propriété 1
        self.manager.reserver_propriete(1)
# On récupère la nouvelle liste
        resultat = self.manager.obtenir_proprietes_reservees()
# La propriété 1 doit être dans les réservées
        self.assertIn(self.propriete1, resultat)
# La propriété 2 ne doit être dans les réservées
        self.assertNotIn(self.propriete2, resultat)
# Combien en reste-t-il ?
        self.assertEqual(len(resultat), 1)


if __name__ == "__main__":
    unittest.main() 