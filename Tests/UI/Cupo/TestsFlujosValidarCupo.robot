*** Settings ***
Test Template   Flujo
Resource        ../../../Tasks/Cupo/TareasValidarCupo.robot
Resource        ../../../Tasks/Popups generales/TareasAsignarTarjeta.robot
Resource        ../../../Tasks/Cupo/TareasDejarCupoPendiente.robot
Resource        ../../../Tasks/TareasLogin.robot
Resource        ../../../Tasks/TareasMenu.robot
Resource        ../../../Global Definitions/Variables.robot
Resource        ../../../Global Definitions/Constantes.robot
Resource        ../../../Global Definitions/Mensajes.robot
Resource        ../../../Questions/Cupo/EvaluacionesValidarCupo.robot
Resource        ../../../Libraries Proxy/Selenium Proxy.robot
Suite Setup     IniciarSuite
Suite Teardown  CerrarSuite
Library         DataDriver    ${FilePathExcel}    sheet_name=${HojaExcel}
Library         DatabaseLibrary

**Variables
${FilePathExcel}    ../../../External Resources/UI/Cupo/CasosPruebaValidarCupo.xlsx
${HojaExcel}      Datos

***Test Cases***     
CasosPrueba   ${TipoFlujo}  ${Accion}   ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${ConWSAfip}    ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}     ${ConTarjeta}     ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend} 

**Keywords
Flujo
    [Arguments]     ${TipoFlujo}    ${Accion}   ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${ConWSAfip}    ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Run Keyword If  '${Accion}'=='ACEPTA' and '${TipoFlujo}'=='OK' and ${ConWSAfip}==False  FlujoAceptarOKSinWsAfip  ${ConWSAfip}   ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Run Keyword If  '${Accion}'=='ACEPTA' and '${TipoFlujo}'=='OK' and ${ConWSAfip}==True   FlujoAceptarOKConWsAfip  ${ConWSAfip}   ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Run Keyword If  '${Accion}'=='ACEPTA' and '${TipoFlujo}'=='ERROR' and ${ConWSAfip}==False   FlujoAceptarErrorSinWsAfip  ${ConWSAfip}     ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Run Keyword If  '${Accion}'=='ACEPTA' and '${TipoFlujo}'=='ERROR' and ${ConWSAfip}==True    FlujoAceptarErrorConWsAfip  ${ConWSAfip}  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Run Keyword If  '${Accion}'=='PENDIENTE' and '${TipoFlujo}'=='OK'   FlujoPendienteOK  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Run Keyword If  '${Accion}'=='PENDIENTE' and '${TipoFlujo}'=='ERROR'    FlujoPendienteError  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}

IniciarSuite
    IniciarAplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    IrAValidarCupo

CerrarSuite
    Cerrar Pantalla
    Disconnect From Database

FlujoAceptarOKSinWsAfip
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    TareasValidarCupo.SetearCaracteristicas  ${ConWSAfip}    ${ConTarjeta}
    IngresarDatos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    TareasValidarCupo.IngresarCodigoCancelacionCTG  ${CodCancCTG}  
    Scrollear Hasta Final Pagina
    TareasValidarCupo.DecideAceptar
    Run Keyword If  ${ConTarjeta}==True  TareasAsignarTarjeta.AsignarTarjeta  ${NroTarjeta}
    VerificarMovimientoOK     ${Msj}  ${ConCupo}  ${NroCupo}  ${NroTarjeta}

