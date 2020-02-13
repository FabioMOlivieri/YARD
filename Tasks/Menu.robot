*** Settings ***
Resource        ../Actions/Menu.robot

*** Keywords ***
Ir a Validar Cupo
    Ir a SubMenu Cupo
    Seleccionar Opcion Menu o SubMenu   ${locBtnValidarCupo}

Ir a Gestionar Cupo
    Ir a SubMenu Cupo
    Seleccionar Opcion Menu o SubMenu   ${locBtnGestionarCupo}

Ir a SubMenu Cupo
    Seleccionar Opcion Menu o SubMenu   ${locBtnMenu}
    Seleccionar Opcion Menu o SubMenu   ${locBtnCupo}

