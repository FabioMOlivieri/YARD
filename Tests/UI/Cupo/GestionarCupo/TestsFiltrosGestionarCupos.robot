**Settings
Resource        ../../../../Tasks/Cupo/TareasGestionarCupos.robot
Resource        ../../../../Questions/Cupo/EvaluacionesGestionarCupos.robot
Resource        ../../../../Tasks/TareasLogin.robot
Resource        ../../../../Tasks/TareasMenu.robot
Resource        ../../../../Global Definitions/Variables.robot
Resource        ../../../../Global Definitions/Constantes.robot
Resource        ../../../../Libraries Proxy/Selenium Proxy.robot
Suite Setup     IniciarSuite
Suite Teardown  CerrarSuite
Library         DatabaseLibrary

**Test Cases
FiltrarPendCupoPorTipoDocPorte
    GIVEN TareasGestionarCupos.LimpiarBusqueda
        AND Sleep   1
    WHEN TareasGestionarCupos.FiltrarMovimientos     ${gIdTipoCartaPorte}    ${Empty}    ${Empty}    ${Empty}    ${Empty}  ${Empty}    ${Empty}    ${Empty}    ${gEstadoPendienteCupo}
    THEN EvaluacionesGestionarCupos.SistemaDebeFiltrarMovimientosPendienteCupoPorTipoDocPorte  ${gIdTipoCartaPorte}

FiltrarPendCupoPorNroDocPorte
    GIVEN TareasGestionarCupos.LimpiarBusqueda
        AND Sleep   1
    WHEN TareasGestionarCupos.FiltrarMovimientos     ${Empty}    888811111151    ${Empty}    ${Empty}    ${Empty}  ${Empty}    ${Empty}    ${Empty}    ${gEstadoPendienteCupo}
    THEN EvaluacionesGestionarCupos.SistemaDebeFiltrarMovimientosPendienteCupoPorNroDocPorte  888811111151

FiltrarPendCupoPorFechaEntrada
    GIVEN TareasGestionarCupos.LimpiarBusqueda
        AND Sleep   1
    WHEN TareasGestionarCupos.FiltrarMovimientos     ${Empty}    ${Empty}    06/03/2020    ${Empty}    ${Empty}  ${Empty}    ${Empty}    ${Empty}    ${gEstadoPendienteCupo}
    THEN EvaluacionesGestionarCupos.SistemaDebeFiltrarMovimientosPendienteCupoPorFechaEntrada   2020-03-06

**Keywords
IniciarSuite
    IniciarAplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    IrAGestionarCupo

CerrarSuite
    Cerrar Pantalla
    Disconnect From Database