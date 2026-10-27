# wwrr — Scaffold

Este repositório é um **scaffold** (esqueleto). Ele não entrega a solução: entrega a
estrutura, as regras e os arquivos de trabalho em branco que a equipe (humana ou agente)
preenche ao construir a **amplificação**.

Amplificação = o trabalho real: entender o problema, planejar, perguntar o que falta,
executar e provar que funcionou.

---

## 1. Modelo de branches

| Branch | Papel | O que contém |
|--------|-------|--------------|
| `main` | **Scaffold** — fonte da verdade da estrutura | `README.md`, templates vazios de `PLAN.md` e `ASK.md`, `GOAL.md`, `date.txt`, `scripts/` |
| `aacc` | **Amplificação** — onde o trabalho acontece | Todo conteúdo produzido: plano preenchido, perguntas reais, entregáveis |

### Regra de ouro

> **Toda alteração de conteúdo é feita na branch `aacc`.**
> A `main` só muda quando o próprio scaffold muda (regras, templates, estrutura de arquivos).

Se você está prestes a editar `PLAN.md`, `ASK.md` ou qualquer entregável: troque para `aacc`
antes (`git switch aacc`).

---

## 2. Arquivos do scaffold

| Arquivo | Para que serve | Estado na `main` |
|---------|----------------|------------------|
| `GOAL.md` | O objetivo, o contexto e os requisitos do trabalho. É a entrada de tudo. | Preenchido |
| `PLAN.md` | O plano de execução: fases, passos, riscos, critérios de aceite. | **Vazio** — só instruções |
| `ASK.md` | Perguntas para o chefe/cliente (padrão `OPEN_QUESTIONS.md`). | **Vazio** — só instruções |
| `date.txt` | Heartbeat do repositório: data da última renovação. | Preenchido |
| `scripts/update-date.sh` | Renova `date.txt` a cada 23 horas. | Utilitário |

Os dois arquivos vazios são **de propósito**. Um scaffold não deve conter respostas
inventadas: ele contém o formulário. Quem trabalha na amplificação lê as instruções dentro
do arquivo e preenche.

---

## 3. Fluxo de trabalho (para quem for trabalhar na amplificação)

1. `git fetch origin && git switch aacc`
2. Ler `GOAL.md` até o fim. Não pule a seção de requisitos.
3. Preencher `PLAN.md`: um passo por linha, com dono, saída esperada e como verificar.
4. Toda dúvida que **bloqueia** uma decisão vai para `ASK.md` — não invente requisito,
   não assuma hardware, não assuma acesso. Pergunte e siga com o que não está bloqueado.
5. Executar. Cada passo concluído atualiza o próprio `PLAN.md` (status + evidência).
6. `git add -A && git commit -m "<tipo>: <resumo>" && git push origin aacc`
7. Ao fim: `date.txt` renovado, `PLAN.md` sem passo pendente, `ASK.md` sem pergunta em aberto.

### Convenção de commit

```
<tipo>(<escopo>): <resumo no imperativo>
```
Tipos: `plan`, `ask`, `feat`, `fix`, `docs`, `chore`.

---

## 4. `date.txt` — heartbeat de 23 horas

`date.txt` guarda o instante da última renovação. A renovação é feita por
`scripts/update-date.sh`, com intervalo de 23 horas (não 24: o arquivo nunca "empata" com
o mesmo horário do dia anterior e o atraso acumulado é visível).

```bash
./scripts/update-date.sh status    # idade do heartbeat em horas (falha se >= 23h)
./scripts/update-date.sh           # renova uma vez
./scripts/update-date.sh loop      # renova a cada 23h (processo persistente)

WW_AUTOPUSH=1 ./scripts/update-date.sh loop   # além de renovar, commita e empurra
                                             # o heartbeat na branch atual
```

O heartbeat só vale como evidência se estiver no remoto: rode com `WW_AUTOPUSH=1` (ou faça
o commit manual) quando `date.txt` precisar provar atividade para outra pessoa.

Formato do arquivo:

```
updated_at: 2026-10-27T00:15:18Z
epoch: 1793060118
```

Se o `updated_at` estiver mais de 23 horas no passado, o heartbeat está parado — trate como
sinal de que o pipeline de trabalho não está rodando.

---

## 5. O que este repositório **não** é

- Não é a entrega final; a entrega vive na `aacc`.
- Não é um lugar para respostas provisórias "para depois" — o que é provisório deve estar
  marcado como `TBD` no `PLAN.md`, com a pergunta correspondente no `ASK.md`.
- Não é um dump de arquivos soltos: cada arquivo novo precisa aparecer na tabela da seção 2
  ou no `PLAN.md`.
