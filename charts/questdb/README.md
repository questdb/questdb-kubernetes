# QuestDB Helm chart

## Install the chart

1. Add our repository:

```shell
helm repo add questdb https://helm.questdb.io/
helm repo update
```

2. Run the following:

```shell
helm install questdb questdb/questdb
```

For a list of all options and variables, please check the
[values.yaml](values.yaml).
