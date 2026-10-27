# AGENTS

## Objetivo
Voce esta em uma sandbox completa. Assuma que pode e deve usar terminal, navegador, instalacao de dependencias, execucao de scripts, testes, depuracao, leitura e alteracao de arquivos para resolver o problema.

Receber apenas o link do repositorio ja e uma instrucao suficiente para agir. Nao espere orientacao extra se houver caminhos tecnicos plausiveis para continuar.

## Modo de trabalho obrigatorio
- Trabalhe sempre na branch `main`.
- Nao crie branches.
- Use a estrutura oficial do repositorio:
  - `base/` = versao base do projeto.
  - `agentes/NOME_DO_MODELO/` = copia de trabalho do agente atual.
- Crie ou atualize apenas a pasta do modelo que estiver executando a tarefa.
- Nao altere pastas de outros modelos sem necessidade explicita.
- Registre descobertas, decisoes, estado atual e duvidas nos documentos do repositorio sempre que fizer sentido.
- Faca commits pequenos e frequentes.

## Persistencia obrigatoria
- Nao pare cedo.
- Nao faca apenas analise estatica.
- Tente executar o projeto, nao apenas ler arquivos.
- Se algo falhar, diagnostique o erro e tente outra abordagem.
- Se faltar dependencia, instale.
- Se faltar comando obvio, procure alternativas reais.
- Se faltar documentacao, deduza pela estrutura do projeto, nomes de arquivos, scripts e convencoes da stack.
- Pesquise, teste, corrija, valide e repita ate resolver ou provar um bloqueio externo real.

## Exploracao minima esperada
Ao receber uma tarefa ou apenas o link do repositorio, faca no minimo o seguinte, nessa ordem quando aplicavel:
1. Inspecionar a arvore de arquivos.
2. Procurar `README.md`, `AGENTS.md`, `Makefile`, `Dockerfile`, `docker-compose.yml`, `package.json`, `pyproject.toml`, `requirements.txt`, scripts e testes.
3. Identificar a stack e o fluxo de execucao mais provavel.
4. Instalar dependencias necessarias.
5. Rodar testes existentes.
6. Se nao houver testes, tentar subir o projeto e validar o comportamento real.
7. Se houver interface web, abrir no navegador e verificar o resultado.
8. Se houver erro, corrigir e tentar novamente.
9. Repetir o ciclo ate obter resultado util.

## Criterio de parada
Nao considere a tarefa concluida apenas por:
- listar arquivos,
- ler documentacao,
- relatar que faltam instrucoes,
- ou descrever hipoteses sem executar.

So finalize quando ocorrer um destes casos:
1. problema resolvido,
2. projeto funcional e validado,
3. ou bloqueio externo real comprovado com evidencia suficiente.

## Navegacao por pastas de agentes
- A raiz deve continuar simples e previsivel.
- Cada agente deve criar e trabalhar dentro da sua propria pasta `agentes/NOME_DO_AGENTE/`.
- NUNCA assuma que uma pasta existente em agentes/ e sua so porque o nome do modelo coincide.
- A identificacao do modelo pode falhar, e varios agentes podem compartilhar o mesmo modelo.
- Ao comecar o trabalho, cada agente DEVE criar a sua propria pasta: agentes/SEU_NOME_DE_AGENTE/, copiando o conteudo de base/.
- Se ja existir uma pasta com o nome do seu modelo e nao houver certeza de que foi criada por voce, crie uma pasta NOVA com sufixo unico (ex.: agentes/glm-2/ ou agentes/vibe-glm/) em vez de editar a pasta alheia.
- Registre no README.md da sua pasta: quem e voce (nome do agente e modelo), data de criacao e o que editou.
- Exemplo historico: a pasta agentes/deepseek/ pertence ao agente deepseek; a pasta agentes/glm/ foi usada pelo agente GLM (Vibe).
- A pasta `base/` deve permanecer como referencia principal para novas copias.

## Prioridade destas regras
Este arquivo na raiz vale para todo o repositorio e deve ser seguido como instrucao padrao automatica.
