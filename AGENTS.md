# AGENTS.md — protocolo dos agentes

Este arquivo é o contrato de trabalho. Todo agente (IA ou humano) lê isto **antes** de
tocar em qualquer coisa. Em caso de conflito entre este arquivo e uma instrução de chat,
o chat perde: abra uma pergunta P0 no `OPEN_QUESTIONS.md`.

## 1. Um agente, uma branch

`main` é o scaffold, não é local de trabalho. Cada agente trabalha na **sua própria
branch** e nunca na do outro.

| Branch | Agente | Escopo | Pode tocar em |
|--------|--------|--------|----------------|
| `main` | curador do scaffold | estrutura, templates, regras | `README.md`, `AGENTS.md`, templates, `scripts/` |
| `aacc` | agente `aacc` | amplificação do `GOAL.md` | `PLAN.md`, `OPEN_QUESTIONS.md`, `STATE.md`, `DECISIONS.md`, entregáveis |

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

## 5. Convenção de commit

```
<tipo>(<escopo>): <resumo no imperativo>
```

Tipos: `plan`, `ask`, `decision`, `state`, `feat`, `fix`, `docs`, `chore`.

Um commit = uma intenção. Mensagem que precisa de "e" no meio geralmente são dois commits.

## 6. Encerramento de sessão

Antes de sair, o agente obrigatoriamente:

- atualiza `STATE.md` (o que ficou pronto, próximo passo, bloqueios);
- renova `date.txt` (`WW_AUTOPUSH=1 ./scripts/update-date.sh`);
- deixa `PLAN.md` sem passo em `WIP` esquecido;
- deixa `OPEN_QUESTIONS.md` com o resumo coerente com a tabela.

Sessão encerrada sem `STATE.md` atualizado é sessão perdida: o próximo agente vai repetir
trabalho.

## 7. Segredos

Nunca commitar senha, chave, token ou licença. Se um `.env` for necessário, ele entra no
`.gitignore` e o repositório guarda apenas o `.env.example` com as chaves vazias.
