*** Settings ***
Resource        ../../../Tasks/Control/ControlDescargaCamionCerealesVerificarDatos.robot
Resource        ../../../Tasks/Login.robot
Resource        ../../../Tasks/Menu.robot
Resource        ../../../Global Definitions/Variables.robot    
Suite Setup       Iniciar Aplicacion    ${gWebUrlUat}    ${gBrowserChrome}    ${gUser}    ${gContrasenia}    ${gIDTerminalTimbues}

**Test Cases

Ingresar Camion Cereal Verificar Datos
    Ir a Controlar Camion Cereal
    IngresoCamionCerealVerificarDatos      