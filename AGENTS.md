# GOAL/CHALLENGE: Recuperar Windows sem conexões físicas

## 1. Objetivo
Restaurar o Windows com a particao C formatada, sem cabos, pendrive ou adaptadores.

## 2. Contexto
- Sistema: Windows 10 1809 com WinRE funcional na particao que possui a imagem WRE.wim.
- Problema 1: WinRE sem driver Wi-Fi completo, causando erro 10 no adaptador.
- Problema 2: driver Bluetooth carrega, mas não há utilitário para usá-lo.
- Acesso: terminal (cmd) disponível no WinRE, pois inicia automaticamente.
- Restrição: nenhuma conexão física.

## 3. Requisitos
| ID | Requisito | Critério de sucesso | Prioridade |
|----|-----------|---------------------|------------|
| R1 | Obter rede dentro do WinRE | Adaptador sem erro 10 e IP válido | Alta |
| R2 | Obter driver Wi-Fi compatível | Driver instalado e funcionando | Alta |
| R3 | Reinstalar Windows sem pendrive | Boot até a tela inicial | Alta |
| R4 | Usar Bluetooth como rede (PAN) | Conexão com celular ou PC | Média |
| R5 | Manter drivers após reinstalação | Wi-Fi ativo após primeiro boot | Média |

## 4. Alternativas
| # | Alternativa | Requer | Risco |
|---|-------------|--------|-------|
| A1 | Injetar driver Wi-Fi no WinRE via DISM pelo cmd | Arquivo .inf acessível | Médio |
| A2 | Bluetooth PAN com celular | Celular com tethering BT | Baixo |
| A3 | Redefinir este PC com download na nuvem | Rede funcional | Baixo |
| A4 | Restaurar partição de recuperação | Partição intacta | Baixo |
| A5 | Reinstalação por rede (PXE/WDS) | Servidor na LAN | Alto |

## 6. Critério final
Escolher a alternativa que cumpra o maior número de R1 a R5 com menor risco.
