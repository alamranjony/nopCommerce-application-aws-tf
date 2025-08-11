#!/bin/bash
# Install dependencies
apt-get update -y
apt-get install -y curl tar

mkdir azagent;cd azagent;curl -fkSL -o vstsagent.tar.gz https://download.agent.dev.azure.com/agent/4.259.0/vsts-agent-linux-x64-4.259.0.tar.gz;tar -zxvf vstsagent.tar.gz; if [ -x "$(command -v systemctl)" ]; then ./config.sh --deploymentgroup --deploymentgroupname "aws-ubuntu-asg-group" --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/dev-ops-journey/ --work _work --projectname 'nopstation' --auth PAT --token 4cTAUJIzc4hOpfEdmIXCbtJxzdMj1m1s8sYyWVz92qBqRY0ManvnJQQJ99BHACAAAAAEEkU7AAASAZDO3RCA --runasservice; sudo ./svc.sh install; sudo ./svc.sh start; else ./config.sh --deploymentgroup --deploymentgroupname "aws-ubuntu-asg-group" --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/dev-ops-journey/ --work _work --projectname 'nopstation' --auth PAT --token 4cTAUJIzc4hOpfEdmIXCbtJxzdMj1m1s8sYyWVz92qBqRY0ManvnJQQJ99BHACAAAAAEEkU7AAASAZDO3RCA; ./run.sh; fi





