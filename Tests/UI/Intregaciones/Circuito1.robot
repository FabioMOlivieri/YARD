################# DESC CIRCUITO #################
# Validar Cupo OK / …
#################################################

**Settings
Library         OpenPyxlLibrary
Library         String
Resource        ../../../Tasks/TareasLogin.robot
Resource        ../../../Tasks/TareasMenu.robot
Resource        ../../../Tasks/Cupo/TareasValidarCupo.robot
Resource        ../../../Tasks/Cupo/TareasDejarCupoPendiente.robot
Resource        ../../../Tasks/Cupo/TareasGestionarCupos.robot
Resource        ../../../Global Definitions/Variables.robot
Resource        ../../../Global Definitions/Constantes.robot
Resource        ../../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../../Questions/Cupo/EvaluacionesValidarCupo.robot
Resource        ../../../External Resources/RutaRecursos.robot
Resource        ExtraccionDatosCircuito.robot
Suite Setup     IniciarSuite
Suite Teardown  CerrarSuite
Force Tags      Circuitos   AltaCriticidad

**Variables
${FilePathExcelCircuitos}    UI/Integracion/CasosPruebaCircuitos.xlsx

**Test Cases
Circuito
    ${NroDocPorte}=     ValidarCupoPendiente
    AnularMovimiento    ${NroDocPorte}

**Keywords
IniciarSuite
    IniciarAplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    ${RutaRecurso}=     ObtenerRutaRecursos
    Open Excel  ${RutaRecurso}/${FilePathExcelCircuitos}

CerrarSuite
    Cerrar Pantalla
    Disconnect From Database

ValidarCupoPendiente
    IrAValidarCupo
    @{DatosCupo}=   ExtraccionDatosCircuito.ObtenerDatosCupo  2
    TareasValidarCupo.DejarPendienteMovimientoOK  @{DatosCupo}[1]     @{DatosCupo}[2]     @{DatosCupo}[3]     @{DatosCupo}[4]     @{DatosCupo}[5]     @{DatosCupo}[6]     @{DatosCupo}[7]     @{DatosCupo}[8]     @{DatosCupo}[9]     @{DatosCupo}[10]    @{DatosCupo}[11]    @{DatosCupo}[12]    @{DatosCupo}[13]    @{DatosCupo}[14]  @{DatosCupo}[20]  @{DatosCupo}[21]
    Set Selenium Implicit Wait  0.5
    EvaluacionesValidarCupo.VerificarMovimientoPendienteOK  @{DatosCupo}[19]  @{DatosCupo}[1]
    [Return]    @{DatosCupo}[1] 

AnularMovimiento
    [Arguments]     ${NroDocPorte}
    IrAGestionarCupo
    TareasGestionarCupos.FiltrarMovimientos     ${Empty}    ${NroDocPorte}    ${Empty}    ${Empty}    ${Empty}  ${Empty}    ${Empty}    ${Empty}    ${gEstadoPendienteCupo}
    TareasGestionarCupos.AnularMovimiento  ${NroDocPorte}  Prueba automatizacion