<!--
# OPEN_QUESTIONS.md — TEMPLATE (scaffold)

PARA QUE SERVE
  Canal único de perguntas para o chefe / cliente / dono do produto. É o padrão da
  engenharia de software (`OPEN_QUESTIONS.md`) para registrar o que bloqueia uma decisão,
  em vez de virar suposição silenciosa.

  Responde três coisas a qualquer momento:
    1. O que está travado esperando resposta?
    2. Quem precisa responder?
    3. O que acontece se ninguém responder?

REGRA CENTRAL: TODA PERGUNTA TEM UM PADRÃO
  Ninguém é obrigado a responder nada. Cada pergunta declara o que o agente fará se ficar
  sem resposta. Pergunta sem padrão é pergunta mal feita — reescreva ou apague.

NÍVEIS (sinalização de criticidade)
  P0  CRÍTICO   — errar aqui causa dano irreversível (perda de dados, hardware, dinheiro).
                  Sem resposta, o passo correspondente NÃO executa.
  P1  IMPORTANTE — errar custa retrabalho, não estrago. Sem resposta, executa com o padrão
                  declarado e registra a premissa.
  P2  DESCARTÁVEL — pode ficar em branco para sempre. Existe só para registrar preferência.

COMO PREENCHER
  1. Copie para a branch do agente (`aacc` ou outra) e preencha lá. Na `main` fica vazio.
  2. Uma pergunta por linha, fechada (sim/não ou escolha entre opções), nunca aberta.
  3. Só pergunte o que o agente NÃO consegue descobrir sozinho testando o ambiente.
     Se dá para medir com um comando, é passo do PLAN.md, não pergunta.
  4. Toda pergunta tem DONO, PRAZO e PADRÃO.

APAGUE TODO ESTE BLOCO AO PREENCHER.
-->

# OPEN_QUESTIONS — Perguntas abertas

**Dono do arquivo:** <!-- quem consolida as perguntas -->
**Respondente principal:** <!-- chefe / cliente / fornecedor -->

## Legenda

| Nível | Significado | Se ficar sem resposta |
|-------|-------------|-----------------------|
| **P0** | Crítico — dano irreversível se errar | O passo não executa. Nada é apagado, gasto ou enviado. |
| **P1** | Importante — gera retrabalho | Executa com o padrão da coluna "Padrão" e registra a premissa em `DECISIONS.md`. |
| **P2** | Descartável — preferência | Ignora. O padrão vale para sempre. |

## Resumo

| Em aberto | P0 | P1 | P2 | Respondidas |
|-----------|----|----|----|-------------|
| 0 | 0 | 0 | 0 | 0 |

## Perguntas

| ID | Nível | Pergunta | Para quem | Padrão se não responder | Bloqueia | Prazo | Status | Resposta |
|----|-------|----------|-----------|--------------------------|----------|-------|--------|----------|
| Q1 | P0 |  |  | — (não executa) |  |  | OPEN |  |

## Respondidas (histórico)

| ID | Resposta | Data | Decisão registrada em |
|----|----------|------|-----------------------|
|  |  |  |  |

## Escalonamento

<!-- Pergunta P0 sem resposta no prazo: o trabalho para naquele ponto e o bloqueio é
     escalado — não se assume nada em P0. Pergunta P1 vencida: segue o padrão e a premissa
     é registrada em DECISIONS.md com data e justificativa. -->
