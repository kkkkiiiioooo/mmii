<!--
# DECISIONS.md — TEMPLATE (scaffold)

PARA QUE SERVE
  Registro de decisões (ADR — Architecture Decision Record, formato enxuto). Guarda o QUE
  foi decidido, POR QUE, e o que foi descartado. É o arquivo que impede a decisão de ser
  refeita, revertida ou "esquecida" três sessões depois.

  Responde a pergunta que todo mundo faz ao abrir um repositório antigo:
  "por que está assim?"

COMO PREENCHER
  1. Copie para a branch de trabalho e preencha lá. Na `main` fica vazio.
  2. Uma decisão por entrada, numerada e nunca renumerada. Decisão nova = entrada nova.
  3. Decisão nunca é apagada. Se deixou de valer, o status vira `SUPERSEDED` e ela aponta
     para a que a substituiu.
  4. Sempre preencha "Alternativas descartadas" e o motivo — é a parte que se perde primeiro
     e a que mais custa caro depois.

QUANDO REGISTRAR
  - Toda resposta de P0 ou P1 do OPEN_QUESTIONS.md (decidir = registrar).
  - Toda escolha entre caminhos técnicos.
  - Toda premissa assumida por falta de resposta.

APAGUE TODO ESTE BLOCO AO PREENCHER.
-->

# DECISIONS — registro de decisões

**Status possíveis:** `PROPOSED` · `ACCEPTED` · `SUPERSEDED` · `REJECTED`

<!-- Modelo: copie o bloco abaixo para cada decisão.
## D-000 — [título curto no imperativo]

- **Data:** AAAA-MM-DD
- **Status:** ACCEPTED
- **Decisor:** <!-- quem decidiu -->
- **Origem:** <!-- Q3 do OPEN_QUESTIONS.md / descoberta em teste / instrução direta -->
- **Contexto:** <!-- 2 a 4 linhas: a situação que forçou a decisão -->
- **Decisão:** <!-- uma frase, no presente: "Usamos X porque Y." -->
- **Alternativas descartadas:**
  | Alternativa | Por que foi descartada |
  |-------------|------------------------|
  |  |  |
- **Consequências:** <!-- o que fica mais fácil, o que fica mais difícil, o que passa a ser proibido -->
- **Revisar em:** <!-- data ou evento que obriga reavaliar -->
-->
