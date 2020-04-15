*** Settings ***
Resource        ../../../../Tasks/Cupo/TareasValidarCupo.robot
Resource        ../../../../Tasks/Popups generales/TareasAsignarTarjeta.robot
Resource        ../../../../Tasks/Cupo/TareasBusquedaAvanzadaProducto.robot
Resource        ../../../../Tasks/Cupo/TareasDejarCupoPendiente.robot
Resource        ../../../../Tasks/TareasLogin.robot
Resource        ../../../../Tasks/TareasMenu.robot
Resource        ../../../../Global Definitions/Variables.robot
Resource        ../../../../Global Definitions/Constantes.robot
Resource        ../../../../Questions/Cupo/EvaluacionesValidarCupo.robot
Resource        ../../../../Libraries Proxy/Selenium Proxy.robot
Suite Setup     InicarSuite
Suite Teardown  CerrarSuite
Library         DatabaseLibrary
Force Tags      Usabilidad   BajaCriticidad

**Test Cases
#### USABILIDADES PARTICULARES####

UsabilidadEstadoInicial
    #[Teardown]  Run Keyword If Test Failed  Imprimir pantalla  UsabilidadEstadoInicial.png
    #GIVEN estado inicial de la pantalla
    THEN EvaluacionesValidarCupo.TipoProductoDebeSer Cereal
        AND EvaluacionesValidarCupo.TipoDocumentoPorteDebeSer Carta de Porte YEstarDeshabilitado
        AND EvaluacionesValidarCupo.NroDocumentoPorteDebeTenerFoco
        AND EvaluacionesValidarCupo.NroCupoDebeEstarHabilitadoYDatosDocumentoInhabilitados

UsabilidadSeleccionOpcionConCupo
    #[Teardown]  Run Keyword If Test Failed  Imprimir pantalla  UsabilidadSeleccionOpcionConCupo.png
    GIVEN TareasValidarCupo.IngresarCartaPorte  123412345678
    WHEN TareasValidarCupo.SeleccionarIngresoConCupo
    THEN EvaluacionesValidarCupo.NroCupoDebeEstarHabilitadoYDatosDocumentoInhabilitados

UsabilidadSeleccionOpcionSinCupo
    #[Teardown]  Run Keyword If Test Failed  Imprimir pantalla  UsabilidadSeleccionOpcionSinCupo.png
    GIVEN TareasValidarCupo.IngresarCartaPorte  123412345678
    WHEN TareasValidarCupo.SeleccionaIngresoSinCupo
    THEN EvaluacionesValidarCupo.DatosDocumentoDebenEstarHabilitadosYNroCupoInhabilitado 

UsabilidaSeleccionProductoEPA
    #[Teardown]  Run Keyword If Test Failed  Imprimir pantalla  UsabilidaSeleccionProductoEPA.png
    GIVEN TareasValidarCupo.IngresarCartaPorte  123412345678
        AND TareasValidarCupo.SeleccionaIngresoSinCupo
    WHEN TareasValidarCupo.IngresarProducto  ${gIdSojaEpa}
    THEN EvaluacionesValidarCupo.DatosEPADebenEstarHabilitados

UsabilidadSeleccionProductoNoEPA  
    #[Teardown]  Run Keyword If Test Failed  Imprimir pantalla  UsabilidadSeleccionProductoNoEPA.png
    GIVEN TareasValidarCupo.IngresarCartaPorte     123412345678
        AND TareasValidarCupo.SeleccionaIngresoSinCupo
    WHEN TareasValidarCupo.IngresarProducto    ${gIdSoja}
    THEN EvaluacionesValidarCupo.DatosEPADebenEstarDeshabilitados

UsabilidadRecuperarDatoCupoAnterior
    #[Teardown]  Run Keyword If Test Failed  Imprimir pantalla  UsabilidadRecuperarDatoCupoAnterior.png 
    GIVEN TareasValidarCupo.IngresarCartaPorte     123412345678
        AND TareasValidarCupo.SeleccionarIngresoConCupo
    WHEN TareasValidarCupo.IngresarCupo  TMB-SOJ-20191123-8417
    THEN EvaluacionesValidarCupo.SistemaDebeRecuperarDatosCupoIngresado  TMB-SOJ-20191022-2985
        AND EvaluacionesValidarCupo.SistemaDebeInformarCupoAnteriorOPosterior
        AND EvaluacionesValidarCupo.SistemaDebeMarcarIngresoSinCupo

UsabilidadBusquedaAvanzadaProducto
    #[Teardown]  Run Keyword If Test Failed  Imprimir pantalla  UsabilidadBusquedaAvanzadaProducto.png 
    GIVEN TareasValidarCupo.IngresarCartaPorte  123412345678
        AND TareasValidarCupo.SeleccionaIngresoSinCupo
    WHEN TareasValidarCupo.IrBusquedaAvanzadaProducto
        AND TareasBusquedaAvanzadaProducto.Buscar Producto Por Codigo  ${gIdSoja}
    THEN EvaluacionesValidarCupo.SistemaDebeVisualizarDescripcionProductoSeleccionado  ${gIdSoja}

UsabilidadFinalidadesActivas
    #[Teardown]  Run Keyword If Test Failed  Imprimir pantalla  UsabilidadFinalidadesActivas.png 
    GIVEN TareasValidarCupo.IngresarCartaPorte  123412345678
        AND TareasValidarCupo.SeleccionaIngresoSinCupo
        AND TareasValidarCupo.IngresarDatosDocumento  ${gIdSoja}  ${gCuilLDC}    ${gCuilLDC}   ${gCuilZeni}    ${gIdFinalidadCV}   ${gIdMotivoCV}    ${gSedeCharata}
    THEN EvaluacionesValidarCupo.SistemaDebeVisualizarTodasFinalidadesActivas  ${gIdCircuitoDescargaCamionCerealTimbues}

UsabilidadYValidacionCupoUtilizado
    #[Teardown]  Run Keyword If Test Failed  Imprimir pantalla  UsabilidadYValidacionCupoUtilizado.png
    GIVEN Refrescar pagina
        AND TareasValidarCupo.IngresarCartaPorte     123412345678
        AND TareasValidarCupo.SeleccionarIngresoConCupo
    WHEN TareasValidarCupo.IngresarCupo  TMB-SOJ-20191022-2985
    THEN EvaluacionesValidarCupo.SistemaDebeInformarCupoYaUtilizado

**Keywords
InicarSuite
    TareasLogin.IniciarAplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    TareasMenu.IrAValidarCupo

CerrarSuite
    Disconnect From Database
    Cerrar Pantalla
    
