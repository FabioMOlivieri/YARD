*** Settings ***
Test Template   Flujo
Resource        ../../../Tasks/Cupo/Tareas Validar Cupo.robot
Resource        ../../../Tasks/Popups generales/Tareas Asignar Tarjeta.robot
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
CasosPrueba   ${TipoFlujo}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${ConWSAfip}    ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${NroTarjeta}   ${ValFront}   ${Msj} 

**Keywords
Flujo
    [Arguments]     ${TipoFlujo}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${ConWSAfip}    ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${NroTarjeta}   ${ValFront}   ${Msj}                
    Setear WS Afip  ${ConWSAfip}
    Tareas Validar Cupo.Ingresa Carta de porte  ${NroDocPorte}
    Run Keyword If  ${ConCupo}==False  Ingresar Datos Documento     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen} 
    Run Keyword If  ${ConCupo}==True  Ingresar Cupo     ${NroCupo}
    Tareas Validar Cupo.Ingresa Datos CTG   ${CTG}   ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Run Keyword If  ${ConWSAfip}==False  Aceptar Sin WS Afip    ${NroTarjeta}   ${CodCancCTG}
    Run Keyword If  ${ConWSAfip}==True  Aceptar Con WS Afip     ${NroTarjeta}   ${CodCancCTG}
    Run Keyword If  '${ConWSAfip}'=='OK'    Verificar movimiento OK     ${Msj}  ${ConCupo}  ${NroCupo}  ${NroTarjeta}
    Run Keyword If  '${ConWSAfip}'=='ERROR'     Verificar Movimiento con Error    ${Msj} 

Iniciar Suite
    Iniciar Aplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    Ir a Validar Cupo

Cerrar Suite
    Cerrar Pantalla
    Disconnect From Database

Setear WS Afip
    [Arguments]     ${ConWSAfip}
    Run Keyword If  ${ConWSAfip}==False  Tareas Validar Cupo.Deshabilita Accion WS Afip     ${gWorkstationGeneralTimbues}
    Run Keyword If  ${ConWSAfip}==True  Tareas Validar Cupo.Habilita Accion WS Afip     ${gWorkstationGeneralTimbues}
    Refrescar pagina

Ingresar Datos Documento
    [Arguments]     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen}
    Tareas Validar Cupo.Selecciona Ingreso sin Cupo
    Tareas Validar Cupo.Ingresa Datos Documento     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen}

Ingresar Cupo
    [Arguments]     ${NroCupo}
    Tareas Validar Cupo.Selecciona Ingreso con Cupo
    Tareas Validar Cupo.Ingresa Cupo  ${NroCupo}

Aceptar Sin WS Afip
    [Arguments]     ${NroTarjeta}   ${CodCancCTG}
    Tareas Validar Cupo.Ingresa codigo cancelacion CTG  ${CodCancCTG}  
    Tareas Validar Cupo.Decide aceptar
    Tareas Asignar Tarjeta.Asigna Tarjeta  ${NroTarjeta}

Aceptar Con WS Afip
    [Arguments]     ${NroTarjeta}   ${CodCancCTG}   
    Tareas Validar Cupo.Decide aceptar
    Tareas Asignar Tarjeta.Asigna Tarjeta  ${NroTarjeta}
    Sleep   2
    Tareas Validar Cupo.Ingresa codigo cancelacion CTG  ${CodCancCTG}
    Tareas Validar Cupo.Decide aceptar

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