```yaml
title: "WebHook"
linkTitle: "WebHook"
weight: 11
version: 1.0
type: "docs"
description: >
```

##### WebHook
Webhook validator działa jak „strażnik” i pomaga uniknąć błędów na etapie tworzenia zasobów. Przykłady, które normalnie byłyby wychwycone:

Użycie nieprawidłowego pathType, np. literówki jak Pefix zamiast Prefix.
Nieprawidłowe wartości w polach takich jak port.number czy service.name.
Brak wymaganych pól (np. brak TLS w przypadku wymagań polityki bezpieczeństwa)

Tymczasowe rozwiązanie: Usunięcie webhooka jest bezpieczne jako rozwiązanie tymczasowe, np. w sytuacji awaryjnej, gdy musisz szybko wdrożyć zmiany.
Długoterminowe skutki: W środowisku produkcyjnym brak walidacji może prowadzić do błędów w konfiguracji i problemów z dostępnością aplikacji.
