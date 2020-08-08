 docker build -t snehaprem/multi-client:latest -t snehaprem/multi-client:$SHA -f ./client/Dockerfile ./client
 docker build -t snehaprem/multi-server:latest -t snehaprem/multi-server:$SHA -f ./server/Dockerfile ./server
 docker build -t snehaprem/multi-worker:latest -t snehaprem/multi-worker:$SHA -f ./worker/Dockerfile ./worker
 docker push snehaprem/multi-client:latest
 docker push snehaprem/multi-server:latest
 docker push snehaprem/multi-worker:latest
 docker push snehaprem/multi-client:$SHA
 docker push snehaprem/multi-server:$SHA
 docker push snehaprem/multi-worker:$SHA
 kubectl apply -f k8s
 kubectl set image deployment/server-deployment server=snehaprem/multi-server:$SHA
 kubectl set image deployment/worker-deployment server=snehaprem/multi-worker:$SHA
 kubectl set image deployment/client-deployment server=snehaprem/multi-client:$SHA