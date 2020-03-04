*** Settings ***
Resource        ../Libraries Proxy/Selenium Proxy.robot
Resource        ../User Interface/ControlesMenu.robot

*** Keywords ***
SeleccionarOpcionMenuSubMenu
    [Arguments]     ${NombreMenuOsubMenu}
    ${Button}    Capturar Elemento    ${NombreMenuOsubMenu}
    Presionar Boton    ${Button}