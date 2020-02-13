*** Settings ***
Resource        ../Libraries Proxy/Selenium Proxy.robot
Resource        ../User Interface/Menu.robot

*** Keywords ***
Seleccionar Opcion Menu o SubMenu
    [Arguments]     ${NombreMenuOsubMenu}
    ${btn}    Capturar Elemento    ${NombreMenuOsubMenu}
    Presionar Boton    ${btn}