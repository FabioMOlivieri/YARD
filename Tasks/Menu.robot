*** Settings ***
Resource        ../Actions/Menu.robot

*** Keywords ***
Ir a Validar Cupo
    Ir A Otra Pagina  http://arrosvmapp313/ldc-yard/cupo/validar-cupo
    #Ir a SubMenu Cupo
    #Seleccionar Opcion Menu o SubMenu   ${locBtnValidarCupo}

Ir a Gestionar Cupo
    Ir a SubMenu Cupo
    Seleccionar Opcion Menu o SubMenu   ${locBtnGestionarCupo}

Ir a SubMenu Cupo
    Seleccionar Opcion Menu o SubMenu   ${locBtnMenu}
    Seleccionar Opcion Menu o SubMenu   ${locBtnCupo}

