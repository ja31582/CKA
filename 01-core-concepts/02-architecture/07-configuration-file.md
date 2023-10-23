---
title: "K8s Configuration File"
linkTitle: "K8s Configuration File"
weight: 11
version: 1.0
type: "docs"
description: >
---

Kazdy z Configuration Files *.yaml (kubernetes manifest) posiada trzy podstawowe poziomy.
z racj tego iż jest to plik YAML i wszelkie przesunięcia nawet jednej spracji są dla niego istotne, warto po ztworzeniu manifestu sprawdzić czy plik nie zawiera bęłdów używająć https://www.yamllint.com/

Istniejeą różne rodzaje wersji dla róznych kmponentów.

![ver](../02-architecture/img/ver.png)

Deklaracja co chesz wdrożyć, deployment czy service

![declarate](../02-architecture/img/declarate.png)

1. metadata

![metadata](../02-architecture/img/metadata.png)

2. specyfication - atrybuty będą specyficzne dla każdego z komponentu (deployment, dervice, ..)

![spec](../02-architecture/img/spec.png)

3. Status - jest automatyczne gendrowany i dodawany przez k8s
   
   Aktualny stan nie musi być taki sam jak stan zadeklaroway. 
   
   Specyfication może zawierać informacje o 2 replikach a w satus może wskazywać że istnieje tylko jedna. Znaczy to, że jest jakiś problem i k8s będzie doążył do tego aby były 2 repliki - jak w spec.
   
   Informacje dotyczące statusu przekazywane sa prze [ETCD](../02-architecture/img/02-master_.md) 

Dobrą proktyką jest przechowywanie Configuration File w Git lub Infrastructure as a Code