# DÚVIDAS EM ABERTO

## Como Usar Este Arquivo
Este arquivo registra **todas as dúvidas técnicas** que surgem durante o processo de resolução.

**Formato para cada dúvida:**
```markdown
## [ID] - [Título da Dúvida]
- **Data:** AAAA-MM-DD
- **Agente:** [Nome do agente que levantou a dúvida]
- **Categoria:** [Técnica/Hardware/Software/Procedimento]
- **Descrição:** [Dúvida detalhada]
- **Contexto:** [Em qual alternativa/etapa a dúvida surgiu]
- **Status:** 🔍 Em aberto | ✅ Respondido | ❌ Inválido
- **Resposta:** [Resposta do criador ou outro agente]
- **Respondido por:** [Nome de quem respondeu]
- **Data da resposta:** [AAAA-MM-DD]
- **Arquivos relacionados:** [Links para STATE.md, PLAN.md, etc.]
```

---

## Dúvidas em Aberto

## OQ001 - Suporte a Bluetooth PAN no WinRE 1809
- **Data:** 2026-10-27
- **Agente:** Agente-Opencode
- **Categoria:** Técnica
- **Descrição:** Windows Recovery Environment do Windows 10 1809 possui suporte nativo para Bluetooth Personal Area Network (PAN) / Network Access Point (NAP)? É possível estabelecer tethering Bluetooth com um celular?
- **Contexto:** Trabalhando na alternativa A2 - primeira prioridade conforme PLAN.md
- **Status:** 🔍 Em aberto
- **Resposta:** [Aguardando resposta do criador]
- **Respondido por:** [N/A]
- **Data da resposta:** [N/A]
- **Arquivos relacionados:** PLAN.md, STATE.md, AGENTS.md

## OQ002 - Arquivo .inf do driver Wi-Fi para A1
- **Data:** 2026-10-27
- **Agente:** Agente-Opencode
- **Categoria:** Técnica
- **Descrição:** Onde localizar o arquivo .inf do driver Wi-Fi compatível com o adaptador Wi-Fi (atualmente com erro 10 no WinRE)? O driver precisa estar acessível sem conexões físicas/externas - onde pode estar armazenado no sistema?
- **Contexto:** Preparando para alternativa A1 caso A2 falhe
- **Status:** 🔍 Em aberto
- **Resposta:** [Aguardando resposta do criador]
- **Respondido por:** [N/A]
- **Data da resposta:** [N/A]
- **Arquivos relacionados:** PLAN.md, AGENTS.md, CONFIG.md

---

## Dúvidas Respondidas
*(Nenhuma no momento - serão movidas aqui quando respondidas)*

---

## Categorias de Dúvidas

### 🔧 Técnicas
- Dúvidas sobre comandos, ferramentas ou procedimentos técnicos

### 🖥️ Hardware
- Dúvidas sobre compatibilidade, drivers ou dispositivos

### 💻 Software
- Dúvidas sobre o Windows, WinRE ou sistemas operacionais

### 📋 Procedimento
- Dúvidas sobre o fluxo de trabalho ou como proceder

---

## Instruções para Agentes

1. **Antes de adicionar uma dúvida:**
   - Verifique se já existe uma dúvida semelhante
   - Verifique se a resposta já está em DECISIONS.md
   - Verifique se a informação já está em CONFIG.md

2. **Ao adicionar uma dúvida:**
   - Use o formato padrão
   - Seja específico e detalhado
   - Inclua o contexto (em qual alternativa você está trabalhando)

3. **Ao responder uma dúvida:**
   - Adicione a resposta no campo "Resposta"
   - Mude o status para ✅ Respondido
   - Inclua seu nome e a data
   - Se a resposta resolver um bloqueio, atualize STATE.md

4. **Se uma dúvida for inválida:**
   - Mude o status para ❌ Inválido
   - Explique por que é inválida


## OQ001 - Resposta
- **Resposta:** Windows 10 1809 WinRE **NÃO possui suporte nativo completo para Bluetooth PAN (Personal Area Network)**. Embora o driver Bluetooth possa estar carregado no sistema, o stack de rede PAN/NAP geralmente não está incluído no WinRE padrão. Além disso, não há utilitários de configuração Bluetooth disponíveis conforme mencionado no desafio. É **altamente improvável** conseguir estabelecer tethering Bluetooth PAN com sucesso no WinRE 1809. **Recomenda-se descartar ou tratar A2 como não viável.**
- **Respondido por:** Agente-Opencode-Resposta
- **Data da resposta:** 2026-10-27
- **Status:** ✅ Respondido

## OQ002 - Resposta  
- **Resposta:** No Windows instalado, os drivers ficam em `C:\Windows\System32\DriverStore\FileRepository\`. Procure por pastas relacionadas ao adaptador Wi-Fi (geralmente com nomes como `net*`, `iwl*`, `rtwlane*`, `bcmwl*`, `athw*` dependendo do fabricante). O arquivo `.inf` estará lá dentro dessas pastas. Também é possível usar `pnputil /enum-drivers` ou procurar por arquivos `.inf` com `dir /s /b *.inf | findstr /i wireless` ou `findstr /i wifi`. Como o sistema foi formatado (partição C: formatada), mas outros volumes podem existir. Verifique todas as partições com `diskpart list vol` e procure em outros volumes montados também em `C:\Windows\System32\DriverStore` caso ainda existam vestígios. Caso não encontre no disco local, esta abordagem torna-se inviável sem acesso externo.
- **Respondido por:** Agente-Opencode-Resposta
- **Data da resposta:** 2026-10-27
- **Status:** ✅ Respondido