FlujoAceptarOKConWsAfip
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    TareasValidarCupo.SetearCaracteristicas  ${ConWSAfip}    ${ConTarjeta}
    IngresarDatos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    TareasValidarCupo.DecideAceptar
    Run Keyword If  ${ConTarjeta}==True     TareasAsignarTarjeta.AsignarTarjeta  ${NroTarjeta}
    Sleep   2
    ${ServicioAFIPOK}=  Run Keyword And Return Status  Page Should Contain  ${msjServicioAFIPNoDisponible}
    Run Keyword If  ${ServicioAFIPOK}     TareasValidarCupo.IngresarCodigoCancelacionCTG  ${CodCancCTG}
    Run Keyword If  ${ServicioAFIPOK}     TareasValidarCupo.DecidirAceptar
    VerificarMovimientoOK     ${Msj}  ${ConCupo}  ${NroCupo}  ${NroTarjeta}
    
FlujoAceptarErrorSinWsAfip
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    TareasValidarCupo.SetearCaracteristicas  ${ConWSAfip}    ${ConTarjeta}
    IngresarDatos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    TareasValidarCupo.IngresarCodigoCancelacionCTG  ${CodCancCTG}  
    Scrollear Hasta Final Pagina
    TareasValidarCupo.DecideAceptar
    Run Keyword If  ${ConTarjeta}==True  TareasAsignarTarjeta.AsignarTarjeta  ${NroTarjeta}
    VerificarMovimientoConError    ${Msj}

FlujoAceptarErrorConWsAfip
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    TareasValidarCupo.Setear Caracteristicas  ${ConWSAfip}    ${ConTarjeta}
    IngresarDatos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    TareasValidarCupo.DecideAceptar
    Run Keyword If  ${ConTarjeta}==True     TareasAsignarTarjeta.AsignarTarjeta  ${NroTarjeta}
    Sleep   2
    VerificarMovimientoConError    ${Msj}

FlujoPendienteOK
    [Arguments]     ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    IngresarDatos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    TareasValidarCupo.DecidirDejarPendienteCupo
    TareasDejarCupoPendiente.AceptarDejarPendienteCupo  ${MotivoPend}   ${ObsPend}
    VerificarMovimientoPendienteOK     ${Msj}  ${NroDocPorte}

FlujoPendienteError
    [Arguments]     ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    IngresarDatos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    TareasValidarCupo.DecidirDejarPendienteCupo
    VerificarMovimientoPendienteConError    ${Msj}

IngresarDatos 
    [Arguments]     ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    TareasValidarCupo.Ingresar Carta Porte  ${NroDocPorte}
    Run Keyword If  ${ConCupo}==False  TareasValidarCupo.IngresarDatosMovimientoSinCupo     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen} 
    Run Keyword If  ${ConCupo}==True  TareasValidarCupo.IngresarDatosMovimientoConCupo     ${NroCupo}
    TareasValidarCupo.IngresarDatosCTG  ${CTG}   ${CuilTransportista}   ${CuilChofer}  ${KgNeto}

VerificarMovimientoOK
    [Arguments]     ${Msj}  ${ConCupo}  ${NroCupo}  ${NroTarjeta}    
    Page Should Contain     ${Msj}
    EvaluacionesValidarCupo.SistemaDebeGuardarMovimientoPendienteControl  ${NroTarjeta}
    Run Keyword If  ${ConCupo}==True  EvaluacionesValidarCupo.SistemaDebeMarcarCupoUtilizadoComoSinCupo   ${NroCupo}
    EvaluacionesValidarCupo.SistemaDebeVolverAlEstadoInicialPantalla

VerificarMovimientoConError
    [Arguments]     ${Msj}
    Page Should Contain     ${Msj}
    Run Keyword And Ignore Error  TareasAsignarTarjeta.CancelarAsignaciónTarjeta
    
VerificarMovimientoPendienteConError
    [Arguments]     ${Msj}
    Page Should Contain     ${Msj}

VerificarMovimientoPendienteOK
    [Arguments]     ${Msj}  ${NroDocPorte}  
    Page Should Contain     ${Msj}
    EvaluacionesValidarCupo.SistemaDebeGuardarMovimientoPendienteCupo  ${NroDocPorte}
    EvaluacionesValidarCupo.SistemaDebeVolverAlEstadoInicialPantalla