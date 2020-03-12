################# DESC CIRCUITO #################
# Validar Cupo OK / …
#################################################

**Settings
Library         OpenPyxlLibrary
Library         String
Resource        ../../../Tasks/TareasLogin.robot
Resource        ../../../Tasks/TareasMenu.robot
Resource        ../../../Tasks/Cupo/TareasValidarCupo.robot
Resource        ../../../Global Definitions/Variables.robot
Resource        ../../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../../Questions/Cupo/EvaluacionesValidarCupo.robot
Resource        ExtraccionDatosCircuito.robot
Suite Setup     IniciarSuite
Suite Teardown  CerrarSuite

**Variables
${FilePathExcelCircuitos}    ../../../External Resources/UI/Integracion/CasosPruebaCircuitos.xlsx

**Test Cases
Circuito
    ValidarCupo
    #próximo puestos...

**Keywords
IniciarSuite
    IniciarAplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    Open Excel  ${FilePathExcelCircuitos}

CerrarSuite
    Cerrar Pantalla
    Disconnect From Database

ValidarCupo
    IrAValidarCupo
    @{DatosCupo}=   ExtraccionDatosCircuito.ObtenerDatosCupo  2
    AceptarSinWsAfipMovimientoOK  @{DatosCupo}[0]    @{DatosCupo}[1]     @{DatosCupo}[2]     @{DatosCupo}[3]     @{DatosCupo}[4]     @{DatosCupo}[5]     @{DatosCupo}[6]     @{DatosCupo}[7]     @{DatosCupo}[8]     @{DatosCupo}[9]     @{DatosCupo}[10]    @{DatosCupo}[11]    @{DatosCupo}[12]    @{DatosCupo}[13]    @{DatosCupo}[14]    @{DatosCupo}[15]    @{DatosCupo}[16]    @{DatosCupo}[17]    @{DatosCupo}[18]    @{DatosCupo}[19]    @{DatosCupo}[20]    @{DatosCupo}[21]

AceptarSinWsAfipMovimientoOK
    [Arguments]     ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPend}   ${ObsPend}
    TareasValidarCupo.AceptarSinWsAfipMovimientoOK  ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidad}     ${IdMotivo}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}
    EvaluacionesValidarCupo.VerificarMovimientoOK   ${Msj}  ${ConCupo}  ${NroCupo}  ${NroTarjeta}
