# wwrr — Scaffold

Este repositório é um **scaffold** (esqueleto). Ele não entrega a solução: entrega a
estrutura, as regras e os arquivos de trabalho em branco que cada agente preenche ao
construir a sua **amplificação**.

Amplificação = o trabalho real: entender o problema, planejar, perguntar o que falta,
executar e provar que funcionou.

---

## 1. Um agente, uma branch

| Branch | Papel | O que contém |
|--------|-------|--------------|
| `main` | **Scaffold** — estrutura e regras | `README.md`, `AGENTS.md`, templates vazios (`PLAN.md`, `OPEN_QUESTIONS.md`, `STATE.md`, `DECISIONS.md`), `GOAL.md`, `date.txt`, `scripts/` |
| `aacc` | **Amplificação do agente `aacc`** | Os mesmos arquivos, já preenchidos, mais os entregáveis |

> **Toda alteração de conteúdo é feita na branch do agente.** A `main` só muda quando o
> próprio scaffold muda, e a mudança é replicada para as branches de trabalho por merge.
>
> Hoje existe uma branch de trabalho: `aacc`. Cada agente novo cria a sua a partir de
> `main` (`git switch -c <agente> main`) e nunca escreve na branch de outro.

O protocolo completo — ordem de leitura, o que pode ser tocado, convenção de commit,
encerramento de sessão — está em [AGENTS.md](AGENTS.md). Ele vence qualquer instrução
solta de chat.

---

## 2. Arquivos

| Arquivo | Para que serve | Estado na `main` |
|---------|----------------|------------------|
| `AGENTS.md` | Contrato dos agentes: branch por agente, escopo, commits, encerramento. | Preenchido |
| `GOAL.md` | O objetivo, o contexto e os requisitos. Entrada de tudo. | Preenchido |
| `PLAN.md` | Como executar: fases, passos, riscos, critérios de verificação. | **Vazio** — só instruções |
| `OPEN_QUESTIONS.md` | Perguntas ao chefe/cliente: nível de criticidade, motivo, e padrão caso não sejam respondidas. | **Vazio** — só instruções |
| `STATE.md` | Foto do estado atual: pronto, em andamento, próximo passo, bloqueios. | **Vazio** — só instruções |
| `DECISIONS.md` | Registro de decisões (ADR): o que foi decidido, por quê, o que foi descartado. | **Vazio** — só instruções |
| `date.txt` | Heartbeat do repositório. | Preenchido |
| `scripts/update-date.sh` | Renova o heartbeat a cada 23 horas. | Utilitário |

Os quatro arquivos vazios são **de propósito**. Um scaffold não contém respostas
inventadas: contém o formulário. Quem trabalha na amplificação lê as instruções dentro do
arquivo e preenche.

### Por que esses quatro

- **`PLAN.md`** sem plano é intenção; o plano escrito é o que permite cobrar prazo.
- **`OPEN_QUESTIONS.md`** sem ele, dúvida vira suposição e a suposição vira retrabalho.
- **`STATE.md`** contexto de conversa morre; sem ele o próximo agente refaz o que já foi feito.
- **`DECISIONS.md`** sem ele a mesma discussão volta a cada sessão e a decisão é revertida
  por quem não sabia que ela existia.

### Sessão nova, sem histórico

O repositório é a fonte da verdade — a conversa não. Para começar do zero, a primeira
mensagem é sempre a mesma:

```
Leia AGENTS.md, README.md, GOAL.md, STATE.md, PLAN.md, OPEN_QUESTIONS.md e DECISIONS.md
nesta ordem. Depois responda em 5 linhas: onde o trabalho parou, qual é o próximo passo,
o que está bloqueado. Não execute nada antes disso.
```

Se o agente não souber responder, falta arquivo — não falta conversa.
Detalhes e regras de cooperação entre agentes em [AGENTS.md](AGENTS.md) §8 e §9.

---

## 3. Fluxo de trabalho

1. `git fetch origin && git switch aacc` (ou a branch do seu agente)
2. Ler, nesta ordem: `AGENTS.md` → `GOAL.md` → `STATE.md` → `PLAN.md` → `OPEN_QUESTIONS.md`
3. Preencher/completar `PLAN.md`: um passo por linha, com saída esperada e verificação.
4. Dúvida que bloqueia decisão vai para `OPEN_QUESTIONS.md`, com nível **P0/P1/P2** e o
   padrão que será usado se ninguém responder. P0 não se assume — o passo para.
5. Decidiu algo? `DECISIONS.md`. Alternativa descartada também, com o motivo.
6. Executar. Passo concluído atualiza o próprio `PLAN.md` (status + evidência).
7. `git add -A && git commit -m "<tipo>: <resumo>" && git push origin aacc`
8. Encerrar: atualizar `STATE.md`, renovar `date.txt`.

---

## 4. `date.txt` — heartbeat de 23 horas

`date.txt` guarda o instante da última renovação. A renovação é feita por
`scripts/update-date.sh`, com intervalo de 23 horas (não 24: o arquivo nunca "empata" com
o mesmo horário do dia anterior, e o atraso acumulado fica visível).

```bash
./scripts/update-date.sh status    # idade do heartbeat em horas (falha se >= 23h)
./scripts/update-date.sh           # renova uma vez
./scripts/update-date.sh loop      # renova a cada 23h (processo persistente)

WW_AUTOPUSH=1 ./scripts/update-date.sh loop   # além de renovar, commita e empurra
                                             # o heartbeat na branch atual
```

O heartbeat só vale como evidência se estiver no remoto: rode com `WW_AUTOPUSH=1` (ou faça
o commit manual) quando `date.txt` precisar provar atividade para outra pessoa.

---

## 5. O que este repositório **não** é

- Não é a entrega final; a entrega vive na branch do agente.
- Não é lugar de resposta provisória "para depois" — provisório é `TBD` no `PLAN.md` com a
  pergunta correspondente no `OPEN_QUESTIONS.md`.
- Não é depósito de arquivo solto: todo arquivo novo aparece na tabela da seção 2 ou no `PLAN.md`.
