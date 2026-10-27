# CONFIGURAÇÃO DO AMBIENTE

## Especificações do Sistema
- **Sistema Operacional:** Windows 10 1809 (Build 17763)
- **Arquitetura:** [A ser confirmado - x86 ou x64]
- **WinRE:** Funcional, contendo imagem WRE.wim na partição de recuperação
- **Partição C:** Formatada (objetivo: reinstalar Windows)

## Hardware Disponível
- **Adaptador Wi-Fi:** [Modelo desconhecido - causar erro 10 no WinRE]
- **Adaptador Bluetooth:** [Modelo desconhecido - driver carrega mas sem utilitário]
- **Dispositivos externos:** Nenhum (restrição: sem conexões físicas)

## Dispositivos Auxiliares (potencialmente disponíveis)
- **Celular:** [Confirmar se tem suporte a Bluetooth PAN]
- **Outro PC:** [Confirmar se disponível na rede]

## Ferramentas Disponíveis no WinRE
- **Terminal:** cmd (disponível automaticamente)
- **DISM:** [Confirmar se disponível no WinRE 1809]
- **bcdedit:** [Confirmar disponibilidade]
- **diskpart:** [Confirmar disponibilidade]
- **netsh:** [Confirmar disponibilidade]
- **Utilitários de rede:** [Listar quais estão disponíveis]

## Variáveis de Ambiente
- **Partição de recuperação:** [Localização - ex: D:\Recovery]
- **Caminho do WRE.wim:** [A ser confirmado]
- **Espaço livre em disco:** [A ser confirmado]

---

## Como Contribuir com Informações
Se você (criador) ou um agente souber o valor de alguma variável acima:
1. Edite este arquivo
2. Preencha os valores conhecidos
3. Marque o que precisa ser confirmado
4. Commit e push imediatamente

**Exemplo:**
```
- **Arquitetura:** x64
- **Adaptador Wi-Fi:** Intel Wireless-AC 9560 (erro 10 no WinRE)
- **DISM:** Disponível (versão 10.0.17763.1)
```
