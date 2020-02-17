*** Settings ***
Resource        ../../../Tasks/Cupo/Validar Cupo.robot
Resource        ../../../Tasks/Login.robot
Resource        ../../../Tasks/Menu.robot
Resource        ../../../Global Definitions/Variables.robot
Suite Setup       Iniciar Aplicacion    ${gWebUrlUat}    ${gBrowserChrome}    ${gUser}    ${gContrasenia}    ${gIDTerminalTimbues}

**Test Cases
Prueba acciones
    Ir a Validar Cupo
    Validar acciones
