```yaml
title: "DemonSet"
linkTitle: "DemonSet"
weight: 11
version: 1.0
type: "docs"
description: >
```

### ds

DemonSet jest komponentem takim jak Deployment czy StatefulSet z tą róznicą, że automatycznie kalkuluje ile replikacji aplikacji powinno być wdrożonych w danym momencie w zależonći od ilości nodów, których liczba w danym momencie może być wieksza lub mniejsza.

Wdraża tylko jedną Replikę na Nod

Nie trzeba definiować ilości replik w DemonSet, automatycznie skaluje w górę lub w dół w zależności od ilości nodów, gwarantuje jedną replikę dla każdego poda.