# Multi-stage Dockerfile, non-root, exec form PID 1 (Tydzień 0.1)
#
# TODO:
# 1. Etap builder: zainstaluj zależności i zbuduj pakiet/środowisko (np. z użyciem uv)
# 2. Etap runtime: lekki obraz bazowy (np. python:3.12-slim / distroless)
# 3. Utwórz i przełącz się na użytkownika non-root (USER)
# 4. Uruchom aplikację w formie exec (ENTRYPOINT ["..."]), aby proces był PID 1 i odbierał SIGTERM
