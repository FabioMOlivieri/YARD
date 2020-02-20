*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/Validar Cupo.robot

**Variables
${QueryValidarCupo}     SELECT P.ALIAS, SS.FISCAL_CODE, SB.FISCAL_CODE, SC.FISCAL_CODE, QC.ID_PURPOSE, QC.ID_QUOTA_REASON 
...     FROM T_QUOTA_DET_CODE QC INNER JOIN T_PRODUCT P ON P.ID_PRODUCT = QC.ID_PRODUCT 
...     INNER JOIN T_SOCIETY SS ON SS.ID_SOCIETY = QC.ID_SELLER 
...     INNER JOIN T_SOCIETY SB ON SB.ID_SOCIETY = QC.ID_BROKER 
...     INNER JOIN T_SOCIETY SC ON SC.ID_SOCIETY = QC.ID_CONSIGNEE 
...     WHERE QUOTA_CODE =
${QueryValidarMovimientoGuardado}   SELECT M.* 
...     FROM T_MOVEMENT M
...     INNER JOIN T_CARD C ON M.ID_CARD = C.ID_CARD
...     WHERE M.ID_MOVEMENT_STATUS = 10 AND C.NUMBER =


**Keywords
Tipo de producto debe ser ${aTipoProducto}
    Element Should Contain  ${locDdlTipoProducto}   ${aTipoProducto}   

Tipo documento porte debe ser ${aTipoDocumento} y estar deshabilitado
    Element Should Contain  ${locDdlTipoDocumentoPorte}  ${aTipoDocumento}
    Element Should Be Disabled  ${locDdlTipoDocumentoPorte}

Nro documento porte debe tener el foco
    Element Should Be Focused  ${locTxtNumeroDocumentoPorte}

El sistema debe habilitar el ingreso del cupo
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

El sistema debe habilitar el ingreso sin cupo
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

El sistema debe habilitar el ingreso de datos EPA
    Element Should Be Enabled  ${locTxtTitular}
    Element Should Be Enabled  ${locBtnBuscarTitular}
    Element Should Be Enabled  ${locDdlCampoEPA}

El sistema debe deshabilitar el ingreso de datos EPA
    Element Should Be Disabled  ${locTxtTitular}
    Element Should Be Disabled  ${locBtnBuscarTitular}
    Element Should Be Disabled  ${locDdlCampoEPA}

El sistema debe recuperar datos del cupo ingresado
    [Arguments]     ${aCupo}
    ${Producto}=   Get Value  ${locTxtProducto}
    ${Vendedor}=    Get Value  ${locTxtVendedor}
    ${Corredor}=    Get Value  ${locTxtCorredor}
    ${Destinatario}=    Get Value  ${locTxtDestinatario}
    ${Finalidad}=   Get Value  ${locDdlFinalidad}
    ${MovitoCupo}=  Get Value  ${locDdlMotivoCupo}
    ${Query}    Set Variable  ${QueryValidarCupo} '${aCupo}'  
    ${ResultadoQuery}   Query   ${Query}
    Should Be Equal As Integers  ${Producto}    ${ResultadoQuery[0][0]}
    Should Be Equal  ${Vendedor}    ${ResultadoQuery[0][1]}
    Should Be Equal  ${Corredor}    ${ResultadoQuery[0][2]}
    Should Be Equal  ${Destinatario}    ${ResultadoQuery[0][3]}
    Should Be Equal As Integers  ${Finalidad}   ${ResultadoQuery[0][4]}
    Should Be Equal As Integers  ${MovitoCupo}      ${ResultadoQuery[0][5]}

El sistema debe informar el ingreso exitoso
    Page Should Contain  Se aceptó el ingreso de la descarga

El sistema debe volver al estado inical
    Element Text Should Be  ${locTxtNumeroDocumentoPorte}  ${EMPTY}
    Element Should Be Focused  ${locTxtNumeroDocumentoPorte}

El sistema debe guardar el movimiento
    [Arguments]     ${Tarjeta}
    ${Consulta}     Set Variable  ${QueryValidarMovimientoGuardado} '${Tarjeta}'
    Check If Exists In Database    ${Consulta}
    
