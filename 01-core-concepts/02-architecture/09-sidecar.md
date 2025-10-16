---
title: "Multi container"
linkTitle: "Multi container"
weight: 11
version: 1.0
type: "docs"
description: >
---

### Sidecar containter ###
Skrypt na kontenerze działa nonstop Side-By-Side z głównym kontrolerem na tym samym podzie (ex. heapdump w fortee)

Wielekontenerw wewntrz jednego poda, są to kontenery pomocnicze, na których wykonywane są drobne zadania, skrypty, cronjoby, kontener który odpowaida za zbieranie logów celem odciązenia pracy głównego kontenera.

jest to dobre rozwiązanie bo bo kontenery w tym samym podzie nie potrzebuja sieci/service, komunikują sie na lokalhoscie.

To dodatkowy kontener w Podzie, który współdzieli wolumen z główną aplikacją.

Jego zadanie: np. zbierać logi i przekazywać je gdzieś dalej


### Init container ###
Działa tylko raz na początku, przy uruchomieniu poda. Główny kotener działa po zakończeniu procesu inicjowanego pzez "kontener pomocniczy"

![alt text](image.png)

```emptyDir``` jest tymczasowy — jeśli Pod zostanie usunięty lub przeniesiony, dane znikają.
