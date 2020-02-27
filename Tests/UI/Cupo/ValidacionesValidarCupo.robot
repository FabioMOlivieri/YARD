*** Settings ***
Test Template   Flujo Validar Cupo
Resource        ../../../Tasks/Cupo/Tareas Validar Cupo.robot
Resource        ../../../Tasks/Popups generales/Tareas Asignar Tarjeta.robot
Resource        ../../../Tasks/Login.robot
Resource        ../../../Tasks/Menu.robot
Resource        ../../../Global Definitions/Variables.robot
Resource        ../../../Global Definitions/Constantes.robot
Resource        ../../../Questions/Cupo/Evaluaciones Validar Cupo.robot
Resource        ../../../Libraries Proxy/Selenium Proxy.robot
Suite Setup     Run Keywords  Iniciar Aplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}     AND     Ir a Validar Cupo
Suite Teardown  Cerrar Pantalla
Library           DataDriver    ${FilePathExcel}    sheet_name=${HojaExcel}

**Variables
${FilePathExcel}    ../../../External Resources/UI/Cupo/CasosConErrorValidarCupo.xlsx
${HojaExcel}      Datos

***Test Cases***     NroDocPorte     CodProducto     CuilVendedor    CuilCorredor    CuilDestinatario    IdFinalidad     IdMotivo    CTG     CuilTransportista   CuilChofer  KgNeto  CodCancCTG  NroTarjeta  MsjError    
CasosConError   ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}  ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${NroTarjeta}   ${ValFront}   ${MsjError} 

**Keywords
Flujo Validar Cupo
    [Arguments]     ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}  ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${NroTarjeta}   ${ValFront}   ${MsjError}                
    Refrescar pagina
    Tareas Validar Cupo.Ingresa Carta de porte  ${NroDocPorte}
    Run Keyword If  ${ConCupo}==False  Tareas Validar Cupo.Selecciona Ingreso sin Cupo
    Run Keyword If  ${ConCupo}==False  Tareas Validar Cupo.Ingresa Datos Documento     ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}   ${SedeOrigen} 
    Run Keyword If  ${ConCupo}==True  Tareas Validar Cupo.Selecciona Ingreso con Cupo
    Run Keyword If  ${ConCupo}==True  Tareas Validar Cupo.Ingresa Cupo  ${NroCupo}
    Tareas Validar Cupo.Ingresa Datos CTG   ${CTG}   ${CuilTransportista}   ${CuilChofer}  ${KgNeto}
    Tareas Validar Cupo.Ingresa codigo cancelacion CTG  ${CodCancCTG}  
    Tareas Validar Cupo.Decide aceptar
    Tareas Asignar Tarjeta.Asigna Tarjeta  ${NroTarjeta}
    Page Should Contain     ${MsjError}
    Run Keyword And Ignore Error  Asignar Tarjeta.Cancela Asignación Tarjeta


