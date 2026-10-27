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
