# ansK8
Configure startup for K8


To use this, you must first implement the terraform configuration from [Lab One Terraform](https://github.com/Kiljan/Lab-One-Terraform.git) and [Lab-Two-Ansible](https://github.com/Kiljan/Lab-Two-Ansible.git)

Then use that repository, create a new Jenkins pipeline and run it. I use the localhost agent for this purpose (MAIN_ansibleK8).

Then you can also create a second pipeline (AFTER_ANSIBLE_K8) with another Jenkins node configured in the previous step on the master node to run something like this:

```
pipeline {
    agent { 
        node { 
            label 'k8masternode' 
            } 
        }
    stages {
        stage('Run basic kubeadm init command') {
            steps {
                sh 'sudo kubeadm init'
            }
        }
        stage('After install run') {
            steps {
                sh '/home/vv/set_up_after_init.sh'
            }
        }
    }
}
```

This is part of a short series of articles from my [Linkedin profile](https://www.linkedin.com/pulse/devops-labs-free-part-2-piotr-kiljanek-naysf/?trackingId=ROu4fF6bTq6J0BozUsBHrQ%3D%3D)
