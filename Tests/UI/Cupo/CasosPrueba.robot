*** Settings ***
Test Template   Flujo
Resource        ../../../Tasks/Cupo/Tareas Validar Cupo.robot
Resource        ../../../Tasks/Popups generales/Tareas Asignar Tarjeta.robot
Resource        ../../../Tasks/Cupo/Tareas Dejar Cupo Pendiente.robot
Resource        ../../../Tasks/Login.robot
Resource        ../../../Tasks/Menu.robot
Resource        ../../../Global Definitions/Variables.robot
Resource        ../../../Global Definitions/Constantes.robot
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
    Run Keyword If  '${Accion}'=='ACEPTA'   Setear Caracteristicas  ${ConWSAfip}    ${ConTarjeta}
    Tareas Validar Cupo.Ingresa Carta de porte  ${NroDocPorte}
    Run Keyword If  ${ConCupo}==False  Ingresar Datos Documento     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen} 
    Run Keyword If  ${ConCupo}==True  Ingresar Cupo     ${NroCupo}
    Tareas Validar Cupo.Ingresa Datos CTG   ${CTG}   ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Run Keyword If  '${Accion}'=='ACEPTA'  Aceptar Movimiento  ${TipoFlujo}    ${ConWSAfip}    ${ConTarjeta}   ${NroTarjeta}   ${CodCancCTG}   ${ConCupo}  ${NroCupo}  ${Msj}
    Run Keyword If  '${Accion}'=='PENDIENTE'  Dejar Movimiento Pendiente    ${TipoFlujo}    ${MotivoPend}   ${ObsPend}  ${Msj}  ${NroDocPorte}

Iniciar Suite
    Iniciar Aplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    Ir a Validar Cupo

Cerrar Suite
    Cerrar Pantalla
    Disconnect From Database

Setear Caracteristicas
    [Arguments]     ${ConWSAfip}    ${ConTarjeta}
    Run Keyword If  ${ConWSAfip}==False  Tareas Validar Cupo.Deshabilita Accion WS Afip     ${gWorkstationGeneralTimbues}
    Run Keyword If  ${ConWSAfip}==True  Tareas Validar Cupo.Habilita Accion WS Afip     ${gWorkstationGeneralTimbues}
    Run Keyword If  ${ConTarjeta}==False  Tareas Validar Cupo.Deshabilita Accion Uso Tarjeta  ${gWorkstationGeneralTimbues}
    Run Keyword If  ${ConTarjeta}==True  Tareas Validar Cupo.Habilita Accion Uso Tarjeta  ${gWorkstationGeneralTimbues}
    Refrescar pagina

Ingresar Datos Documento
    [Arguments]     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen}
    Tareas Validar Cupo.Selecciona Ingreso sin Cupo
    Tareas Validar Cupo.Ingresa Datos Documento     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen}

Ingresar Cupo
    [Arguments]     ${NroCupo}
    Tareas Validar Cupo.Selecciona Ingreso con Cupo
    Tareas Validar Cupo.Ingresa Cupo  ${NroCupo}

Aceptar Movimiento
    [Arguments]     ${TipoFlujo}    ${ConWSAfip}    ${ConTarjeta}   ${NroTarjeta}   ${CodCancCTG}   ${ConCupo}  ${NroCupo}  ${Msj}     
    Run Keyword If  ${ConWSAfip}==False  Aceptar Sin WS Afip    ${ConTarjeta}   ${NroTarjeta}   ${CodCancCTG}
    Run Keyword If  ${ConWSAfip}==True  Aceptar Con WS Afip     ${TipoFlujo}    ${ConTarjeta}   ${NroTarjeta}   ${CodCancCTG}
    Run Keyword If  '${TipoFlujo}'=='OK'    Verificar movimiento OK     ${Msj}  ${ConCupo}  ${NroCupo}  ${NroTarjeta}
    Run Keyword If  '${TipoFlujo}'=='ERROR'     Verificar Movimiento con Error    ${Msj} 

Aceptar Sin WS Afip
    [Arguments]     ${ConTarjeta}   ${NroTarjeta}   ${CodCancCTG}
    Tareas Validar Cupo.Ingresa codigo cancelacion CTG  ${CodCancCTG}  
    Tareas Validar Cupo.Decide aceptar
    Run Keyword If  ${ConTarjeta}==True  Tareas Asignar Tarjeta.Asigna Tarjeta  ${NroTarjeta}

Aceptar Con WS Afip
    [Arguments]     ${TipoFlujo}    ${ConTarjeta}   ${NroTarjeta}   ${CodCancCTG}   
    Run Keyword If  '${TipoFlujo}'=='OK'  Aceptar Flujo OK y Con WS AFIP  ${ConTarjeta}   ${NroTarjeta}   ${CodCancCTG}
    Run Keyword If  '${TipoFlujo}'=='ERROR'  Aceptar Flujo con Eror y Con WS AFIP  ${ConTarjeta}   ${NroTarjeta}

Aceptar Flujo con Eror y Con WS AFIP
    [Arguments]     ${ConTarjeta}   ${NroTarjeta}
    Tareas Validar Cupo.Decide aceptar
    Run Keyword If  ${ConTarjeta}==True     Tareas Asignar Tarjeta.Asigna Tarjeta  ${NroTarjeta}
    Sleep   2

Aceptar Flujo OK y Con WS AFIP
    [Arguments]     ${ConTarjeta}   ${NroTarjeta}   ${CodCancCTG}
    Tareas Validar Cupo.Decide aceptar
    Run Keyword If  ${ConTarjeta}==True     Tareas Asignar Tarjeta.Asigna Tarjeta  ${NroTarjeta}
    Sleep   2
    ${ServicioAFIPOK}=  Run Keyword And Return Status  Page Should Contain  El servicio de AFIP No se encuentra Disponible
    Run Keyword If  ${ServicioAFIPOK}     Tareas Validar Cupo.Ingresa codigo cancelacion CTG  ${CodCancCTG}
    Run Keyword If  ${ServicioAFIPOK}     Tareas Validar Cupo.Decide aceptar

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

Dejar Movimiento Pendiente
    [Arguments]     ${TipoFlujo}    ${MotivoPend}   ${ObsPend}  ${Msj}  ${NroDocPorte}
    Tareas Validar Cupo.Decide dejar pendiente el Cupo
    Run Keyword If  '${TipoFlujo}'=='OK'  Dejar Movimiento Pendiente OK    ${MotivoPend}   ${ObsPend}  ${Msj}  ${NroDocPorte}
    Run Keyword If  '${TipoFlujo}'=='ERROR'     Verificar Movimiento Pendiente con Error    ${Msj}

Dejar Movimiento Pendiente OK
    [Arguments]     ${MotivoPend}   ${ObsPend}  ${Msj}  ${NroDocPorte}
    Tareas Dejar Cupo Pendiente.Acepta dejar pendiente el cupo    ${MotivoPend}   ${ObsPend}
    Verificar movimiento Pendiente OK     ${Msj}  ${NroDocPorte}

Verificar Movimiento Pendiente con Error
    [Arguments]     ${Msj}
    Page Should Contain     ${Msj}

Verificar movimiento Pendiente OK
    [Arguments]     ${Msj}  ${NroDocPorte}  
    Page Should Contain     ${Msj}
    Evaluaciones Validar Cupo.Sistema debe guardar el movimiento Pendiente Cupo     ${NroDocPorte}
    Evaluaciones Validar Cupo.Sistema debe volver al estado inicial de la pantalla