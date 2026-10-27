# mmii

Estrutura:
- base/ = copia base do projeto (referencia, nao editar)
- agentes/NOME_DO_AGENTE/ = pasta de trabalho de cada agente

Regras:
- trabalhar na main
- nao criar branches para agentes
- cada agente CRIA SUA PROPIA pasta em agentes/ ao comecar, copiando base/
- toda pasta de agente DEVE declarar no README: nome do agente, organizacao e modelo (ex.: Agente: Vibe | Organizacao: Mistral AI | Modelo: GLM)
- regra anti-duplicacao: antes de criar pasta nova, procure uma pasta cujo README registre exatamente a sua tripla (agente + organizacao + modelo); se existir, CONTINUE nela
- nunca assumir que uma pasta existente e sua so porque o nome do modelo coincide; se houver duvida, criar pasta nova com sufixo unico
- autonomia real: montar ambiente de testes (ex.: VM QEMU/KVM com Windows 10 1809 + WinRE) e validar os comandos, coletando evidencias; nao entregar apenas analise estatica
- pesquisar de forma exaustiva e registrar fontes; evidencia negativa tambem e evidencia

Pastas conhecidas:
- agentes/deepseek/ = ver tripla no README da pasta
- agentes/beam-free/ = ver tripla no README da pasta
- agentes/glm/ = pasta do agente GLM original (restaurada, nao modificada; ver tripla no proprio README)
- agentes/vibe-mistral-glm/ = Agente: Vibe | Organizacao: Mistral AI | Modelo: GLM
