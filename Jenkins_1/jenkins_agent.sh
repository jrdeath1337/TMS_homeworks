docker run -d \
--name=agent_1 \
--env-file ./.env \
--network jenkins \
-p 22:22 \
jenkins/ssh-agent:alpine-jdk21 
