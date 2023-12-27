---
title: "Pod and container"
linkTitle: "Pod and container"
weight: 11
version: 1.0
type: "docs"
description: >
---

### pod

![pod](../01-main-components/img/pod1.png)

Pod jest warstwą abstrakcji na szczycie kontenerów.

Najmniejsza jednostka w k8s.
Abstrakcyjny kontener, nie jest kontenerem ale kontener jest na nim umieszczany.
Nie może być wiecej niż jeden kontener na podzie (ale są wyjątki, maksymalnie może być 6 kontenerów).

Kady Pod:
 - posiada włąsna nazwę domenową,
 - posiada wirtualną kartę sieciową,
 - traktowany jest jak host.

To podejście sprawia, że możesz np. posiadac 10 aplikacji na nodzie (10 podów), każda z nich będzie działała na porcie 8080 i nie będzie generowany konflikt.

 Jeżeli rozpatrujemy przypadek muticontainer, to używanie dodatkowego kontenera/ów na jednym podzie ma za zadanie wspomaganie gównej apliacji.
 Sę to najczęściej kontenery wspomagające, odpowiadające za wykonywanie backupów lub synchronizację z inną bazą dancyh, scheduler, dodatkowa autentykacja, ...

 W tym przypadku kontenery posiadają rózne porty i komunikuja się na poziomi localhosta.

### Pause container
 Gdy uruchamiasz kontener dokera zawsze tworzony jest dodatkowy kontener na podzie, zwany "pause container", zwany często "sandbox container".
<br>Jego zadaniem jest rezerwacja i utrzymanie nazwy sieciowej oraz utrzymanie adrzesu ip dla poda, gdy kontener uległ awarii lub jest wyminiany na nowy.
Dodatowo jego zadaniem jest uruchomienie komunikacji pomiędzy kontenerami.