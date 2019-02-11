crumb=$(curl -u "jenkins:1234" -s 'http://jenkins.local:8085/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
#curl -u "jenkins:1234" -H "$crumb" -X POST http://jenkins.local:8085/job/ENV/build?delay=0sec
curl -u "jenkins:1234" -H "$crumb" -X POST  http://jenkins.local:8085/job/db-ansible-users/buildWithParameters?EDAD=22
