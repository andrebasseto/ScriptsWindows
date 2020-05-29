@echo off
REM COMPACTACAO E BACKUP DE ARQUIVOS .BAK DO BANCO DE DADOS UTILIZANDO 7ZIP E ROBOCOPY
REM NECESSARIO TER 7ZIP INSTALADO

e:
cd "E:\Backup\Diario Full"

REM MSG * Inicio da compactacao
for %%X in (*.bak) do "%ProgramFiles%\7-Zip\7z.exe" -tzip -mmt=off -m0=lzma -mx3 a "%%X.zip" "%%X"

REM MSG * Movendo arquivos
REM COPIA OS ARQUIVOS DA ORIGEM PARA DESTINO
robocopy "E:\Backup\Diario Full" "\\SERVIDORDESTINO\Backup" *.zip /w:5 /r:5 /b /j /mov

REM EXCLUIR OS ARQUIVO DE BAK SEM COMPACTAÇÃO
del *.BAK

REM pause
