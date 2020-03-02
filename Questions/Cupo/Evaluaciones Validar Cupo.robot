*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/Controles Validar Cupo.robot
Resource        ../../Global Definitions/Mensajes.robot
Resource        ../../Global Definitions/Constantes.robot
Library         Collections

**Keywords

#################### TESTS PRUEBAS PUNTUALES ########################

Tipo de producto debe ser ${aTipoProducto}
    Element Should Contain  ${locDdlTipoProducto}   ${aTipoProducto}   
Tipo documento porte debe ser ${aTipoDocumento} y estar deshabilitado
    Element Should Contain  ${locDdlTipoDocumentoPorte}  ${aTipoDocumento}
    Element Should Be Disabled  ${locDdlTipoDocumentoPorte}
Nro documento porte debe tener el foco
    Element Should Be Focused  ${locTxtNumeroDocumentoPorte}
Nro cupo debe estar habilitado para el ingreso y datos documento inhabilitados
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
Datos documento deben estar habilitados para el ingreso y Nro cupo inhabilitado 
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
Datos EPA deben estar habilitados para el ingreso
    Element Should Be Enabled  ${locTxtTitular}
    Element Should Be Enabled  ${locBtnBuscarTitular}
    Element Should Be Enabled  ${locDdlCampoEPA}
Datos EPA deben estar deshabilitados para el ingreso
    Element Should Be Disabled  ${locTxtTitular}
    Element Should Be Disabled  ${locBtnBuscarTitular}
    Element Should Be Disabled  ${locDdlCampoEPA}
Sistema debe recuperar datos del cupo ingresado
    [Arguments]     ${aCupo}
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
        ...     WHERE QUOTA_CODE = '${aCupo}'
    ${ResultadoQuery}   Query   ${Query}
    Should Be Equal As Integers  ${Producto}    ${ResultadoQuery[0][0]}
    Run Keyword If  ${ResultadoQuery[0][1]} is not None  Should Be Equal  ${Vendedor}    ${ResultadoQuery[0][1]}
    Run Keyword If  ${ResultadoQuery[0][2]} is not None  Should Be Equal  ${Corredor}    ${ResultadoQuery[0][2]}
    Should Be Equal  ${Destinatario}    ${ResultadoQuery[0][3]}
    Should Be Equal As Integers  ${Finalidad}   ${ResultadoQuery[0][4]}
    Should Be Equal As Integers  ${MovitoCupo}      ${ResultadoQuery[0][5]}
Sistema debe informar cupo anterior o posterior
    Page Should Contain  ${MsjCupoAnteriorOPosterior} 
Sistema debe marcar el ingreso sin cupo
    Checkbox Should Be Selected  ${locChkSinCupo}
Sistema debe informar que el cupo ya fue utilizado
    Page Should Contain  ${MsjCupoUtilizado}
    Element Should Be Disabled  ${locBtnAceptar}
Sistema debe visualizar descripcion del producto seleccionado
    [Arguments]     ${CodigoProducto}
    ${ResultadoQuery}=  Query  SELECT NAME_PRODUCT FROM T_PRODUCT WHERE ID_PRODUCT = ${CodigoProducto} 
    Element Text Should Be  ${loclblDescripcionProducto}  ${ResultadoQuery[0][0]}
Sistema debe visualizar todas las finalidades activas
    [Arguments]     ${aIdCircuito}
    ${lista}     Get List Items  ${locDdlFinalidad}
    ${Consulta}=    Catenate  SELECT NAME_PURPOSE FROM T_PURPOSE P
        ...     INNER JOIN T_CIRCUIT_PURPOSE CP ON P.ID_PURPOSE = CP.ID_PURPOSE
        ...     WHERE P.ACTIVE = 1 AND CP.ID_CIRCUIT = ${aIdCircuito}
    ${ResultadoConsulta}=   Query  ${Consulta}
    ${cantFilas}=   Get Length  ${ResultadoConsulta}
    FOR     ${i}    IN RANGE    1   ${cantFilas}
        Should Be Equal  ${ResultadoConsulta[${i}-1][0]}  ${lista[${i}]}
    END
#Sistema debe informar el ingreso exitoso
#    Page Should Contain  Se aceptó el ingreso de la descarga
#Sistema debe informar la accion dejar pendiente exitosa
#    Page Should Contain  La descarga quedó en estado Pendiente
#Sistema debe informar campos obligatorios sin cupo y sin WS AFIP
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
#Sistema debe informar campos obligatorios con cupo y sin WS AFIP
#    Sistema debe informar datos CTG obligatorios
#Sistema debe informar tarjeta en uso
#    Page Should Contain  Tarjeta en uso
#Sistema debe informar datos CTG obligatorios
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

Sistema debe volver al estado inicial de la pantalla
    Element Text Should Be  ${locTxtNumeroDocumentoPorte}  ${EMPTY}
    Element Should Be Focused  ${locTxtNumeroDocumentoPorte}
Sistema debe guardar el movimiento Pendiente Control
    [Arguments]     ${Tarjeta}
    ${Consulta}=    Catenate  SELECT M.* 
        ...     FROM T_MOVEMENT M
        ...     INNER JOIN T_CARD C ON M.ID_CARD = C.ID_CARD
        ...     WHERE M.ID_MOVEMENT_STATUS = ${gEstadoAptoControlEntrada} AND C.NUMBER = '${Tarjeta}'
    Check If Exists In Database    ${Consulta}
Sistema debe marcar el cupo utilizado como Sin Cupo 
    [Arguments]     ${Cupo}
    Check If Exists In Database  SELECT * FROM T_QUOTA_DET_CODE WHERE QUOTA_CODE = '${Cupo}'
Sistema debe guardar el movimiento Pendiente Cupo
    [Arguments]     ${NroDocPorte}
    ${Consulta}=    Catenate  SELECT * 
        ...     FROM T_MOVEMENT 
        ...     WHERE CONVERT(date,ENTRY_DATE) = CONVERT(date,GETDATE()) 
        ...         AND ID_MOVEMENT_STATUS = ${gEstadoPendienteCupo} AND ID_CIRCUIT = ${gIdCircuitoDescargaCamionCerealTimbues} 
        ...         AND CARRIAGE_DOCUMENT_NUMBER = '${NroDocPorte}'
    Check If Exists In Database    ${Consulta}

###############################################################################