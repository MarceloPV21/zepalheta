pipeline {
    agent{
        docker{
            image 'python'
            args '--network=zepalheta-network'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('API Test'){
            steps{
                sh  'robot -d ./logs tests/api'
                
            }
        stage('UI Test'){
            steps{
                sh  'robot -d ./logs tests/web'
                
            }
        }
    }
    post {
        always{
            robot 'logs' 
        }
    }
}
