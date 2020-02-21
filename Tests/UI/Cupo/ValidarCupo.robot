*** Settings ***
Resource        ../../../Tasks/Cupo/Tareas Validar Cupo.robot
Resource        ../../../Tasks/Popups generales/Tareas Asignar Tarjeta.robot
Resource        ../../../Tasks/Cupo/Tareas Busqueda Avanzada Producto.robot
Resource        ../../../Tasks/Cupo/Tareas Dejar Cupo Pendiente.robot
Resource        ../../../Tasks/Login.robot
Resource        ../../../Tasks/Menu.robot
Resource        ../../../Global Definitions/Variables.robot
Resource        ../../../Global Definitions/Constantes.robot
Resource        ../../../Questions/Cupo/Evaluaciones Validar Cupo.robot
Suite Setup     Run Keywords  Iniciar Aplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}     AND     Ir a Validar Cupo
Suite Teardown  Cerrar Pantalla
Library         DatabaseLibrary

**Test Cases
#### USABILIDADES PARTICULARES####
UsabilidadEstadoInicial
    #GIVEN estado inicial de la pantalla
    THEN Evaluaciones Validar Cupo.Tipo de producto debe ser Cereal
        AND Evaluaciones Validar Cupo.Tipo documento porte debe ser Carta de Porte y estar deshabilitado
        AND Evaluaciones Validar Cupo.Nro documento porte debe tener el foco

UsabilidadSeleccionOpcionConCupo
    GIVEN Tareas Validar Cupo.Ingresa Carta de porte     123412345678
    WHEN Tareas Validar Cupo.Selecciona Ingreso con Cupo
    THEN Evaluaciones Validar Cupo.Nro cupo debe estar habilitado para el ingreso y datos documento inhabilitados

UsabilidadSeleccionOpcionSinCupo
    GIVEN Tareas Validar Cupo.Ingresa Carta de porte     123412345678
    WHEN Tareas Validar Cupo.Selecciona Ingreso sin Cupo
    THEN Evaluaciones Validar Cupo.Datos documento deben estar habilitados para el ingreso y Nro cupo inhabilitado 

UsabilidaSeleccionProductoEPA
    GIVEN Tareas Validar Cupo.Ingresa Carta de porte     123412345678
        AND Tareas Validar Cupo.Selecciona Ingreso sin Cupo
    WHEN Tareas Validar Cupo.Ingresa Producto    ${gIdSojaEpa}
    THEN Evaluaciones Validar Cupo.Datos EPA deben estar habilitados para el ingreso

UsabilidadSeleccionProductoNoEPA  
    GIVEN Tareas Validar Cupo.Ingresa Carta de porte     123412345678
        AND Tareas Validar Cupo.Selecciona Ingreso sin Cupo
    WHEN Tareas Validar Cupo.Ingresa Producto    ${gIdSoja}
    THEN Evaluaciones Validar Cupo.Datos EPA deben estar deshabilitados para el ingreso

UsabilidadRecuperarDatoDocumentoDeCupo
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN Tareas Validar Cupo.Ingresa Carta de porte     123412345678
        AND Tareas Validar Cupo.Selecciona Ingreso con Cupo
    WHEN Tareas Validar Cupo.Ingresa Cupo  TMB-SOJ-20191016-4514
    THEN Evaluaciones Validar Cupo.Sistema debe recuperar datos del cupo ingresado     TMB-SOJ-20191016-4514

UsabilidadBusquedaAvanzadaProducto
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN Tareas Validar Cupo.Ingresa Carta de porte  123412345678
        AND Tareas Validar Cupo.Selecciona Ingreso sin Cupo
    WHEN Tareas Validar Cupo.Va a la busqueda avanzada de Producto
        AND Tareas Busqueda Avanzada Producto.Busca producto por codigo  ${gIdSoja}
    THEN Evaluaciones Validar Cupo.Sistema debe visualizar descripcion del producto seleccionado  ${gIdSoja}

UsabilidadFinalidadesActivas
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN Tareas Validar Cupo.Ingresa Carta de porte  123412345678
        AND Tareas Validar Cupo.Selecciona Ingreso sin Cupo
        AND Tareas Validar Cupo.Ingresa Datos Documento  ${gIdSoja}  ${gCuilLDC}    ${gCuilLDC}   ${gCuilZeni}    ${gIdFinalidadCV}   ${gIdMotivoCV}
    THEN Evaluaciones Validar Cupo.Sistema debe visualizar todas las finalidades activas

### CIRCUITOS ####
FlujoOkCerealSinCupoSinWsAfip 
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN Tareas Validar Cupo.Ingresa Carta de porte      888811111117
    WHEN Tareas Validar Cupo.Selecciona Ingreso sin Cupo
        AND Tareas Validar Cupo.Ingresa Datos Documento  ${gIdSoja}  ${gCuilZeni}    ${gCuilZeni}    ${gCuilLDC}     ${gIdFinalidadCV}   ${gIdMotivoCV}
        AND Tareas Validar Cupo.Ingresa Datos CTG    1   1   ${gCuilTransportista}   ${gCuilChofer}  1
        AND Tareas Validar Cupo.Decide aceptar
        AND Tareas Asignar Tarjeta.Asigna Tarjeta  83
    THEN Evaluaciones Validar Cupo.Sistema debe informar el ingreso exitoso
        AND Evaluaciones Validar Cupo.Sistema debe guardar el movimiento Pendiente Control  83
        AND Evaluaciones Validar Cupo.Sistema debe volver al estado inicial de la pantalla

FlujoOkCerealConCupoSinWsAfip
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN Tareas Validar Cupo.Ingresa Carta de porte      888811111116
    WHEN Tareas Validar Cupo.Selecciona Ingreso con Cupo
        AND Tareas Validar Cupo.Ingresa Cupo   TMB-SOJ-20191212-5314
        AND Tareas Validar Cupo.Ingresa Datos CTG    1   1   ${gCuilTransportista}   ${gCuilChofer}  1
        AND Tareas Validar Cupo.Decide aceptar
        AND Tareas Asignar Tarjeta.Asigna Tarjeta   82
    THEN Evaluaciones Validar Cupo.Sistema debe informar el ingreso exitoso
        AND Evaluaciones Validar Cupo.Sistema debe guardar el movimiento Pendiente Control  82
        AND Evaluaciones Validar Cupo.Sistema debe volver al estado inicial de la pantalla

FlujoDejarPendiente
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN Tareas Validar Cupo.Ingresa Carta de porte      888811111118
        AND Tareas Validar Cupo.Selecciona Ingreso sin Cupo
        AND Tareas Validar Cupo.Ingresa Datos Documento  ${gIdSoja}  ${gCuilZeni}    ${gCuilZeni}    ${gCuilLDC}     ${gIdFinalidadCV}   ${gIdMotivoCV}
    WHEN Tareas Validar Cupo.Decide dejar pendiente el Cupo
        AND Tareas Dejar Cupo Pendiente.Acepta dejar pendiente el cupo  1  Prueba
    THEN Evaluaciones Validar Cupo.Sistema debe informar la accion dejar pendiente exitosa
        AND Evaluaciones Validar Cupo.Sistema debe guardar el movimiento Pendiente Cupo     888811111118
        AND Evaluaciones Validar Cupo.Sistema debe volver al estado inicial de la pantalla