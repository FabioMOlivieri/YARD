*** Settings ***
Resource        ../../../Tasks/Control/ControlDescargaCamionCerealesTarjetaCancelar.robot
Resource        ../../../Tasks/Login.robot
Resource        ../../../Tasks/Menu.robot
Resource        ../../../Global Definitions/Variables.robot    
Suite Setup       Iniciar Aplicacion    ${gWebUrlUat}    ${gBrowserChrome}    ${gUser}    ${gContrasenia}    ${gIDTerminalTimbues}

**Test Cases

Ingresar Camion Cereal Tarjeta Cancelar 
    Ir a Controlar Camion Cereal
    IngresoCamionCerealTarjetaCancelar  