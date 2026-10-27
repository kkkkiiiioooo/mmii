# AGENTS.md — protocolo dos agentes

Este arquivo é o contrato de trabalho. Todo agente (IA ou humano) lê isto **antes** de
tocar em qualquer coisa. Em caso de conflito entre este arquivo e uma instrução de chat,
o chat perde: abra uma pergunta P0 no `OPEN_QUESTIONS.md`.

## 1. Um agente, uma branch

`main` é o scaffold, não é local de trabalho. Cada agente trabalha na **sua própria
branch** e nunca na do outro.
Regras decorrentes:

1. Nunca commitar em `main` a partir de uma branch de trabalho.
2. `main` só recebe mudança de scaffold — e ela é replicada para as branches de trabalho
   por merge, não por cópia manual.
3. Nunca `push --force` em `main` nem na branch de outro agente.
4. Branch de outro agente é **somente leitura**. Se precisar de algo dela, peça; não edite.

## 2. Ordem de leitura obrigatória

`AGENTS.md` → `README.md` → `GOAL.md` → `STATE.md` → `PLAN.md` → `OPEN_QUESTIONS.md`

Se `STATE.md` contradiz sua memória da conversa, `STATE.md` ganha. Ele é o estado real.

## 3. Onde cada coisa é registrada

| Você quer… | Escreva em |
|------------|-----------|
| registrar o que vai fazer | `PLAN.md` |
| perguntar algo ao cliente | `OPEN_QUESTIONS.md` |
| registrar o que decidiu e por quê | `DECISIONS.md` |
| dizer em que pé está / próximo passo | `STATE.md` |
| provar que está vivo | `date.txt` |

**Decisão sem registro em `DECISIONS.md` não aconteceu.** É o que impede o próximo agente
de refazer ou reverter o trabalho por não saber que já foi decidido.

## 4. Regras de execução

1. **Escopo é o `GOAL.md`.** Ideia fora do escopo não vira tarefa: vira linha em
   `OPEN_QUESTIONS.md` (P2) ou é descartada.
2. **Só pergunta o que não dá para descobrir testando.** Se um comando responde, é passo
   do plano, não pergunta ao cliente.
3. **P0 nunca é assumido.** Sem resposta P0, o passo não executa. P1 vence o prazo → segue
   o padrão da tabela e registra a premissa em `DECISIONS.md`.
4. **Nada de ação irreversível sem autorização explícita**: apagar partição, formatar,
   sobrescrever firmware, gastar dinheiro, publicar, enviar mensagem em nome de alguém.
5. **Evidência obrigatória.** Passo só é `DONE` com comando, saída, log ou link anexado.
   "Deve funcionar" não é evidência.
6. **Erro não se repete às cegas.** Duas falhas iguais = pare, diagnostique, registre.
7. **Premissa registrada vale; premissa mental não vale.**

## 8. Cold start — sessão nova, sem histórico

O repositório é a fonte da verdade. Chat é efêmero; arquivo é permanente. Quem chega numa
sessão limpa entende o trabalho **apenas** com os arquivos deste repositório, desde que
nada relevante tenha ficado só na conversa.

**Primeira mensagem padrão** (copie e cole quando abrir uma sessão nova):

```
Leia AGENTS.md, README.md, GOAL.md, STATE.md, PLAN.md, OPEN_QUESTIONS.md e DECISIONS.md
nesta ordem. Depois responda em 5 linhas: onde o trabalho parou, qual é o próximo passo,
o que está bloqueado. Não execute nada antes disso.
```

Se o agente não conseguir responder isso corretamente, o repositório está incompleto —
corrija o arquivo faltante, não a conversa.

Regras que fazem o cold start funcionar:

1. Toda decisão vai para `DECISIONS.md` no mesmo dia em que é tomada.
2. `STATE.md` fecha cada sessão com próximo passo executável.
3. Nada de "combinamos no chat" — se não está escrito, não existe para o próximo agente.
4. `GOAL.md` é imutável durante o trabalho; mudança de objetivo é decisão registrada.
5. Se o usuario nao especificar a branch ou qual agente esta usando, pergunte isso antes de executar qualquer acao.
