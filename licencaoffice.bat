@echo off

REM ABRE A CONEXAO COM O SERVIDOR PARA ARMAZENAR AS LICENÇAS
REM CONEXAO POR DNS E IP
net use \\servidor SENHA /USER:USUARIO
net use \\IP USUARIO /USER:SENHA

c:
cd \
mkdir licoffice
cd licoffice
echo %computername%_%username% > %computername%_%username%.txt

if exist "C:\Program Files\Microsoft Office\Office14\OSPP.VBS" (
    echo "Office 2010"
    cscript "C:\Program Files\Microsoft Office\Office14\OSPP.VBS" /dstatus > %computername%_%username%.txt
   
) else (
    echo "Arquivo nao existe"
)
if exist "C:\Program Files\Microsoft Office\Office15\OSPP.VBS" (
    echo "Office 2013"
    cscript "C:\Program Files\Microsoft Office\Office15\OSPP.VBS" /dstatus > %computername%_%username%.txt
) else (
    echo "Arquivo nao existe"
)
if exist "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" (
    echo "Office 2016"
    cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /dstatus > %computername%_%username%.txt
    
) else (
    echo "Arquivo nao existe"
    
)


echo on windows 64 bits
if exist "C:\Program Files (x86)\Microsoft Office\Office14\OSPP.VBS" (
    echo "Office 2010 32 bits"
    cscript "C:\Program Files (x86)\Microsoft Office\Office14\OSPP.VBS" /dstatus > %computername%_%username%.txt
) else (
   echo "Arquivo nao existe"
)
if exist "C:\Program Files\Microsoft Office\Office14\OSPP.VBS" (
    echo "Office 2010 64 bits"
    cscript "C:\Program Files\Microsoft Office\Office14\OSPP.VBS" /dstatus > %computername%_%username%.txt
) else (
    echo "Arquivo nao existe"
)
if exist "C:\Program Files (x86)\Microsoft Office\Office15\OSPP.VBS" (
    echo "Office 2013 32 bits"
    cscript "C:\Program Files (x86)\Microsoft Office\Office15\OSPP.VBS" /dstatus > %computername%_%username%.txt
) else (
    echo "Arquivo nao existe"
)
if exist "C:\Program Files\Microsoft Office\Office15\OSPP.VBS" (
    echo "Office 2013 64 bits"
    cscript "C:\Program Files\Microsoft Office\Office15\OSPP.VBS" /dstatus > %computername%_%username%.txt
) else (
    echo "Arquivo nao existe"
)
if exist "C:\Program Files (x86)\Microsoft Office\Office16\OSPP.VBS" (
    echo "Office 2016 32 bits"
    cscript "C:\Program Files (x86)\Microsoft Office\Office16\OSPP.VBS" /dstatus > %computername%_%username%.txt
) else (
    echo "Arquivo nao existe"
)
if exist "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" (
    echo on "Office 2016 64 bits"
    cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /dstatus > %computername%_%username%.txt
) else (
    echo "Arquivo nao existe"
)


REM COPIA A LICENÇA PARA O SERVIDOR
c:
cd c:\licoffice
xcopy *.txt \\servidor\PASTADESTINO\ /y
xcopy *.txt \\IP\PASTADESTINO\ /y
