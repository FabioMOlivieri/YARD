**Settings
Resource    ../../Actions/Cupo/AccionesGestionarCupos.robot
Resource    ../../Libraries Proxy/Selenium Proxy.robot

**Keywords
################## FILTRAR ####################
FiltrarMovimientos
    [Arguments]     ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${FechaCupo}    ${Turno}    ${CodigoProducto}   ${NumeroCupo}   ${IdMotivo}     ${IdEstadoCupo}     ${IdEstadoMovimiento}
    Run Keyword If  '${IdTipoDocumentoPorte}' is not '${Empty}'  AccionesGestionarCupos.SeleccionarTipoDocumentoPorte    ${IdTipoDocumentoPorte}
    Run Keyword If  '${NumeroDocumentoPorte}' is not '${Empty}'  AccionesGestionarCupos.IngresarNumeroDocumentoPorte     ${NumeroDocumentoPorte}
    Run Keyword If  '${FechaCupo}' is not '${Empty}'  AccionesGestionarCupos.IngresarFechaCupo   ${FechaCupo}
    Run Keyword If  '${Turno}' is not '${Empty}'  AccionesGestionarCupos.IngresarTurno   ${Turno}
    Run Keyword If  '${CodigoProducto}' is not '${Empty}'  AccionesGestionarCupos.IngresarProducto   ${CodigoProducto}
    Run Keyword If  '${NumeroCupo}' is not '${Empty}'  AccionesGestionarCupos.IngresarCodigoCupo     ${NumeroCupo}
    Run Keyword If  '${IdMotivo}' is not '${Empty}'  AccionesGestionarCupos.SeleccionarMotivo    ${IdMotivo}
    Run Keyword If  '${IdEstadoCupo}' is not '${Empty}'  AccionesGestionarCupos.SeleccionarEstadoCupo    ${IdEstadoCupo}
    Run Keyword If  '${IdEstadoMovimiento}' is not '${Empty}'  AccionesGestionarCupos.SeleccionarEstadoMovimiento    ${IdEstadoMovimiento}
    AccionesGestionarCupos.PresionarBuscar
    Sleep  5
LimpiarBusqueda
    AccionesGestionarCupos.PresionarLimpiar

#################### ACCIONES ###################
ConsultarMovimiento
    [Arguments]    ${NumeroDocumentoPorte}
    SeleccionarMovimiento  ${NumeroDocumentoPorte}
    AccionesGestionarCupos.PresionarConsultar
AnularMovimiento
    [Arguments]    ${NumeroDocumentoPorte}  ${Observacion}
    SeleccionarMovimiento  ${NumeroDocumentoPorte}
    AccionesGestionarCupos.PresionarAnular
    AccionesGestionarCupos.IngresarObservacionAnulacion  ${Observacion}
    AccionesGestionarCupos.PresionarAceptarAnulacion
ModificarMovimiento
    [Arguments]    ${NumeroDocumentoPorte}
    SeleccionarMovimiento  ${NumeroDocumentoPorte}
    AccionesGestionarCupos.PresionarModificar
ExportarMovimientos
    ${CantidadFilas}    AccionesGestionarCupos.ObtenerCantidadFilas
    Run Keyword And Return If  ${CantidadFilas}>0  AccionesGestionarCupos.PresionarExportarExcel
SeleccionarMovimiento
    [Arguments]     ${NumeroDocumentoPorte}
    ${CantidadFilas}    AccionesGestionarCupos.ObtenerCantidadFilas
    FOR    ${i}    IN RANGE    1    ${CantidadFilas}+1
        ${ValorCelda}    AccionesGestionarCupos.ObtenerValorCelda  ${i}    4
        Exit For Loop If    ${ValorCelda}==${NumeroDocumentoPorte}
    END
    AccionesGestionarCupos.SeleccionarFila  ${i}
