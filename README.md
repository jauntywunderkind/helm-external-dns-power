# helm-external-dns-power

> External DNS, powered by PowerDNS, installed via Helm

# Steps

1. `kubectl apply -f external-dns-namespace.yaml` to create an `external-dns` namespace (you can use another namespace & adjust -n below)
1. Install "persistent" resources:
    1. `cd persist`
    1. `helm install edp-persist . -n external-dns`
    1. `cd ..`
1. Install powerdns resources:
    1. `cd powerdns`
    1. `helm install edp-pdns . -n external-dns`
    1. `cd ..`
1. Install ext resources:
    1. `cd ext`
    1. `helm install edp-ext -n external-dns`
    1. `cd ..`
