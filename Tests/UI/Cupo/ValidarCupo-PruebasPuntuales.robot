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
Resource        ../../../Libraries Proxy/Selenium Proxy.robot
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

UsabilidadRecuperarDatoCupoAnterior
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN Tareas Validar Cupo.Ingresa Carta de porte     123412345678
        AND Tareas Validar Cupo.Selecciona Ingreso con Cupo
    WHEN Tareas Validar Cupo.Ingresa Cupo  TMB-SOJ-20191022-2985
    THEN Evaluaciones Validar Cupo.Sistema debe recuperar datos del cupo ingresado     TMB-SOJ-20191022-2985
        AND Evaluaciones Validar Cupo.Sistema debe informar cupo anterior o posterior
        AND Evaluaciones Validar Cupo.Sistema debe marcar el ingreso sin cupo

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
        AND Tareas Validar Cupo.Ingresa Datos Documento  ${gIdSoja}  ${gCuilLDC}    ${gCuilLDC}   ${gCuilZeni}    ${gIdFinalidadCV}   ${gIdMotivoCV}    ${gSedeCharata}
    THEN Evaluaciones Validar Cupo.Sistema debe visualizar todas las finalidades activas    ${gIdCircuitoDescargaCamionCerealTimbues}

UsabilidadYValidacionCupoUtilizado
    GIVEN Refrescar pagina
        AND Tareas Validar Cupo.Ingresa Carta de porte     123412345678
        AND Tareas Validar Cupo.Selecciona Ingreso con Cupo
    WHEN Tareas Validar Cupo.Ingresa Cupo  TMB-SOJ-20191022-2985
    THEN Evaluaciones Validar Cupo.Sistema debe informar que el cupo ya fue utilizado

##############################################################

### VALIDACIONES - ESTAN TODAS CONTEMPLADAS EN LOS CASOS DE PRUEBA (DDT)####
#ValidacionDatosObligatoriosSinCupo
#    GIVEN Refrescar pagina
#        AND Tareas Validar Cupo.Selecciona Ingreso sin Cupo
#    WHEN Tareas Validar Cupo.Decide aceptar
#        AND Tareas Asignar Tarjeta.Asigna Tarjeta  77
#    THEN Evaluaciones Validar Cupo.Sistema debe informar campos obligatorios sin cupo y sin WS AFIP

#ValidacionDatosObligatoriosConCupo
#    GIVEN Refrescar pagina
#        AND Tareas Validar Cupo.Ingresa Carta de porte     123412345678
#        AND Tareas Validar Cupo.Selecciona Ingreso con Cupo
#    WHEN Tareas Validar Cupo.Decide aceptar
#        AND Tareas Asignar Tarjeta.Asigna Tarjeta  77
#    THEN Evaluaciones Validar Cupo.Sistema debe informar campos obligatorios con cupo y sin WS AFIP

#ValidacionTarjetaEnUso
#    GIVEN Refrescar pagina
#        AND Tareas Validar Cupo.Ingresa Carta de porte      888811111119
#        AND Tareas Validar Cupo.Selecciona Ingreso sin Cupo
#        AND Tareas Validar Cupo.Ingresa Datos Documento  ${gIdSoja}  ${gCuilZeni}    ${gCuilZeni}    ${gCuilLDC}     ${gIdFinalidadCV}   ${gIdMotivoCV}     ${gSedeCharata}
#        AND Tareas Validar Cupo.Ingresa Datos CTG    1  ${gCuilTransportista}   ${gCuilChofer}  1
#        AND Tareas Validar Cupo.Ingresa codigo cancelacion CTG  1
#    WHEN Tareas Validar Cupo.Decide aceptar
#        AND Tareas Asignar Tarjeta.Asigna Tarjeta  96
#    THEN Evaluaciones Validar Cupo.Sistema debe informar tarjeta en uso

### CIRCUITOS - ESTAN TODOS CONTEMPLADOS EN LOS CASOS DE PRUEBA (DDT)####
#FlujoOkCerealSinCupoSinWsAfip 
#    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
#    [Teardown]  Disconnect From Database
#    GIVEN Tareas Validar Cupo.Deshabilita Accion WS Afip  ${gWorkstationGeneralTimbues}
#        AND Refrescar pagina
#    WHEN Tareas Validar Cupo.Ingresa Carta de porte      888811111119
#        AND Tareas Validar Cupo.Selecciona Ingreso sin Cupo
#        AND Tareas Validar Cupo.Ingresa Datos Documento  ${gIdSoja}  ${gCuilZeni}    ${gCuilZeni}    ${gCuilLDC}     ${gIdFinalidadCV}   ${gIdMotivoCV}     ${gSedeCharata}
#        AND Tareas Validar Cupo.Ingresa Datos CTG    1  ${gCuilTransportista}   ${gCuilChofer}  1
#        AND Tareas Validar Cupo.Ingresa codigo cancelacion CTG  1  
#        AND Tareas Validar Cupo.Decide aceptar
#        AND Tareas Asignar Tarjeta.Asigna Tarjeta  96
#    THEN Evaluaciones Validar Cupo.Sistema debe informar el ingreso exitoso
#        AND Evaluaciones Validar Cupo.Sistema debe guardar el movimiento Pendiente Control  96
#        AND Evaluaciones Validar Cupo.Sistema debe volver al estado inicial de la pantalla

