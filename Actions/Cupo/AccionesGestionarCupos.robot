*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/ControlesGestionarCupos.robot

*** Keywords ***
###################### Filtros ################################
SeleccionarTipoDocumentoPorte
    [Arguments]     ${IdTipoDocumentoPorte}
    ${ddlTipoDocumentoPorte}  Capturar Elemento  ${locDdlTipoDocumentoPorte}
    Elegir Opcion Lista Por Valor  ${ddlTipoDocumentoPorte}  ${IdTipoDocumentoPorte} 
IngresarNumeroDocumentoPorte
    [Arguments]    ${NumeroDocumentoPorte}
    ${txtNumeroDocumentoPorte}    Capturar Elemento   ${locTxtFiltroNumeroDocumentoPorte}
    Ingresar Texto    ${txtNumeroDocumentoPorte}    ${NumeroDocumentoPorte}
IngresarFechaCupo
    [Arguments]    ${FechaCupo}
    ${txtFechaCupo}    Capturar Elemento   ${locTxtFechaCupo}
    Ingresar Texto    ${txtFechaCupo}    ${FechaCupo}
IngresarTurno
    [Arguments]    ${Turno}
    ${txtTurno}    Capturar Elemento   ${locTxtTurno}
    Ingresar Texto    ${txtTurno}    ${Turno}
IngresarProducto
    [Arguments]    ${CodigoProducto}
    ${txtProducto}    Capturar Elemento    ${locTxtProducto}
    Ingresar Texto    ${txtProducto}    ${CodigoProducto}
    Press Keys  ${locTxtProducto}  TAB
IngresarCodigoCupo
    [Arguments]    ${NumeroCupo}
    ${txtCodigoCupo}    Capturar Elemento    ${locTxtCodigoCupo}
    Ingresar Texto    ${txtCodigoCupo}    ${NumeroCupo}
SeleccionarMotivo
    [Arguments]     ${IdMotivo}
    ${ddlMotivo}  Capturar Elemento  ${locDdlMotivo}
    Elegir Opcion Lista Por Valor  ${ddlMotivo}  ${IdMotivo} 
SeleccionarEstadoCupo
    [Arguments]     ${IdEstadoCupo}
    ${ddlEstadoCupo}  Capturar Elemento  ${locDdlEstadoCupo}
    Elegir Opcion Lista Por Valor  ${ddlEstadoCupo}  ${IdEstadoCupo} 
SeleccionarEstadoMovimiento
    [Arguments]     ${IdEstadoMovimiento}
    ${ddlEstadoMovimiento}  Capturar Elemento  ${locDdlEstadoMovimiento}
    Elegir Opcion Lista Por Valor  ${ddlEstadoMovimiento}  ${IdEstadoMovimiento} 

###################### Acciones Filtro #########################
PresionarBuscar
    ${btnBuscar}    Capturar Elemento    ${locBtnBuscar}
    Presionar Boton    ${btnBuscar}
PresionarLimpiar
    ${btnLimpiar}   Capturar Elemento  ${locBtnLimpiar}
    Presionar Boton  ${btnLimpiar}

####################### Resultado ###############################
ObtenerCantidadFilas
    ${CantidadFilas}    Get Element Count    ${locFilas}
    [Return]    ${CantidadFilas}
ObtenerCantidadColumnas
    ${locColumnas}  Catenate    ${locFilas}  [2] ${locAdicionalColumnas} 
    ${CantidadColumnas}    Get Element Count    ${locColumnas}
    [Return]    ${CantidadColumnas}
ObtenerValorCelda
    [Arguments]    ${NroFila}    ${NroColumna}
    ${locCelda}     Catenate    ${locFilas}  [   ${NroFila}    ]   ${locAdicionalColumnas}   [   ${NroColumna} ]
    ${ValorCelda}    Get Text   ${locCelda}  
    [Return]    ${ValorCelda}
SeleccionarFila
    [Arguments]    ${NroFila}
    ${locChkSeleccion}     Catenate   ${locFilas}  [   ${NroFila}    ]   ${locAdicionalColumnas}   [1] ${locAdicionalCheckbox}
    Presionar Boton    ${locChkSeleccion}

####################### Acciones ################################
PresionarConsultar
    ${btnConsultar}   Capturar Elemento  ${locBtnConsultar}
    Presionar Boton  ${btnConsultar}
PresionarModificar
    ${btnModificar}   Capturar Elemento  ${locBtnModificar}
    Presionar Boton  ${btnModificar}
PresionarAnular
    ${btnAnular}   Capturar Elemento  ${locBtnAnular}
    Presionar Boton  ${btnAnular}
PresionarExportarExcel
    ${btnExportarExcel}   Capturar Elemento  ${locBtnExportarExcel}
    Presionar Boton  ${btnExportarExcel}   
####################### Anular #################################
PresionarAceptarAnulacion
    ${btnAceptar}   Capturar Elemento  ${locBtnAceptarAnulacion}
    Presionar Boton  ${btnAceptar}
PresionarCancelarAnulacion
    ${btnCancelar}   Capturar Elemento  ${locBtnCancelarAnulacion}
    Presionar Boton  ${btnCancelar}
IngresarObservacionAnulacion
    [Arguments]     ${Observacion}
    ${txtObservaciones}    Capturar Elemento    ${locTxtObservaciones}
    Ingresar Texto    ${txtObservaciones}    ${Observacion}



