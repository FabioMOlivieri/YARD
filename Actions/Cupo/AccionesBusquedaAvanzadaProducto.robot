*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/ControlesBusquedaAvanzadaProducto.robot

*** Keywords ***
IngresarCodigoProducto
    [Arguments]    ${CodigoProducto}
    ${txtCodigoProducto}    Capturar Elemento    ${locTxtCodigoProducto}
    Ingresar Texto    ${txtCodigoProducto}    ${CodigoProducto}

IngresarDescripcionProducto
    [Arguments]    ${DescripcionProducto}
    ${txtDescripcionProducto}    Capturar Elemento    ${locTxtDescripcionProducto}
    Ingresar Texto    ${txtDescripcionProducto}    ${DescripcionProducto}

PresionarBuscar
    ${btnBuscar}    Capturar Elemento  ${locBtnBuscar}
    Presionar Boton  ${btnBuscar}

SeleccionarPrimerRegistro
    ${chkSeleccion}    Capturar Elemento  ${locPrimerCheck}
    Presionar Boton  ${chkSeleccion}

PresionarAceptar
    ${btnAceptar}    Capturar Elemento  ${locBtnAceptarBusqueda}
    Presionar Boton  ${btnAceptar}

PresionarCancelar
    ${btnCancelar}    Capturar Elemento  ${locBtnCancelarBusqueda}
    Presionar Boton  ${btnCancelar}