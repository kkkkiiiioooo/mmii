# DESAFIO: Recuperação do Windows sem conexões físicas

## 1. Objetivo
Restaurar o sistema operacional Windows em uma partição C: formatada, sem o uso de cabos, pendrives ou adaptadores físicos.

## 2. Contexto
- **Sistema operacional:** Windows 10 1809
- **Ambiente de recuperação:** WinRE (Windows Recovery Environment) funcional, contendo a imagem WRE.wim na partição de recuperação
- **Problema 1:** WinRE não possui driver Wi-Fi completo, resultando em erro 10 (dispositivo não pode ser iniciado) no adaptador de rede sem fio
- **Problema 2:** Driver Bluetooth é carregado pelo sistema, porém não há utilitário disponível para sua configuração e uso
- **Acesso disponível:** Terminal (cmd) acessível no WinRE, iniciado automaticamente durante o boot
- **Restrição crítica:** Ausência total de conexões físicas (cabos, adaptadores, dispositivos de armazenamento externo)

## 3. Requisitos

| ID | Requisito | Critério de sucesso | Prioridade |
|----|-----------|---------------------|------------|
| R1 | Estabelecer conectividade de rede dentro do WinRE | Adaptador de rede sem erro 10 e endereço IP válido atribuído | Alta |
| R2 | Obter driver Wi-Fi compatível | Driver corretamente instalado e operacional | Alta |
| R3 | Reinstalar Windows sem mídia física | Sistema bootando até a tela inicial de configuração | Alta |
| R4 | Utilizar Bluetooth como rede (PAN) | Conexão funcional com celular ou outro PC | Média |
| R5 | Preservar drivers após reinstalação | Wi-Fi ativo e funcional após o primeiro boot do sistema reinstalado | Média |

## 4. Alternativas

| # | Alternativa | Requisitos | Nível de risco |
|---|-------------|------------|---------------|
| A1 | Injeção de driver Wi-Fi no WinRE via DISM pelo cmd | Arquivo .inf do driver acessível | Médio |
| A2 | Conexão Bluetooth PAN com celular | Dispositivo móvel com suporte a tethering via Bluetooth | Baixo |
| A3 | Redefinição do PC com download na nuvem | Conexão de rede funcional | Baixo |
| A4 | Restauração a partir da partição de recuperação | Partição de recuperação intacta e acessível | Baixo |
| A5 | Reinstalação por rede (PXE/WDS) | Servidor PXE/WDS disponível na LAN | Alto |

## 5. Critério de seleção
Selecionar a alternativa que atenda ao maior número de requisitos (R1 a R5) com o menor nível de risco associado.

---

## 6. Regras para agentes
- **Responder sempre em português:** Todas as respostas, análises e comunicações devem ser feitas exclusivamente em português brasileiro.
- **Padronização técnica:** Utilizar linguagem técnica clara e objetiva, seguindo os padrões de documentação de engenharia.
- **Commits imediatos:** Qualquer alteração nos arquivos do repositório deve ser cometada e enviada para o remoto imediatamente após a modificação.
- **Tudo documentado:** NENHUMA informação, resposta ou discussão deve ser feita no bate-papo. TODAS as interações, progressos, dúvidas e soluções devem ser registradas exclusivamente nos documentos deste repositório.
- **AGENTS.md é imutável:** Apenas o criador do desafio pode modificar este arquivo. Agentes devem usar PLAN.md, STATE.md, DECISIONS.md, OPEN_QUESTIONS.md e CONFIG.md para seu trabalho.

---

## 7. Fluxo de Trabalho para Agentes

### Como contribuir:
1. **Leia AGENTS.md** - Entenda o desafio e regras
2. **Consulte CONFIG.md** - Veja as especificações do ambiente
3. **Consulte PLAN.md** - Veja o plano de ação atual
4. **Verifique STATE.md** - Veja o estado atual do progresso
5. **Trabalhe em sua alternativa** - Siga as instruções do PLAN.md
6. **Documente tudo** - Atualize STATE.md, DECISIONS.md ou OPEN_QUESTIONS.md conforme necessário

### Se encontrar uma dúvida:
1. **Verifique se já está em OPEN_QUESTIONS.md**
2. **Se não estiver:** Adicione a dúvida em OPEN_QUESTIONS.md e continue trabalhando em outras alternativas
3. **Se o criador responder:** A resposta será adicionada em OPEN_QUESTIONS.md ou DECISIONS.md

### Se encontrar uma solução:
1. **Documente o processo** em STATE.md
2. **Registre a decisão** em DECISIONS.md
3. **Atualize o estado** da alternativa em PLAN.md

### Se uma alternativa falhar:
1. **Documente o motivo** em STATE.md
2. **Atualize o status** em PLAN.md
3. **Passe para a próxima alternativa** do plano

---

## 8. Estratégia de Trabalho com Múltiplos Agentes

### Abordagem: "Dividir para Conquistar com Documentação Centralizada"

#### Princípio 1: Especialização por Alternativa
- Cada agente **escolhe uma alternativa** do PLAN.md
- **Foca exclusivamente** naquela alternativa até concluir ou esgotar possibilidades
- **NÃO trabalhe em múltiplas alternativas** simultaneamente

#### Princípio 2: Documentação em Tempo Real
- **A cada 30 minutos de trabalho**, faça commit com as atualizações
- **A cada descoberta** (positiva ou negativa), documente em STATE.md
- **A cada dúvida**, adicione em OPEN_QUESTIONS.md

#### Princípio 3: Evitar Trabalho Duplicado
- **Sempre verifique STATE.md** antes de começar
- Se uma alternativa já está **"Em teste"**, **NÃO comece a mesma alternativa**
- Se uma alternativa já **falhou**, **NÃO tente a mesma abordagem**

#### Princípio 4: Colaboração Assíncrona
- **As respostas do criador** serão adicionadas em OPEN_QUESTIONS.md
- **As decisões importantes** serão registradas em DECISIONS.md
- **O progresso geral** pode ser acompanhado em STATE.md

#### Princípio 5: Priorização Dinâmica
- Se uma alternativa **falhar**, o PLAN.md será atualizado
- A próxima alternativa na lista **automaticamente se torna prioridade**
- **NÃO pule etapas** do plano

### Exemplo de Fluxo com 3 Agentes:

**Agente 1:**
- Escolhe A2 (Bluetooth PAN)
- Testa por 1 hora
- Descobre que WinRE 1809 não tem suporte a PAN
- Atualiza STATE.md: "A2 - Falhou: WinRE 1809 não tem suporte nativo a Bluetooth PAN"
- Adiciona em OPEN_QUESTIONS.md: "Existe forma de adicionar suporte a PAN no WinRE?"

**Agente 2:**
- Escolhe A1 (Injeção de driver Wi-Fi)
- Descobre que precisa do arquivo .inf
- Adiciona em OPEN_QUESTIONS.md: "Onde localizar o arquivo .inf do driver Wi-Fi?"
- Continua pesquisando

**Agente 3:**
- Escolhe A4 (Restauração da partição de recuperação)
- Verifica se partição está intacta
- Atualiza STATE.md: "A4 - Em teste: Verificando integridade da partição de recuperação"

**Criador (Você):**
- Responde em OPEN_QUESTIONS.md: "Arquivo .inf pode estar em C:\Windows\System32\DriverStore"
- Responde em OPEN_QUESTIONS.md: "WinRE 1809 não tem suporte a PAN, descarte A2"

**Resultado:**
- Todos os agentes **sabem o que fazer** sem precisar de bate-papo
- O trabalho **não se duplica**
- As **prioridades ficam claras**
