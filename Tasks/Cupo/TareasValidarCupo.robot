*** Settings ***
Resource        ../../Actions/Cupo/AccionesValidarCupo.robot
Resource        ../../Global Definitions/Constantes.robot
Resource        ../../Global Definitions/Mensajes.robot
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../Popups generales/TareasAsignarTarjeta.robot 
Resource        ../TareasMenu.robot
Library         DatabaseLibrary

*** Keywords ***
############## FLUJOS #########################
AceptarSinWsAfipMovimientoOK
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}
    SetearCaracteristicas  ${ConWSAfip}    ${ConTarjeta}
    IngresarDatos   ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    TareasValidarCupo.IngresarCodigoCancelacionCTG  ${CodCancCTG}  
    Scrollear Hasta Final Pagina
    DecideAceptar
    Run Keyword If  ${ConTarjeta}==True  TareasAsignarTarjeta.AsignarTarjeta  ${NroTarjeta}
    
AceptarConWsAfipMovimientoOK
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}
    SetearCaracteristicas  ${ConWSAfip}    ${ConTarjeta}
    IngresarDatos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    DecideAceptar
    Run Keyword If  ${ConTarjeta}==True     TareasAsignarTarjeta.AsignarTarjeta  ${NroTarjeta}
    Sleep   2
    ${ServicioAFIPOK}=  Run Keyword And Return Status  Page Should Contain  ${msjServicioAFIPNoDisponible}
    Run Keyword If  ${ServicioAFIPOK}     TareasValidarCupo.IngresarCodigoCancelacionCTG  ${CodCancCTG}
    Run Keyword If  ${ServicioAFIPOK}     DecidirAceptar
    
AceptarSinWsAfipMovimientoConError
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}
    SetearCaracteristicas  ${ConWSAfip}    ${ConTarjeta}
    IngresarDatos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    TareasValidarCupo.IngresarCodigoCancelacionCTG  ${CodCancCTG}  
    Scrollear Hasta Final Pagina
    DecideAceptar
    Run Keyword If  ${ConTarjeta}==True  TareasAsignarTarjeta.AsignarTarjeta  ${NroTarjeta}
    
AceptarConWsAfipMovimientoConError
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}
    Setear Caracteristicas  ${ConWSAfip}    ${ConTarjeta}
    IngresarDatos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    DecideAceptar
    Run Keyword If  ${ConTarjeta}==True     TareasAsignarTarjeta.AsignarTarjeta  ${NroTarjeta}
        
DejarPendienteMovimientoOK
    [Arguments]     ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${MotivoPend}   ${ObsPend}
    IngresarDatos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    DecidirDejarPendienteCupo
    AceptarDejarPendienteCupo  ${MotivoPend}   ${ObsPend}
    
DejarPendienteMovimientoConError
    [Arguments]     ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    IngresarDatos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    DecidirDejarPendienteCupo

############## CARACTERÍSTICAS #################
SetearCaracteristicas
    [Arguments]     ${ConWSAfip}    ${ConTarjeta}
    Run Keyword If  ${ConWSAfip}==False  DeshabilitarAccionWSAfip     ${gWorkstationGeneralTimbues}
    Run Keyword If  ${ConWSAfip}==True  HabilitarAccionWSAfip     ${gWorkstationGeneralTimbues}
    Run Keyword If  ${ConTarjeta}==False  DeshabilitarAccionUsoTarjeta  ${gWorkstationGeneralTimbues}
    Run Keyword If  ${ConTarjeta}==True  HabilitarAccionUsoTarjeta  ${gWorkstationGeneralTimbues}
    Refrescar pagina

DeshabilitarAccionWSAfip
    [Arguments]     ${IdPuestoTrabajo}
    ${UpdateOutput}=    Execute Sql String    UPDATE T_WORKSTATION_ACTION_MODE SET IS_AUTOMATIC = 0 WHERE ID_WORKSTATION = ${IdPuestoTrabajo} AND ID_ACTION = 7;
    Should Be Equal As Strings    ${UpdateOutput}    None

HabilitarAccionWSAfip
    [Arguments]     ${IdPuestoTrabajo}
    ${UpdateOutput}=    Execute Sql String    UPDATE T_WORKSTATION_ACTION_MODE SET IS_AUTOMATIC = 1 WHERE ID_WORKSTATION = ${IdPuestoTrabajo} AND ID_ACTION = 7;
    Should Be Equal As Strings    ${UpdateOutput}    None

DeshabilitarAccionUsoTarjeta
    [Arguments]     ${IdPuestoTrabajo}
    ${UpdateOutput}=    Execute Sql String    UPDATE T_WORKSTATION_ACTION_MODE SET IS_ENABLED = 0 WHERE ID_WORKSTATION = ${IdPuestoTrabajo} and ID_ACTION = 6;
    Should Be Equal As Strings    ${UpdateOutput}    None

HabilitarAccionUsoTarjeta
    [Arguments]     ${IdPuestoTrabajo}
    ${UpdateOutput}=    Execute Sql String    UPDATE T_WORKSTATION_ACTION_MODE SET IS_ENABLED = 1 WHERE ID_WORKSTATION = ${IdPuestoTrabajo} and ID_ACTION = 6;
    Should Be Equal As Strings    ${UpdateOutput}    None
