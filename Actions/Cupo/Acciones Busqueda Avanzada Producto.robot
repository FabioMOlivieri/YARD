*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/Controles Busqueda Avanzada Producto.robot

*** Keywords ***
Ingresar Codigo Producto
    [Arguments]    ${CodigoProducto}
    ${txtCodigoProducto}    Capturar Elemento    ${locTxtCodigoProducto}
    Ingresar Texto    ${txtCodigoProducto}    ${CodigoProducto}

Ingresar Descripcion Producto
    [Arguments]    ${DescripcionProducto}
    ${txtDescripcionProducto}    Capturar Elemento    ${locTxtDescripcionProducto}
    Ingresar Texto    ${txtDescripcionProducto}    ${DescripcionProducto}

Presionar Buscar
    ${btnBuscar}    Capturar Elemento  ${locBtnBuscar}
    Presionar Boton  ${btnBuscar}

Seleccionar primer registro
    ${chkSeleccion}    Capturar Elemento  ${locPrimerCheck}
    Presionar Boton  ${chkSeleccion}

Presionar Aceptar
    ${btnAceptar}    Capturar Elemento  ${locBtnAceptarBusqueda}
    Presionar Boton  ${btnAceptar}

Presionar Cancelar
    ${btnCancelar}    Capturar Elemento  ${locBtnCancelarBusqueda}
    Presionar Boton  ${btnCancelar}