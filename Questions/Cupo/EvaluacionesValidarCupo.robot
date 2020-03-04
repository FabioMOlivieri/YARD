*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/ControlesValidarCupo.robot
Resource        ../../Global Definitions/Mensajes.robot
Resource        ../../Global Definitions/Constantes.robot
Library         Collections

**Keywords

#################### TESTS PRUEBAS PUNTUALES ########################

TipoProductoDebeSer ${TipoProducto}
    Element Should Contain  ${locDdlTipoProducto}   ${TipoProducto}   
TipoDocumentoPorteDebeSer ${TipoDocumento} YEstarDeshabilitado
    Element Should Contain  ${locDdlTipoDocumentoPorte}  ${TipoDocumento}
    Element Should Be Disabled  ${locDdlTipoDocumentoPorte}
NroDocumentoPorteDebeTenerFoco
    Element Should Be Focused  ${locTxtNumeroDocumentoPorte}
NroCupoDebeEstarHabilitadoYDatosDocumentoInhabilitados
    Element Should Be Enabled  ${locTxtCodigoCupo}
    Element Should Be Disabled  ${locTxtProducto}
    Element Should Be Disabled  ${locBtnBuscarProducto}
    Element Should Be Disabled  ${locTxtVendedor}
    Element Should Be Disabled  ${locBtnBuscarVendedor}
    Element Should Be Disabled  ${locTxtCorredor}
    Element Should Be Disabled  ${locBtnBuscarCorredor}
    Element Should Be Disabled  ${locTxtDestinatario}
    Element Should Be Disabled  ${locBtnDestinatario}
    Element Should Be Disabled  ${locDdlFinalidad}
    Element Should Be Disabled  ${locDdlMotivoCupo}
    Element Should Be Disabled  ${locTxtSedeOrigen}
    Element Should Be Focused  ${locTxtCodigoCupo}
DatosDocumentoDebenEstarHabilitadosYNroCupoInhabilitado 
    Element Should Be Disabled  ${locTxtCodigoCupo}
    Element Should Be Enabled  ${locTxtProducto}
    Element Should Be Enabled  ${locBtnBuscarProducto}
    Element Should Be Enabled  ${locTxtVendedor}
    Element Should Be Enabled  ${locBtnBuscarVendedor}
    Element Should Be Enabled  ${locTxtCorredor}
    Element Should Be Enabled  ${locBtnBuscarCorredor}
    Element Should Be Enabled  ${locTxtDestinatario}
    Element Should Be Enabled  ${locBtnDestinatario}
    Element Should Be Enabled  ${locDdlFinalidad}
    Element Should Be Enabled  ${locDdlMotivoCupo}
    Element Should Be Enabled  ${locTxtSedeOrigen}
DatosEPADebenEstarHabilitados
    Element Should Be Enabled  ${locTxtTitular}
    Element Should Be Enabled  ${locBtnBuscarTitular}
    Element Should Be Enabled  ${locDdlCampoEPA}
DatosEPADebenEstarDeshabilitados
    Element Should Be Disabled  ${locTxtTitular}
    Element Should Be Disabled  ${locBtnBuscarTitular}
    Element Should Be Disabled  ${locDdlCampoEPA}
