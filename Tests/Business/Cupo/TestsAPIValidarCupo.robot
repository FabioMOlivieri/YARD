*** Settings ***
Test Template   Flujo
Resource        ../../../Tasks/TareasLogin.robot
Resource        ../../../Global Definitions/Variables.robot
Resource        ../../../Questions/Cupo/EvaluacionesValidarCupo.robot
Resource        ../../../Libraries Proxy/Selenium Proxy.robot
Suite Setup     IniciarSuite
Suite Teardown  CerrarSuite
Library         DataDriver    ${FilePathExcel}    sheet_name=${HojaExcel}
Library         DatabaseLibrary
Library         RequestsLibrary
Library         Collections
Library         OperatingSystem
Library         JSONLibrary

**Variables
${FilePathExcel}    ../../../External Resources/Business/Cupo/CasosPruebaValidarCupo.xlsx
${HojaExcel}      Datos
${FilePathJsonPost}     ../../../External Resources/Business/Cupo/ValidarCupoPost.json

***Test Cases***     
CasosPrueba   ${TipoFlujo}  ${Accion}   ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}

**Keywords
######################### HACER REFACTOR PARA CONTEMPLAR TODOS LOS FLUJOS Y CASOS DE PRUEBAS ######################
Flujo
    [Arguments]     ${TipoFlujo}  ${Accion}   ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}
    ${Body}=   CargarJson   ${TipoFlujo}  ${Accion}   ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}
    Log To Console  ${Body}
    ${Headers}=    Create Dictionary    Authorization=${gAutToken}    Content-Type=application/json
    Create Session    mySession    ${gAppUrlUat}
    ${Response}=    Post Request    mySession    /validar-precarga-cupo/Cereales    data=${Body}    headers=${Headers}
    ${StatusCode}=    Convert To String    ${Response.status_code}
    Should Be Equal    ${StatusCode}    422
    ${bodyResponse}=    To Json    ${response.content}
    ${Msj}=    Get Value From Json    ${bodyResponse}    $.message
    Should Be Equal  ${Msj[0]}  Tarjeta en uso
    #Should Be Equal  ${StatusCode}  201

IniciarSuite
    TareasLogin.LoguearUsuarioSinIniciarAplicacion  ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    
CerrarSuite
    Disconnect From Database

CargarJson
    [Arguments]     ${TipoFlujo}  ${Accion}   ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}
    ############ Popular el json (NECESITO OTRO EXCEL CON LOS IDS y COMPLETAR EL RESTO DE LOS CAMPOS)
    ${Body}=   Load JSON From File    ${FilePathJsonPost}
    Run Keyword If  '${IdCircuito}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdCircuito  ${IdCircuito}
    Run Keyword If  '${IdTipoDocumentoPorte}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdTipoDocumentoPorte  ${IdTipoDocumentoPorte}
    Run Keyword If  '${NumeroDocumentoPorte}' is not '${Empty}'   Update Value To Json  ${Body}  $.NumeroDocumentoPorte  ${NumeroDocumentoPorte}
    Run Keyword If  '${IdTipoProducto}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdTipoProducto  ${IdTipoProducto}
    Run Keyword If  '${CodigoCupo}' is not '${Empty}'   Update Value To Json  ${Body}  $.CodigoCupo  ${CodigoCupo}
    Run Keyword If  '${IdProducto}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdProducto  ${IdProducto}
    Run Keyword If  '${IdVendedor}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdVendedor  ${IdVendedor}
    Run Keyword If  '${IdCorredorComprador}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdCorredorComprador  ${IdCorredorComprador}
    Run Keyword If  '${IdDestinatario}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdDestinatario  ${IdDestinatario}
    Run Keyword If  '${IdSedeOrigen}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdSedeOrigen  ${IdSedeOrigen}
    Run Keyword If  '${IdFinalidad}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdFinalidad  ${IdFinalidad}
    Run Keyword If  '${IdMotivoCupo}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdMotivoCupo  ${IdMotivoCupo}
    Run Keyword If  '${IdActividad}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdActividad  ${IdActividad}
    Run Keyword If  '${EsModificacion}' is not '${Empty}'   Update Value To Json  ${Body}  $.EsModificacion  ${EsModificacion}
    Run Keyword If  '${EsDejarPendiente}' is not '${Empty}'   Update Value To Json  ${Body}  $.EsDejarPendiente  ${EsDejarPendiente}
    Run Keyword If  '${ObservacionDelMotivo}' is not '${Empty}'   Update Value To Json  ${Body}  $.ObservacionDelMotivo  ${ObservacionDelMotivo}
    Run Keyword If  '${IdMotivoEstadoMovimiento}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdMotivoEstadoMovimiento  ${IdMotivoEstadoMovimiento}
    Run Keyword If  '${IdEstadoInicialCupo}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdEstadoInicialCupo  ${IdEstadoInicialCupo}
    Run Keyword If  '${NumeroTarjeta}' is not '${Empty}'   Update Value To Json  ${Body}  $.NumeroTarjeta  ${NumeroTarjeta}
    Run Keyword If  '${KilosNeto}' is not '${Empty}'   Update Value To Json  ${Body}  $.KilosNeto  ${KilosNeto}
    Run Keyword If  '${AceptarSinConfirmarCtg}' is not '${Empty}'   Update Value To Json  ${Body}  $.AceptarSinConfirmarCtg  ${IdCircuito}
    Run Keyword If  '${CodigoCancelacionCtg}' is not '${Empty}'   Update Value To Json  ${Body}  $.CodigoCancelacionCtg  ${AceptarSinConfirmarCtg}
    Run Keyword If  '${CodigoTrazabilidadGrano}' is not '${Empty}'   Update Value To Json  ${Body}  $.CodigoTrazabilidadGrano  ${CodigoTrazabilidadGrano}
    Run Keyword If  '${IdTransportista}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdTransportista  ${IdTransportista}
    Run Keyword If  '${CodigoFiscalTransportista}' is not '${Empty}'   Update Value To Json  ${Body}  $.CodigoFiscalTransportista  ${CodigoFiscalTransportista}
    Run Keyword If  '${IdChofer}' is not '${Empty}'   Update Value To Json  ${Body}  $.IdChofer  ${IdChofer}
    [Return]    ${Body}