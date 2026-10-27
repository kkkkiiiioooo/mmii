# CONFIGURAÇÃO DO AMBIENTE

## Especificações do Sistema
- **Sistema Operacional:** Windows 10 1809 (Build 17763)
- **Arquitetura:** x64 (provável — Intel Atom x5-Z8500 é 64 bits; confirmar com `wmic os get osarchitecture` ou `echo %PROCESSOR_ARCHITECTURE%` no WinRE)
- **WinRE:** Funcional, contendo a imagem `WRE.wim` na partição de recuperação
- **Partição C:** Formatada (objetivo: reinstalar Windows)
- **Firmware:** [A confirmar — UEFI ou Legacy/BIOS; verificar com `bcdedit /enum {fwbootmgr}` e `diskpart` → `list disk` (coluna GPT)]

## Hardware Disponível
- **Plataforma:** Intel Atom x5-Z8500 (tablet/2 em 1) — informação herdada da versão anterior do desafio; confirmar
- **Adaptador Wi-Fi:** [Modelo desconhecido — causa erro 10 no WinRE]
- **Adaptador Bluetooth:** [Modelo desconhecido — driver carrega, mas sem utilitário de configuração]
- **Dispositivos externos:** Nenhum (restrição: sem conexões físicas)

## Dispositivos Auxiliares (potencialmente disponíveis)
- **Celular:** [Confirmar se tem suporte a Bluetooth PAN e se já está pareado com o dispositivo]
- **Outro PC:** [Confirmar se disponível na mesma LAN — irrelevante enquanto não houver rede no WinRE]
- **Servidor PXE/WDS:** [Confirmar existência — inútil sem interface de rede funcional ou boot HTTP por Wi-Fi no firmware]

## Ferramentas Disponíveis no WinRE 1809
- **Terminal:** cmd (disponível automaticamente)
- **DISM:** Sim — `X:\Windows\System32\Dism.exe` (componente do Windows PE)
- **bcdedit:** Sim
- **diskpart:** Sim
- **netsh:** Sim
- **wpeutil / wpeinit:** Sim — `wpeutil InitializeNetwork`, `wpeinit`
- **drvload:** Sim — carrega `.inf` no WinPE em execução
- **pnputil:** Sim — `pnputil /add-driver`, `pnputil /enum-drivers`
- **curl:** Sim (nativo desde 1803) — porém inútil sem rede
- **PowerShell:** Não disponível por padrão no WinRE
- **devcon:** Não disponível por padrão
- **Utilitários de rede:** `netsh`, `ipconfig`, `ping`, `wpeutil`; serviço WLAN (wlansvc) não é iniciado por padrão

## Variáveis de Ambiente
- **Partição de recuperação:** [Localização a confirmar — tipicamente tipo GPT `de94bba4-06d1-4d40-a16a-bfd50179d6ac`, com `\Recovery\WindowsRE\Winre.wim`]
- **Caminho do WRE.wim:** [A confirmar — normalmente `\Recovery\WindowsRE\Winre.wim`]
- **Espaço livre em disco:** [A confirmar — precisa comportar a imagem aplicada, ~15–20 GB para Windows 10 x64]
- **Imagem completa do Windows (install.wim/esd):** [Crítico — confirmar se existe na partição de recuperação ou em outro volume]

---

## Fatos que restringem a solução

1. **C: está formatada.** Portanto `C:\Windows\System32\DriverStore` **não existe** e não pode ser fonte de driver. Qualquer análise que dependa do DriverStore da instalação antiga é inválida.
2. **Não há rede funcional.** Wi-Fi está em erro 10 e Bluetooth não tem stack/utilidade PAN no WinRE 1809.
3. **Não há mídia física.** Os únicos bits disponíveis estão no armazenamento interno (partições sobreviventes, inclusive a de recuperação) ou no firmware.
4. **Sem imagem de instalação local, R3 é impossível.** O `WRE.wim` é um Windows PE de recuperação; ele **não** contém os pacotes de um Windows completo e não leva a OOBE.

## Como Contribuir com Informações
Se você (criador) ou um agente souber o valor de alguma variável acima:
1. Edite este arquivo
2. Preencha os valores conhecidos
3. Marque o que precisa ser confirmado
4. Commit e push imediatamente