########################################################

################# INGRESAR DATOS #######################
IngresarDatos 
    [Arguments]     ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    IngresarCartaPorte  ${NroDocPorte}
    Run Keyword If  ${ConCupo}==False  IngresarDatosMovimientoSinCupo     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen} 
    Run Keyword If  ${ConCupo}==True  IngresarDatosMovimientoConCupo     ${NroCupo}
    IngresarDatosCTG  ${CTG}   ${CuilTransportista}   ${CuilChofer}  ${KgNeto}

IngresarCartaPorte
    [Arguments]     ${NroDocPorte}
    Run Keyword If  '${NroDocPorte}' is not '${Empty}'  AccionesValidarCupo.IngresarNumeroDocumentoPorte  ${NroDocPorte}

IngresarDatosMovimientoSinCupo
    [Arguments]     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen}
    SeleccionaIngresoSinCupo
    IngresarDatosDocumento     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen}

SeleccionaIngresoSinCupo
    AccionesValidarCupo.SeleccionarOpcionSinCupo    

IngresarProducto
    [Arguments]     ${IdProducto}
    AccionesValidarCupo.IngresarProducto  ${IdProducto}

IngresarDatosDocumento
    [Arguments]     ${CodProducto}    ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}   ${IdMotivo}   ${IdSede}
    Run Keyword If  '${CodProducto}' is not '${Empty}' and '${CodProducto}' is not 'None'  AccionesValidarCupo.IngresarProducto   ${CodProducto}
    Run Keyword If  '${CuilVendedor}' is not '${Empty}' and '${CuilVendedor}' is not 'None'  AccionesValidarCupo.IngresarVendedor   ${CuilVendedor}
    Run Keyword If  '${CuilCorredor}' is not '${Empty}' and '${CuilCorredor}' is not 'None'  AccionesValidarCupo.IngresarCorredor   ${CuilCorredor}
    Run Keyword If  '${CuilDestinatario}' is not '${Empty}' and '${CuilDestinatario}' is not 'None'  AccionesValidarCupo.IngresarDestinatario   ${CuilDestinatario}
    Run Keyword If  '${IdFinalidad}' is not '${Empty}' and '${CuilDestinatario}' is not 'None'  AccionesValidarCupo.SeleccionarFinalidad   ${IdFinalidad}
    Run Keyword If  '${IdFinalidad}' is not '${Empty}' and '${IdFinalidad}' is not 'None' and '${IdMotivo}' is not '${Empty}' and '${IdMotivo}' is not 'None'  AccionesValidarCupo.SeleccionarMotivoCupo     ${IdMotivo}
    Run Keyword If  '${CuilVendedor}' is not '${Empty}' and '${CuilVendedor}' is not 'None' and '${IdSede}' is not '${Empty}' and '${IdSede}' is not 'None' and '${CuilVendedor}' == '${gCuilLDC}'  AccionesValidarCupo.IngresarSede  ${IdSede}

IngresarDatosMovimientoConCupo
    [Arguments]     ${NroCupo}
    SeleccionarIngresoConCupo
    IngresarCupo  ${NroCupo}

SeleccionarIngresoConCupo
    AccionesValidarCupo.SeleccionarOpcionConCupo

IngresarCupo
    [Arguments]     ${NroCupo}
    AccionesValidarCupo.IngresarCodigoCupo  ${NroCupo}
#############################################################

################ DATOS CTG ##################################
IngresarDatosCTG
    [Arguments]     ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNetos}
    Run Keyword If  '${CTG}' is not '${Empty}' and '${CTG}' is not 'None'  AccionesValidarCupo.IngresarCTG  ${CTG}
    Run Keyword If  '${CuilTransportista}' is not '${Empty}' and '${CuilTransportista}' is not 'None'  AccionesValidarCupo.IngresarTransportista  ${CuilTransportista}
    Run Keyword If  '${CuilChofer}' is not '${Empty}' and '${CuilChofer}' is not 'None'  AccionesValidarCupo.IngresarChofer  ${CuilChofer}
    Run Keyword If  '${KgNetos}' is not '${Empty}' and '${KgNetos}' is not 'None'  AccionesValidarCupo.IngresarKGNetos  ${KgNetos}

IngresarCodigoCancelacionCTG
    [Arguments]     ${CodCancCTG}
    AccionesValidarCupo.IngresarCodigoCancelacionCTG  ${CodCancCTG}

###############################################################

################ ACCIONES ###########################

DecideAceptar
    AccionesValidarCupo.PresionarAceptar

DecidirDejarPendienteCupo
    AccionesValidarCupo.PresionarDejarPendiente

IrBusquedaAvanzadaProducto
    AccionesValidarCupo.PresionarBusquedaAvanzadaProducto

RealizarBusquedaRapidaSede
    [Arguments]     ${Valor}
    AccionesValidarCupo.IngresarSede  ${Valor}

#####################################################################