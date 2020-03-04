*** Settings ***
Resource        ../../Actions/Cupo/AccionesValidarCupo.robot
Resource        ../../Global Definitions/Constantes.robot
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../Popups generales/TareasAsignarTarjeta.robot 
Resource        ../TareasMenu.robot
Library         DatabaseLibrary

*** Keywords ***

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
    Run Keyword If  '${CodProducto}' is not '${Empty}'  AccionesValidarCupo.IngresarProducto   ${CodProducto}
    Run Keyword If  '${CuilVendedor}' is not '${Empty}'  AccionesValidarCupo.IngresarVendedor   ${CuilVendedor}
    Run Keyword If  '${CuilCorredor}' is not '${Empty}'  AccionesValidarCupo.IngresarCorredor   ${CuilCorredor}
    Run Keyword If  '${CuilDestinatario}' is not '${Empty}'  AccionesValidarCupo.IngresarDestinatario   ${CuilDestinatario}
    Run Keyword If  '${IdFinalidad}' is not '${Empty}'  AccionesValidarCupo.SeleccionarFinalidad   ${IdFinalidad}
    Run Keyword If  '${IdFinalidad}' is not '${Empty}' and '${IdMotivo}' is not '${Empty}'  AccionesValidarCupo.SeleccionarMotivoCupo     ${IdMotivo}
    Run Keyword If  '${CuilVendedor}' is not '${Empty}' and '${IdSede}' is not '${Empty}' and '${CuilVendedor}' == '${gCuilLDC}'  AccionesValidarCupo.IngresarSede  ${IdSede}
#############################################################

################# CUPO ######################################
IngresarDatosMovimientoConCupo
    [Arguments]     ${NroCupo}
    SeleccionarIngresoConCupo
    IngresarCupo  ${NroCupo}

SeleccionarIngresoConCupo
    AccionesValidarCupo.Seleccionar Opcion Con Cupo

IngresarCupo
    [Arguments]     ${NroCupo}
    AccionesValidarCupo.IngresarCodigoCupo  ${NroCupo}
#############################################################

################ DATOS CTG ##################################
IngresarDatosCTG
    [Arguments]     ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNetos}
    Run Keyword If  '${CTG}' is not '${Empty}'  AccionesValidarCupo.IngresarCTG  ${CTG}
    Run Keyword If  '${CuilTransportista}' is not '${Empty}'  AccionesValidarCupo.IngresarTransportista  ${CuilTransportista}
    Run Keyword If  '${CuilChofer}' is not '${Empty}'  AccionesValidarCupo.IngresarChofer  ${CuilChofer}
    Run Keyword If  '${KgNetos}' is not '${Empty}'  AccionesValidarCupo.IngresarKGNetos  ${KgNetos}

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