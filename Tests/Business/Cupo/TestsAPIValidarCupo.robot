*** Settings ***
Test Template   Flujo
Resource        ../../../Tasks/TareasLogin.robot
Resource        ../../../Global Definitions/Variables.robot
Resource        ../../../Global Definitions/Constantes.robot
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
    [Arguments]     ${TipoFlujo}  ${Accion}   ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}   ${Msj}
    Run Keyword If  '${Accion}'=='ACEPTA'   FlujoAceptar    ${TipoFlujo}  ${Accion}   ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}   ${Msj}    
    Run Keyword If  '${Accion}'=='PENDIENTE'    FlujoPendiente  ${TipoFlujo}  ${Accion}   ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}   ${Msj}     
    
IniciarSuite
    TareasLogin.LoguearUsuarioSinIniciarAplicacion  ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    
CerrarSuite
    Disconnect From Database

FlujoAceptar
    [Arguments]     ${TipoFlujo}  ${Accion}   ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}   ${Msj}
    ${Response}=    InvocarLogica   /validar-precarga-cupo/Cereales     ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}
    Run Keyword If  '${TipoFlujo}'=='ERROR'   EvaluarResultadoError   ${Response}     ${Msj}
    Run Keyword If  '${TipoFlujo}'=='OK'    EvaluarResultadoAceptarOK  ${Response}     ${CodigoCupo}   ${NumeroTarjeta}

FlujoPendiente
    [Arguments]     ${TipoFlujo}  ${Accion}   ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}   ${Msj}
    ${Response}=    InvocarLogica   /validar-precarga-cupo/dejar-pendiente-cereales     ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}
    Run Keyword If  '${TipoFlujo}'=='ERROR'   EvaluarResultadoError   ${Response}     ${Msj}
    Run Keyword If  '${TipoFlujo}'=='OK'    EvaluarResultadoPendienteOK  ${Response}    ${NumeroDocumentoPorte}

InvocarLogica
    [Arguments]     ${Logica}   ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}
    ${Body}=   CargarJson   ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}
    ${Headers}=    Create Dictionary    Authorization=${gAutToken}    Content-Type=application/json
    Create Session    mySession    ${gAppUrlUat}
    ${Response}=    Post Request    mySession    ${Logica}    data=${Body}    headers=${Headers}
    [Return]    ${Response}

CargarJson
    [Arguments]     ${IdCircuito}   ${IdTipoDocumentoPorte}     ${NumeroDocumentoPorte}     ${IdTipoProducto}   ${CodigoCupo}   ${IdProducto}   ${IdVendedor}   ${IdCorredorComprador}  ${IdDestinatario}   ${IdSedeOrigen}     ${IdFinalidad}  ${IdMotivoCupo}     ${IdActividad}  ${ObservacionDelMotivo}     ${IdMotivoEstadoMovimiento}     ${EsModificacion}   ${EsDejarPendiente}     ${IdEstadoInicialCupo}  ${NumeroTarjeta}    ${KilosNeto}    ${AceptarSinConfirmarCtg}   ${CodigoCancelacionCtg}     ${CodigoTrazabilidadGrano}  ${IdTransportista}  ${CodigoFiscalTransportista}    ${IdChofer}
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

EvaluarResultadoAceptarOK
    [Arguments]     ${Response}     ${CodigoCupo}   ${NumeroTarjeta} 
    ${StatusCode}=    Convert To String    ${Response.status_code}
    Should Be Equal    ${StatusCode}    ${gServicioOK}
    EvaluacionesValidarCupo.SistemaDebeGuardarMovimientoPendienteControl  ${NumeroTarjeta}
    Run Keyword If  '${CodigoCupo}' is not '${Empty}'  EvaluacionesValidarCupo.SistemaDebeMarcarCupoUtilizadoComoSinCupo   ${CodigoCupo}

EvaluarResultadoPendienteOK
    [Arguments]     ${Response}     ${NroDocPorte}
    ${StatusCode}=    Convert To String    ${Response.status_code}
    Should Be Equal    ${StatusCode}    ${gServicioOK}
    EvaluacionesValidarCupo.SistemaDebeGuardarMovimientoPendienteCupo  ${NroDocPorte}

EvaluarResultadoError
    [Arguments]     ${Response}     ${Msj}
    ${StatusCode}=    Convert To String    ${Response.status_code}
    Should Be Equal    ${StatusCode}    ${gServicioErrorLogica}
    ${BodyResponse}=    To Json    ${Response.content}
    ${Message}=    Get Value From Json    ${BodyResponse}    $.message
    Should Contain  ${Message[0]}  ${Msj}