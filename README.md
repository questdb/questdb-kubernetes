# Helm Charts for QuestDB

Here you will find both the code for our Helm charts and the artifacts available
through GitHub Pages as a standard charts repository.

<!-- prettier-ignore-start -->
<div align="center">
  <a href="http://questdb.io">
    <img src=".github/containers.png" width="400" />
  </a>
</div>
<!-- prettier-ignore-end -->

## What is QuestDB

[QuestDB](https://questdb.io) is an open source database designed to make time
series lightning fast and easy.

It uses a column-oriented approach, vectorized execution, SIMD instructions, and
a whole array of low-latency techniques. The whole code base is built from
scratch and without dependencies, in the name of performance. We are 100% free
from garbage collection.

QuestDB implements SQL, and augments it for time-series. It exposes a Postgres
wire protocol, a high-performance REST API, and even supports ingestion with
InfluxDB line protocol. It supports both relational and time-series joins, which
makes it easy to correlate data over time. Writes are durably committed to disk,
meaning that the data is safe - yet instantly accessible.

## Add Helm repository

```shell
helm repo add questdb https://helm.questdb.io/
helm repo update
```

## Hubs

You can find our Helm charts distributed on:

- [Artifact Hub](https://artifacthub.io/packages/helm/questdb/questdb)
- [Helm Hub](https://hub.helm.sh/charts/questdb/questdb)

## Charts

- [QuestDB](charts/questdb/README.md)

## Resources

Complete references are available in the
[Documentation](https://questdb.io/docs/introduction). There are also several
guides to get started.

Quick-start guides:

- [Docker](https://questdb.io/docs/guide/docker)
- [Homebrew](https://questdb.io/docs/guide/homebrew)
- [Using the binaries](https://questdb.io/docs/guide/binaries)

Usage guides:

- [Web Console](https://questdb.io/docs/guide/web-console)
- [Postgres wire with PSQL](https://questdb.io/docs/guide/postgres-wire) (alpha)
- [REST API](https://questdb.io/docs/guide/rest)
- [CRUD operations](https://questdb.io/docs/guide/crud)

Concepts:

- [SQL extensions](https://questdb.io/docs/concept/sql-extensions)
- [Storage model](https://questdb.io/docs/concept/storage-model)
- [Partitions](https://questdb.io/docs/concept/partitions)
- [Designated timestamp](https://questdb.io/docs/concept/designated-timestamp)

## Support / Contact

[Slack Channel](https://questdb.slack.com)

## Roadmap

[Our roadmap is here](https://github.com/questdb/questdb/projects/3)

## Contribution

Feel free to contribute to the project by forking the repository and submitting
pull requests. Please make sure you have read our
[contributing guide](https://github.com/questdb/questdb-kubernetes/blob/master/CONTRIBUTING.md).
