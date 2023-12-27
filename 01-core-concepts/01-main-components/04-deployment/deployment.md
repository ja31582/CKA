---
title: "Deployment"
linkTitle: "Deployment"
weight: 11
version: 1.0
type: "docs"
description: >
---

### deploy

![deploy](../04-deployment/deploy&sts.png)

Deployment jest warstwą abstrakcji na szczycie podów, wchodzi w interakcję z podem, jako replikacja konfiguracja poda.

Deployment to swego rodzaju plan (blueprint) dla podów "my-app".

Przechowuje informacje o replice danego poda.

Pody bazodanowe nie moga być replikowane podprzez deployment. (data base is state)

![deploy&sts](../07-statefullset/deploy&sts.png)