SistemaDebeRecuperarDatosCupoIngresado
    [Arguments]     ${Cupo}
    ${Producto}=   Get Value  ${locTxtProducto}
    ${Vendedor}=    Get Value  ${locTxtVendedor}
    ${Corredor}=    Get Value  ${locTxtCorredor}
    ${Destinatario}=    Get Value  ${locTxtDestinatario}
    ${Finalidad}=   Get Value  ${locDdlFinalidad}
    ${MovitoCupo}=  Get Value  ${locDdlMotivoCupo}
     ${Query}=   Catenate  SELECT P.ALIAS, SS.FISCAL_CODE, SB.FISCAL_CODE, SC.FISCAL_CODE, QC.ID_PURPOSE, QC.ID_QUOTA_REASON
        ...     FROM T_QUOTA_DET_CODE QC INNER JOIN T_PRODUCT P ON P.ID_PRODUCT = QC.ID_PRODUCT
        ...     INNER JOIN T_SOCIETY SS ON SS.ID_SOCIETY = QC.ID_SELLER
        ...     LEFT JOIN T_SOCIETY SB ON SB.ID_SOCIETY = QC.ID_BROKER 
        ...     INNER JOIN T_SOCIETY SC ON SC.ID_SOCIETY = QC.ID_CONSIGNEE 
        ...     WHERE QUOTA_CODE = '${Cupo}'
    ${ResultadoQuery}   Query   ${Query}
    Should Be Equal As Integers  ${Producto}    ${ResultadoQuery[0][0]}
    Run Keyword If  ${ResultadoQuery[0][1]} is not None  Should Be Equal  ${Vendedor}    ${ResultadoQuery[0][1]}
    Run Keyword If  ${ResultadoQuery[0][2]} is not None  Should Be Equal  ${Corredor}    ${ResultadoQuery[0][2]}
    Run Keyword If  ${ResultadoQuery[0][3]} is not None  Should Be Equal  ${Destinatario}    ${ResultadoQuery[0][3]}
    Run Keyword If  ${ResultadoQuery[0][4]} is not None  Should Be Equal As Integers  ${Finalidad}   ${ResultadoQuery[0][4]}
    Run Keyword If  ${ResultadoQuery[0][5]} is not None  Should Be Equal As Integers  ${MovitoCupo}      ${ResultadoQuery[0][5]}
SistemaDebeInformarCupoAnteriorOPosterior
    Page Should Contain  ${msjCupoAnteriorOPosterior} 
SistemaDebeMarcarIngresoSinCupo
    Checkbox Should Be Selected  ${locChkSinCupo}
SistemaDebeInformarCupoYaUtilizado
    Page Should Contain  ${msjCupoUtilizado}
    Element Should Be Disabled  ${locBtnAceptar}
SistemaDebeVisualizarDescripcionProductoSeleccionado
    [Arguments]     ${CodigoProducto}
    ${ResultadoQuery}=  Query  SELECT NAME_PRODUCT FROM T_PRODUCT WHERE ID_PRODUCT = ${CodigoProducto} 
    Element Text Should Be  ${loclblDescripcionProducto}  ${ResultadoQuery[0][0]}
SistemaDebeVisualizarTodasFinalidadesActivas
    [Arguments]     ${IdCircuito}
    ${Lista}     Get List Items  ${locDdlFinalidad}
    ${Consulta}=    Catenate  SELECT NAME_PURPOSE FROM T_PURPOSE P
        ...     INNER JOIN T_CIRCUIT_PURPOSE CP ON P.ID_PURPOSE = CP.ID_PURPOSE
        ...     WHERE P.ACTIVE = 1 AND CP.ID_CIRCUIT = ${IdCircuito}
    ${ResultadoConsulta}=   Query  ${Consulta}
    ${CantFilas}=   Get Length  ${ResultadoConsulta}
    FOR     ${i}    IN RANGE    1   ${CantFilas}
        Should Be Equal  ${ResultadoConsulta[${i}-1][0]}  ${Lista[${i}]}
    END
