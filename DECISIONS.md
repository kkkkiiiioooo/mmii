# DECISÕES TOMADAS

## Como Usar Este Arquivo
Este arquivo registra **todas as decisões importantes** tomadas durante o processo de resolução do desafio.

**Formato para cada decisão:**
```markdown
## [ID] - [Título da Decisão]
- **Data:** AAAA-MM-DD
- **Decisor:** [Nome do agente ou "Criador"]
- **Contexto:** [Explicação do problema/opção]
- **Decisão:** [O que foi decidido]
- **Justificativa:** [Por que esta decisão foi tomada]
- **Impacto:** [Como isso afeta o projeto]
- **Alternativas descartadas:** [O que não foi escolhido e por quê]
- **Arquivos relacionados:** [Links para STATE.md, PLAN.md, etc.]
```

---

## Exemplo de Decisão

## D001 - Priorização da Alternativa A2
- **Data:** [A ser preenchido]
- **Decisor:** Criador
- **Contexto:** Necessidade de escolher a primeira alternativa a ser testada
- **Decisão:** Testar A2 (Bluetooth PAN) antes de A1 (Injeção de driver)
- **Justificativa:** A2 tem menor risco e não requer arquivos externos
- **Impacto:** A2 será a primeira alternativa testada
- **Alternativas descartadas:** A1 (requer arquivo .inf), A3 (requer rede funcional)
- **Arquivos relacionados:** PLAN.md (priorização), STATE.md (status A2)

---

## Decisões em Andamento
*(Nenhuma no momento - adicione conforme as decisões forem tomadas)*

---

## Decisões Pendentes
*(Nenhuma no momento - adicione conforme dúvidas surgirem)*


## D002 - Descartar A2 e priorizar A1
- **Data:** 2026-10-27
- **Decisor:** Agente-Opencode
- **Contexto:** Resposta indica que WinRE 1809 não possui suporte nativo adequado para Bluetooth PAN/NAP e não há utilitários de configuração
- **Decisão:** Descartar alternativa A2. Priorizar A1 (injeção de driver Wi-Fi via DISM) como próxima alternativa viável
- **Justificativa:** A2 não é viável no WinRE 1809 conforme análise técnica. A1 oferece caminho direto para resolver o problema principal (erro 10 no adaptador Wi-Fi)
- **Impacto:** Foco muda para localização do driver .inf e injeção via DISM no WinRE
- **Alternativas descartadas:** A2 (Bluetooth PAN)
- **Arquivos relacionados:** OPEN_QUESTIONS.md (OQ001), PLAN.md, STATE.md

---

## D003 - Repriorizar A4 e invalidar a premissa de A1/OQ002
- **Data:** 2026-10-27
- **Decisor:** Agente-Opencode
- **Contexto:** A análise anterior priorizou A1 assumindo que o driver Wi-Fi estaria em `C:\Windows\System32\DriverStore`. O enunciado afirma que a partição C: foi formatada, portanto esse caminho não existe. Além disso, A4 (imagem da partição de recuperação) nunca foi inventariada.
- **Decisão:** Priorizar A4 como caminho principal para R3. Manter A1 como condicional, apenas se houver `.inf` OEM em volume sobrevivente ou na partição de recuperação. Invalidar a resposta de OQ002 como fonte de driver.
- **Justificativa:** A4 é a única alternativa capaz de reinstalar o Windows sem rede e sem mídia física, desde que exista imagem completa local. A1 depende de um arquivo que pode não existir. Priorizar A1 sem inventário é especulação.
- **Impacto:** O foco passa a ser a Fase 0 (inventário de partições, imagens e drivers). Nenhuma injeção de driver deve ser tentada antes de localizar o `.inf` e o Hardware ID.
- **Alternativas descartadas:** A1 como prioridade 1 (bloqueado por insumo); A2 (inviável); A3 (dependente de rede); A5 (improvável sem Ethernet).
- **Arquivos relacionados:** CONFIG.md, PLAN.md (Fase 0 e árvore de decisão), STATE.md, OPEN_QUESTIONS.md (OQ002, OQ003).

---

## D004 - Critério formal de impossibilidade
- **Data:** 2026-10-27
- **Decisor:** Agente-Opencode
- **Contexto:** O desafio impõe ausência total de conexões físicas, C: formatada e ausência de rede. É necessário distinguir "ainda não tentado" de "impossível nas condições dadas".
- **Decisão:** Declarar o desafio impossível se, simultaneamente: (1) não houver imagem completa do Windows em volume local; (2) não houver driver Wi-Fi compatível em volume local; (3) não houver rede funcional nem boot de rede pelo firmware.
- **Justificativa:** Sem qualquer fonte local de bits e sem rede, não existe sequência de comandos capaz de reinstalar o Windows. Documentar isso evita tentativas infinitas e deixa claro qual premissa precisa ser alterada.
- **Impacto:** O relatório final deve apresentar a árvore de decisão e a evidência do inventário, em vez de afirmar sucesso não comprovado.
- **Alternativas descartadas:** Declarar sucesso presumido com base apenas em documentação teórica.
- **Arquivos relacionados:** PLAN.md (critérios de impossibilidade), STATE.md (evidências pendentes).

---

## D005 - Não responder dúvidas em nome do criador
- **Data:** 2026-10-27
- **Decisor:** Agente-Opencode
- **Contexto:** OQ001 e OQ002 foram respondidas pelo próprio agente que as levantou, sem participação do criador.
- **Decisão:** Respostas técnicas de agentes podem ser registradas como análise, mas não devem ser marcadas como resposta oficial do criador. OQ002 passa a ❌ Inválida como fonte de driver, mantendo a análise como histórico.
- **Justificativa:** O fluxo do AGENTS.md prevê que o criador responda às dúvidas; auto-respostas podem consolidar premissas erradas, como ocorreu com o DriverStore.
- **Impacto:** Dúvidas que dependem de dados do equipamento permanecem em aberto até que o inventário seja executado ou o criador responda.
- **Arquivos relacionados:** OPEN_QUESTIONS.md, STATE.md, AGENTS.md (seção 7).

