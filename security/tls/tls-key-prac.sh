id=hongmin
o_name=crowdworks

# control plane이 사용하고 있는 ca.crt와 ca.key 필요.
# minikube를 사용중이라면 minikube container에 들어가서 /var/lib/minikube/certs 폴더 참조
openssl genrsa -out $id.key 2048 # key 생성
openssl req -new -key $id.key -out $id.csr -subj="/CN=$id/O=$o_name" # csr 생성 (crt 생성 후 삭제 가능)
openssl req -in $id.csr -noout -text # csr 확인
openssl x509 -req -in $id.csr -CA /var/lib/minikube/certs/ca.crt -CAkey /var/lib/minikube/certs/ca.key -CAcreateserial -out $id.crt -days 365 # ca 인증 후 crt 생성

# 위의 .key file과 .crt file을 이용하여 credential, context 등록

# credential(어떤 권한의 유저) 등록
kubectl config set-credentials $id --client-certificate=$id.crt --client-key=$id.key

# credential을 이용하여 context 등록 (어떤 서비스에 어떤 유저를 사용할 지에 대한 내용)
kubectl config set-context $id@minikube --cluster=minikube --user=$id --namespace=office

# context 사용 명령
kubectl config use-context $id@minikube

# 관리자 context로 되돌리기
# kubectl config use-context kubernetes-admin@kubernetes
kubectl config use-context minikube