#SistemaDebeInformarIngresoExitoso
#    Page Should Contain  Se aceptó el ingreso de la descarga
#SistemaDebeInformarAccionDejarPendienteExitosa
#    Page Should Contain  La descarga quedó en estado Pendiente
#SistemaDebeInformarCamposObligatoriosSinCupoYSinWsAfip
#    ${Producto}=   Get Value  ${locTxtProducto}
#    ${Vendedor}=    Get Value  ${locTxtVendedor}
#    ${Corredor}=    Get Value  ${locTxtCorredor}
#    ${Destinatario}=    Get Value  ${locTxtDestinatario}
#    ${Finalidad}=   Get Value  ${locDdlFinalidad}
#    ${MovitoCupo}=  Get Value  ${locDdlMotivoCupo}
#    Run Keyword If  '${Producto}' == '${EMPTY}'  Page Should Contain  El Campo Producto es requerido
#    Run Keyword If  '${Corredor}' == '${EMPTY}'  Page Should Contain  El Campo Corredor Comprador es requerido
#    Run Keyword If  '${Finalidad}' == '${EMPTY}'  Page Should Contain  El Campo Finalidad es requerido
#    Run Keyword If  '${Vendedor}' == '${EMPTY}'  Page Should Contain  El Campo Vendedor es requerido
#    Run Keyword If  '${Destinatario}' == '${EMPTY}'  Page Should Contain  El Campo Destinatario es requerido
#    Run Keyword If  '${MovitoCupo}' == '${EMPTY}'  Page Should Contain  El Campo Motivo Cupo es requerido
#    Sistema debe informar datos CTG obligatorios
#SistemaDebeInformarCamposObligatoriosConCupoYSinWsAfip
#    Sistema debe informar datos CTG obligatorios
#SistemaDebeInformarTarjetaEnUso
#    Page Should Contain  Tarjeta en uso
#SistemaDebeInformarDatosCTGObligatorios
#    ${CTG}=  Get Value  ${locTxtCTG}
#    ${Transportista}=  Get Value  ${locTxtTransportista}
#    ${Chofer}=  Get Value  ${locTxtChofer}
#    ${KgNeto}=  Get Value  ${locTxtKgNeto}
#    Run Keyword If  '${CTG}' == '${EMPTY}'  Page Should Contain  El Campo CTG es requerido
#    Run Keyword If  '${Transportista}' == '${EMPTY}'  Page Should Contain  El Campo Transportista es requerido
#    Run Keyword If  '${Chofer}' == '${EMPTY}'  Page Should Contain  El Campo Chofer es requerido
#    Run Keyword If  '${KgNeto}' == '${EMPTY}'  Page Should Contain  El Campo Peso Neto es requerido

###############################################################################

##########################  TESTS FLUJOS ######################################

SistemaDebeVolverAlEstadoInicialPantalla
    Element Text Should Be  ${locTxtNumeroDocumentoPorte}  ${EMPTY}
    Element Should Be Focused  ${locTxtNumeroDocumentoPorte}
SistemaDebeGuardarMovimientoPendienteControl
    [Arguments]     ${Tarjeta}
    ${Consulta}=    Catenate  SELECT M.* 
        ...     FROM T_MOVEMENT M
        ...     INNER JOIN T_CARD C ON M.ID_CARD = C.ID_CARD
        ...     WHERE M.ID_MOVEMENT_STATUS = ${gEstadoAptoControlEntrada} AND C.NUMBER = '${Tarjeta}'
    Check If Exists In Database    ${Consulta}
SistemaDebeMarcarCupoUtilizadoComoSinCupo 
    [Arguments]     ${Cupo}
    Check If Exists In Database  SELECT * FROM T_QUOTA_DET_CODE WHERE QUOTA_CODE = '${Cupo}'
SistemaDebeGuardarMovimientoPendienteCupo
    [Arguments]     ${NroDocPorte}
    ${Consulta}=    Catenate  SELECT * 
        ...     FROM T_MOVEMENT 
        ...     WHERE CONVERT(date,ENTRY_DATE) = CONVERT(date,GETDATE()) 
        ...         AND ID_MOVEMENT_STATUS = ${gEstadoPendienteCupo} AND ID_CIRCUIT = ${gIdCircuitoDescargaCamionCerealTimbues} 
        ...         AND CARRIAGE_DOCUMENT_NUMBER = '${NroDocPorte}'
    Check If Exists In Database    ${Consulta}

###############################################################################