#FlujoOkCerealSinCupoConWsAfipIncorrecto 
#    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
#    [Teardown]  Disconnect From Database
#    GIVEN Tareas Validar Cupo.Habilita Accion WS Afip  ${gWorkstationGeneralTimbues}
#        AND Refrescar pagina
#    WHEN Tareas Validar Cupo.Ingresa Carta de porte      888811111121
#        AND Tareas Validar Cupo.Selecciona Ingreso sin Cupo
#        AND Tareas Validar Cupo.Ingresa Datos Documento  ${gIdSoja}  ${gCuilZeni}    ${gCuilZeni}    ${gCuilLDC}     ${gIdFinalidadCV}   ${gIdMotivoCV}     ${gSedeCharata}
#        AND Tareas Validar Cupo.Ingresa Datos CTG    1  ${gCuilTransportista}   ${gCuilChofer}  1
#        AND Tareas Validar Cupo.Decide aceptar
#        AND Tareas Asignar Tarjeta.Asigna Tarjeta  81
#        Sleep   5
#        AND Tareas Validar Cupo.Ingresa codigo cancelacion CTG  1  
#        AND Tareas Validar Cupo.Decide aceptar
#    THEN Evaluaciones Validar Cupo.Sistema debe informar el ingreso exitoso
#        AND Evaluaciones Validar Cupo.Sistema debe guardar el movimiento Pendiente Control  81
#        AND Evaluaciones Validar Cupo.Sistema debe volver al estado inicial de la pantalla

#FlujoOkCerealConCupoSinWsAfip
#    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
#    [Teardown]  Disconnect From Database
#    GIVEN Tareas Validar Cupo.Deshabilita Accion WS Afip  ${gWorkstationGeneralTimbues}
#        AND Refrescar pagina
#    WHEN Tareas Validar Cupo.Ingresa Carta de porte      888811111123
#        AND Tareas Validar Cupo.Selecciona Ingreso con Cupo
#        AND Tareas Validar Cupo.Ingresa Cupo   TMB-SOJ-20191022-8866
#        AND Tareas Validar Cupo.Ingresa Datos CTG    1  ${gCuilTransportista}   ${gCuilChofer}  1
#        AND Tareas Validar Cupo.Ingresa codigo cancelacion CTG  1  
#        AND Tareas Validar Cupo.Decide aceptar
#        AND Tareas Asignar Tarjeta.Asigna Tarjeta   78
#    THEN Evaluaciones Validar Cupo.Sistema debe guardar el movimiento Pendiente Control  78
#        AND Evaluaciones Validar Cupo.Sistema debe marcar el cupo utilizado como Sin Cupo   TMB-SOJ-20191022-8866
#        AND Evaluaciones Validar Cupo.Sistema debe informar el ingreso exitoso
#        AND Evaluaciones Validar Cupo.Sistema debe volver al estado inicial de la pantalla

#FlujoDejarPendiente
#    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
#    [Teardown]  Disconnect From Database
#    GIVEN Tareas Validar Cupo.Ingresa Carta de porte      888811111118
#        AND Tareas Validar Cupo.Selecciona Ingreso sin Cupo
#        AND Tareas Validar Cupo.Ingresa Datos Documento  ${gIdSoja}  ${gCuilZeni}    ${gCuilZeni}    ${gCuilLDC}     ${gIdFinalidadCV}   ${gIdMotivoCV}     ${gSedeCharata}
#    WHEN Tareas Validar Cupo.Decide dejar pendiente el Cupo
#        AND Tareas Dejar Cupo Pendiente.Acepta dejar pendiente el cupo  1  Prueba
#    THEN Evaluaciones Validar Cupo.Sistema debe informar la accion dejar pendiente exitosa
#        AND Evaluaciones Validar Cupo.Sistema debe guardar el movimiento Pendiente Cupo     888811111118
#        AND Evaluaciones Validar Cupo.Sistema debe volver al estado inicial de la pantalla

