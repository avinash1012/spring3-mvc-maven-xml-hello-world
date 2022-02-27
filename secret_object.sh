# run me where kubectl is available,& make sure to replace account,region etc

ACCOUNT=0200-3854-0642
REGION=us-east-2
SECRET_NAME=${REGION}-ecr-registry
EMAIL=avinash970581@gmail.com
# here one more line to create ecr repo

TOKEN='aws ecr --region=$REGION get-authorization-token --output text --query authorizationData[].authorizationToken | base64 -d | cut -d: -f2'



#create or replace registry secret

kubectl delete secret --ignore-not-found $SECRET_NAME
kubectl create secret docker-registry $SECRET_NAME \
 --docker-server=https://${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com \
 --docker-username=AWS \
 --docker-password="${TOKEN}" \
 --docker-email="${EMAIL}"
