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

Kady Pod posiada:
 - włąsna nazwę domenową
 - virtualną kartę sieciową
 - każdy od traktowany jest jak host

 To podejście sprawia, że możesz posiadac 10 aplikacji na na nodzie na każda z niich będzie działała na porcie 8080 i nie będzie generowany konflikt.
 Kazda maszyn działa w wizolowanej maszynie - Podzie

 Jeżeli rozpatrujemy przypadek mutkicontainer, to używanie dodatkowego kontenera/ów na jednym podzie ma za zadanie wspomaganie gównej apliacji.
 Sę to najczęściej kontenery wspomagające, odpowiadające za wykonywanie backupów lub synchronizację z inną bazą dancyh, scheduler, dodatkowa autentykacja, ...

w tym przypadku kontenery posiadaja rózne porty i komunikuja się na poziomi lcalhosta.

### Pause container
Gdy uruchamiasz kontener dokerea zawsze tworzony jest dodatkowy kkontener na podzie, zwany "pause container" zwany często "sandbox container"
<br>Jego zadaniem jest rezerwacja i utrzymanie nazwy sieciowej i utrzymanie adrzesu ip dla poda , gdy kontener uległ awarii lub jest wyminiany na nowy.
dodatowo jego zadaniem jest uruchomienie komunikacji pomiędzy kontenerami.

