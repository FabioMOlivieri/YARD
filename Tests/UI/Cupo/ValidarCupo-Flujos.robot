*** Settings ***
Test Template   Flujo
Resource        ../../../Tasks/Cupo/Tareas Validar Cupo.robot
Resource        ../../../Tasks/Popups generales/Tareas Asignar Tarjeta.robot
Resource        ../../../Tasks/Cupo/Tareas Dejar Cupo Pendiente.robot
Resource        ../../../Tasks/Login.robot
Resource        ../../../Tasks/Menu.robot
Resource        ../../../Global Definitions/Variables.robot
Resource        ../../../Global Definitions/Constantes.robot
Resource        ../../../Global Definitions/Mensajes.robot
Resource        ../../../Questions/Cupo/Evaluaciones Validar Cupo.robot
Resource        ../../../Libraries Proxy/Selenium Proxy.robot
Suite Setup     Iniciar Suite
Suite Teardown  Cerrar Suite
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

Iniciar Suite
    Iniciar Aplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    Ir a Validar Cupo

Cerrar Suite
    Cerrar Pantalla
    Disconnect From Database

FlujoAceptarOKSinWsAfip
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Tareas Validar Cupo.Setear Caracteristicas  ${ConWSAfip}    ${ConTarjeta}
    Ingresar Datos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Tareas Validar Cupo.Ingresa codigo cancelacion CTG  ${CodCancCTG}  
    Scrollear Hasta Final Pagina
    Tareas Validar Cupo.Decide aceptar
    Run Keyword If  ${ConTarjeta}==True  Tareas Asignar Tarjeta.Asigna Tarjeta  ${NroTarjeta}
    Verificar movimiento OK     ${Msj}  ${ConCupo}  ${NroCupo}  ${NroTarjeta}

FlujoAceptarOKConWsAfip
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Tareas Validar Cupo.Setear Caracteristicas  ${ConWSAfip}    ${ConTarjeta}
    Ingresar Datos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    Tareas Validar Cupo.Decide aceptar
    Run Keyword If  ${ConTarjeta}==True     Tareas Asignar Tarjeta.Asigna Tarjeta  ${NroTarjeta}
    Sleep   2
    ${ServicioAFIPOK}=  Run Keyword And Return Status  Page Should Contain  ${MsjServicioAFIPNoDisponible}
    Run Keyword If  ${ServicioAFIPOK}     Tareas Validar Cupo.Ingresa codigo cancelacion CTG  ${CodCancCTG}
    Run Keyword If  ${ServicioAFIPOK}     Tareas Validar Cupo.Decide aceptar
    Verificar movimiento OK     ${Msj}  ${ConCupo}  ${NroCupo}  ${NroTarjeta}
    
FlujoAceptarErrorSinWsAfip
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Tareas Validar Cupo.Setear Caracteristicas  ${ConWSAfip}    ${ConTarjeta}
    Ingresar Datos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Tareas Validar Cupo.Ingresa codigo cancelacion CTG  ${CodCancCTG}  
    Scrollear Hasta Final Pagina
    Tareas Validar Cupo.Decide aceptar
    Run Keyword If  ${ConTarjeta}==True  Tareas Asignar Tarjeta.Asigna Tarjeta  ${NroTarjeta}
    Verificar Movimiento con Error    ${Msj}

FlujoAceptarErrorConWsAfip
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Tareas Validar Cupo.Setear Caracteristicas  ${ConWSAfip}    ${ConTarjeta}
    Ingresar Datos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    Tareas Validar Cupo.Decide aceptar
    Run Keyword If  ${ConTarjeta}==True     Tareas Asignar Tarjeta.Asigna Tarjeta  ${NroTarjeta}
    Sleep   2
    Verificar Movimiento con Error    ${Msj}

FlujoPendienteOK
    [Arguments]     ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Ingresar Datos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    Tareas Validar Cupo.Decide dejar pendiente el Cupo
    Tareas Dejar Cupo Pendiente.Acepta dejar pendiente el cupo    ${MotivoPend}   ${ObsPend}
    Verificar movimiento Pendiente OK     ${Msj}  ${NroDocPorte}

FlujoPendienteError
    [Arguments]     ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    Ingresar Datos  ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Scrollear Hasta Final Pagina
    Tareas Validar Cupo.Decide dejar pendiente el Cupo
    Verificar Movimiento Pendiente con Error    ${Msj}

Ingresar Datos 
    [Arguments]     ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Tareas Validar Cupo.Ingresa Carta de porte  ${NroDocPorte}
    Run Keyword If  ${ConCupo}==False  Tareas Validar Cupo.Ingresar Datos Movimiento sin Cupo     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen} 
    Run Keyword If  ${ConCupo}==True  Tareas Validar Cupo.Ingresar Datos Movimiento con Cupo     ${NroCupo}
    Tareas Validar Cupo.Ingresa Datos CTG   ${CTG}   ${CuilTransportista}   ${CuilChofer}  ${KgNeto}

Verificar movimiento OK
    [Arguments]     ${Msj}  ${ConCupo}  ${NroCupo}  ${NroTarjeta}    
    Page Should Contain     ${Msj}
    Evaluaciones Validar Cupo.Sistema debe guardar el movimiento Pendiente Control  ${NroTarjeta}
    Run Keyword If  ${ConCupo}==True  Evaluaciones Validar Cupo.Sistema debe marcar el cupo utilizado como Sin Cupo   ${NroCupo}
    Evaluaciones Validar Cupo.Sistema debe volver al estado inicial de la pantalla

Verificar Movimiento con Error
    [Arguments]     ${Msj}
    Page Should Contain     ${Msj}
    Run Keyword And Ignore Error  Asignar Tarjeta.Cancela Asignación Tarjeta

Verificar Movimiento Pendiente con Error
    [Arguments]     ${Msj}
    Page Should Contain     ${Msj}

Verificar movimiento Pendiente OK
    [Arguments]     ${Msj}  ${NroDocPorte}  
    Page Should Contain     ${Msj}
    Evaluaciones Validar Cupo.Sistema debe guardar el movimiento Pendiente Cupo     ${NroDocPorte}
    Evaluaciones Validar Cupo.Sistema debe volver al estado inicial de la pantalla