# helm-external-dns-power

> External DNS, powered by PowerDNS, installed via Helm

# Steps

1. Optionally `kubectl apply -f external-dns-namespace.yaml` to create an `external-dns` namespace
1. Install "persistent" resources:
    1. `cd persist`
    1. `helm install external-dns-persist . -n external-dns`
    1. `cd ..`
1. Install powerdns resources:
    1. `cd powerdns`
    1. `helm install external-dns-power . -n external-dns`
    1. `cd ..`
