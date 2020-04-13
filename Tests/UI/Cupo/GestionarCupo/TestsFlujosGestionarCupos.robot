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
Force Tags      Navegabilidad   AltaCriticidad    

**Variables
${NroDocPorteParaConsultar}  888811111151
${NroDocPorteParaModificar}  888811111151
${NroDocPorteParaAnular}    888811111118

**Test Cases
ConsultarMovimientoPendienteCupo
    GIVEN IrAGestionarCupo
        AND TareasGestionarCupos.FiltrarMovimientos     ${Empty}    ${NroDocPorteParaConsultar}    ${Empty}    ${Empty}    ${Empty}  ${Empty}    ${Empty}    ${Empty}    ${gEstadoPendienteCupo}
        AND Sleep   0.5
    WHEN TareasGestionarCupos.ConsultarMovimiento  ${NroDocPorteParaConsultar}
        AND Sleep   0.5
    THEN EvaluacionesGestionarCupos.SistemaDebeVisualizarMovimientoModoConsulta  ${NroDocPorteParaConsultar}

ModificarMovimientoPendienteCupo
    GIVEN IrAGestionarCupo
        AND TareasGestionarCupos.FiltrarMovimientos     ${Empty}    ${NroDocPorteParaModificar}    ${Empty}    ${Empty}    ${Empty}  ${Empty}    ${Empty}    ${Empty}    ${gEstadoPendienteCupo}
        AND Sleep   0.5
    WHEN TareasGestionarCupos.ModificarMovimiento  ${NroDocPorteParaModificar}
        AND Sleep   0.5
    EvaluacionesGestionarCupos.SistemaDebeVisualizarMovimientoModoEdicion   ${NroDocPorteParaModificar}
    #TODO: Falta la evaluación del resultado

AnularMovimientoPendienteCupo
    GIVEN IrAGestionarCupo
        AND TareasGestionarCupos.FiltrarMovimientos     ${Empty}    ${NroDocPorteParaAnular}    ${Empty}    ${Empty}    ${Empty}  ${Empty}    ${Empty}    ${Empty}    ${gEstadoPendienteCupo}
        AND Sleep   0.5
    WHEN TareasGestionarCupos.AnularMovimiento  ${NroDocPorteParaAnular}    prueba automatización
        AND Sleep   0.5
    THEN EvaluacionesGestionarCupos.SistemaDebeAnularMovimiento  ${NroDocPorteParaAnular}

**Keywords
IniciarSuite
    IniciarAplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    
CerrarSuite
    Cerrar Pantalla
    Disconnect From Database