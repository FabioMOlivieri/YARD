*** Settings ***
Resource        ../../../Tasks/Control/ControlDescargaCamionCerealesConsultarDatosAFIP.robot
Resource        ../../../Tasks/Login.robot
Resource        ../../../Tasks/Menu.robot
Resource        ../../../Global Definitions/Variables.robot    
Suite Setup       Iniciar Aplicacion    ${gWebUrlUat}    ${gBrowserChrome}    ${gUser}    ${gContrasenia}    ${gIDTerminalTimbues}

**Test Cases

Ingresar Camion Cereal Consultar Datos AFIP 
    Ir a Controlar Camion Cereal
    IngresoCamionCerealConsultarDatosAFIP