*** Settings ***
Resource        ../Actions/AccionesMenu.robot

*** Keywords ***
IrASubMenuCupo
    AccionesMenu.SeleccionarOpcionMenuSubMenu  ${locBtnMenu}
    AccionesMenu.SeleccionarOpcionMenuSubMenu   ${locBtnCupo}

IrAValidarCupo
    Ir A Otra Pagina  http://arrosvmapp313/ldc-yard/cupo/validar-cupo
    #Ir a SubMenu Cupo
    #SeleccionarOpcionMenuSubMenu   ${locBtnValidarCupo}

IrAGestionarCupo
    IrASubMenuCupo
    AccionesMenu.SeleccionarOpcionMenuSubMenu   ${locBtnGestionarCupo}

IrASubMenuControl
    AccionesMenu.SeleccionarOpcionMenuSubMenu   ${locBtnMenu}
    AccionesMenu.SeleccionarOpcionMenuSubMenu   ${locBtnControl}

IrACamion
    IrASubMenuControl
    AccionesMenu.SeleccionarOpcionMenuSubMenu   ${locBtnCamion}

Ir a Controlar Camion Cereal
    IrACamion
    AccionesMenu.SeleccionarOpcionMenuSubMenu   ${locBtnCamionCereal}