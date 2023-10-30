pipeline {
    agent { 
        node { 
            label 'terra' 
            } 
        }

    environment {
        ANSPATH = '/home/vv/ansibleK8'
    }

    stages {
        stage('Run ansible playbook with K8 config') {
            steps {
                sh "ansible-playbook -i ${ANSPATH}/inventories/test/hosts -u vv ${ANSPATH}/k8_play.yml"
            }
        }
    }
}