pipeline {
    agent any

    stages {

        stage('Récupération du code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/jihanemoufak/projet-tests.git'
            }
        }

        stage('Tests unitaires') {
            steps {
                bat '.\\lancer_tests_unitaires.bat'
            }
        }

        stage('Tests API') {
            steps {
                bat '.\\lancer_tests_api.bat'
            }
        }

        stage('Tests IHM') {
            steps {
                bat '.\\lancer_tests_ihm.bat'
            }
        }
    }

    post {
        success {
            echo 'Tous les tests ont réussi'
        }
        failure {
            echo 'Au moins un test a échoué'
        }
    }
}
