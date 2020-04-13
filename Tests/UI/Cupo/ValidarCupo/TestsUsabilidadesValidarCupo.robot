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
Suite Setup     Run Keywords  TareasLogin.IniciarAplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}     AND     TareasMenu.IrAValidarCupo
Suite Teardown  Cerrar Pantalla
Library         DatabaseLibrary
Force Tags      Usabilidad   BajaCriticidad

**Test Cases
#### USABILIDADES PARTICULARES####

UsabilidadEstadoInicial
    #GIVEN estado inicial de la pantalla
    THEN EvaluacionesValidarCupo.TipoProductoDebeSer Cereal
        AND EvaluacionesValidarCupo.TipoDocumentoPorteDebeSer Carta de Porte YEstarDeshabilitado
        AND EvaluacionesValidarCupo.NroDocumentoPorteDebeTenerFoco

UsabilidadSeleccionOpcionConCupo
    GIVEN TareasValidarCupo.IngresarCartaPorte  123412345678
    WHEN TareasValidarCupo.SeleccionarIngresoConCupo
    THEN EvaluacionesValidarCupo.NroCupoDebeEstarHabilitadoYDatosDocumentoInhabilitados

UsabilidadSeleccionOpcionSinCupo
    GIVEN TareasValidarCupo.IngresarCartaPorte  123412345678
    WHEN TareasValidarCupo.SeleccionaIngresoSinCupo
    THEN EvaluacionesValidarCupo.DatosDocumentoDebenEstarHabilitadosYNroCupoInhabilitado 

UsabilidaSeleccionProductoEPA
    GIVEN TareasValidarCupo.IngresarCartaPorte  123412345678
        AND TareasValidarCupo.SeleccionaIngresoSinCupo
    WHEN TareasValidarCupo.IngresarProducto  ${gIdSojaEpa}
    THEN EvaluacionesValidarCupo.DatosEPADebenEstarHabilitados

UsabilidadSeleccionProductoNoEPA  
    GIVEN TareasValidarCupo.IngresarCartaPorte     123412345678
        AND TareasValidarCupo.SeleccionaIngresoSinCupo
    WHEN TareasValidarCupo.IngresarProducto    ${gIdSoja}
    THEN EvaluacionesValidarCupo.DatosEPADebenEstarDeshabilitados

UsabilidadRecuperarDatoCupoAnterior
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN TareasValidarCupo.IngresarCartaPorte     123412345678
        AND TareasValidarCupo.SeleccionarIngresoConCupo
    WHEN TareasValidarCupo.IngresarCupo  TMB-SOJ-20191123-8417
    THEN EvaluacionesValidarCupo.SistemaDebeRecuperarDatosCupoIngresado  TMB-SOJ-20191022-2985
        AND EvaluacionesValidarCupo.SistemaDebeInformarCupoAnteriorOPosterior
        AND EvaluacionesValidarCupo.SistemaDebeMarcarIngresoSinCupo

UsabilidadBusquedaAvanzadaProducto
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN TareasValidarCupo.IngresarCartaPorte  123412345678
        AND TareasValidarCupo.SeleccionaIngresoSinCupo
    WHEN TareasValidarCupo.IrBusquedaAvanzadaProducto
        AND TareasBusquedaAvanzadaProducto.Buscar Producto Por Codigo  ${gIdSoja}
    THEN EvaluacionesValidarCupo.SistemaDebeVisualizarDescripcionProductoSeleccionado  ${gIdSoja}

UsabilidadFinalidadesActivas
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN TareasValidarCupo.IngresarCartaPorte  123412345678
        AND TareasValidarCupo.SeleccionaIngresoSinCupo
        AND TareasValidarCupo.IngresarDatosDocumento  ${gIdSoja}  ${gCuilLDC}    ${gCuilLDC}   ${gCuilZeni}    ${gIdFinalidadCV}   ${gIdMotivoCV}    ${gSedeCharata}
    THEN EvaluacionesValidarCupo.SistemaDebeVisualizarTodasFinalidadesActivas  ${gIdCircuitoDescargaCamionCerealTimbues}

UsabilidadYValidacionCupoUtilizado
    GIVEN Refrescar pagina
        AND TareasValidarCupo.IngresarCartaPorte     123412345678
        AND TareasValidarCupo.SeleccionarIngresoConCupo
    WHEN TareasValidarCupo.IngresarCupo  TMB-SOJ-20191022-2985
    THEN EvaluacionesValidarCupo.SistemaDebeInformarCupoYaUtilizado

