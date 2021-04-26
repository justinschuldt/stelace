# secrets for k8s environment

## create the following secrets

These are used by the various backend components

### create redis secrets

- password: not-a-real-secret
```
kubectl -n syr create secret generic redis-secret --from-literal=password=not-a-real-secret -o yaml
```

### create postgres secrets

- postgres password: not-a-real-secret
- postgres user: someuser
- postgres db: stelace
- PGDATA: /var/lib/postgresql/data/pgdata
```
kubectl -n syr create secret generic postgres-secret --from-literal=password=not-a-real-secret --from-literal=user=someuser --from-literal=db_name=stelace --from-literal=pg_data=/var/lib/postgresql/data/pgdata -o yaml
```

### create elasticsearch secrets

- elastic password: not-a-real-secret
```  
kubectl -n syr create secret generic elasticsearch-secret --from-literal=password=not-a-real-secret  -o yaml
```

### create stelace secrets

- SYSTEM_KEY: not-a-real-secret
```
kubectl -n syr create secret generic stelace-api-secret --from-literal=system-key=not-a-real-secret  -o yaml
```

### create stripe secrets

- secret key: sk_test_not-a-real-secret
- publishable key: pk_test_not-a-real-secret
```
kubectl -n syr create secret generic stripe-api-secret --from-literal=secret-key=sk_test_not-a-real-secret --from-literal=publishable-key=pk_test_not-a-real-secret  -o yaml
```

### create elastic-apm secrets

- token: xyz-not-a-real-secret-1234
```
kubectl -n syr create secret generic elastic-apm-secret --from-literal=token=xyz-not-a-real-secret-1234  -o yaml
```
