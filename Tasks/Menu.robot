*** Settings ***
Resource        ../Actions/Menu.robot

*** Keywords ***
Ir a SubMenu Cupo
    Seleccionar Opcion Menu o SubMenu   ${locBtnMenu}
    Seleccionar Opcion Menu o SubMenu   ${locBtnCupo}

Ir a Validar Cupo
    Ir A Otra Pagina  http://arrosvmapp313/ldc-yard/cupo/validar-cupo
    #Ir a SubMenu Cupo
    #Seleccionar Opcion Menu o SubMenu   ${locBtnValidarCupo}

Ir a Gestionar Cupo
    Ir a SubMenu Cupo
    Seleccionar Opcion Menu o SubMenu   ${locBtnGestionarCupo}

Ir a subMenu Control
    Seleccionar Opcion Menu o SubMenu   ${locBtnMenu}
    Seleccionar Opcion Menu o SubMenu   ${locBtnControl}

Ir a Camion
    Ir a subMenu Control
    Seleccionar Opcion Menu o SubMenu   ${locBtnCamion}

Ir a Controlar Camion Cereal
    Ir a Camion
    Seleccionar Opcion Menu o SubMenu   ${locBtnCamionCereal}