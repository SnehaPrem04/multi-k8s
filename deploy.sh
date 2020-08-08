 docker build -t snehaprem04/multi-client:latest -t snehaprem04/multi-client:$SHA -f ./client/Dockerfile ./client
 docker build -t snehaprem04/multi-server:latest -t snehaprem04/multi-server:$SHA -f ./server/Dockerfile ./server
 docker build -t snehaprem04/multi-worker:latest -t snehaprem04/multi-worker:$SHA -f ./worker/Dockerfile ./worker
 docker push snehaprem04/multi-client:latest
 docker push snehaprem04/multi-server:latest
 docker push snehaprem04/multi-worker:latest
 docker push snehaprem04/multi-client:$SHA
 docker push snehaprem04/multi-server:$SHA
 docker push snehaprem04/multi-worker:$SHA
 kubectl apply -f k8s
 kubectl set image deployment/server-deployment server=snehaprem04/multi-server:$SHA
 kubectl set image deployment/worker-deployment server=snehaprem04/multi-worker:$SHA
 kubectl set image deployment/client-deployment server=snehaprem04/multi-client:$SHA