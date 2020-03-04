*** Settings ***
Resource        ../../Actions/Cupo/AccionesBusquedaAvanzadaProducto.robot

*** Keywords ***
Buscar Producto Por Codigo
    [Arguments]     ${CodigoProducto}
    AccionesBusquedaAvanzadaProducto.IngresarCodigoProducto  ${CodigoProducto}
    AccionesBusquedaAvanzadaProducto.PresionarBuscar
    AccionesBusquedaAvanzadaProducto.SeleccionarPrimerRegistro
    AccionesBusquedaAvanzadaProducto.PresionarAceptar
