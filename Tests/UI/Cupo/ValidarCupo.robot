*** Settings ***
Resource        ../../../Tasks/Cupo/Validar Cupo.robot
Resource        ../../../Tasks/Login.robot
Resource        ../../../Tasks/Menu.robot
Resource        ../../../Global Definitions/Variables.robot
Resource        ../../../Global Definitions/Constantes.robot
Resource        ../../../Questions/Cupo/Validar Cupo.robot
Suite Setup     Run Keywords  Iniciar Aplicacion  ${gWebUrlUat}   ${gBrowserChrome}   ${gUser}    ${gContrasenia}     ${gIDTerminalTimbues}     AND     Ir a Validar Cupo
Suite Teardown  Cerrar Pantalla
Library         DatabaseLibrary

**Test Cases
#### USABILIDADES PARTICULARES####
UsabilidadEstadoInicial
    #GIVEN El usuario ingresa a validar camion
    THEN Tipo de producto debe ser Cereal
        AND Tipo documento porte debe ser Carta de Porte y estar deshabilitado
        AND Nro documento porte debe tener el foco

UsabilidadSeleccionOpcionConCupo
    GIVEN El usuario ingresa una carta de porte     123412345678
    WHEN El usuario selecciona el ingreso con Cupo
    THEN El sistema debe habilitar el ingreso del cupo

UsabilidadSeleccionOpcionSinCupo
    GIVEN El usuario ingresa una carta de porte     123412345678
    WHEN El usuario selecciona el ingreso sin Cupo
    THEN El sistema debe habilitar el ingreso sin cupo

UsabilidaSeleccionProductoEPA
    GIVEN El usuario ingresa una carta de porte     123412345678
        AND El usuario selecciona el ingreso sin Cupo
    WHEN El usuario ingresa producto    ${gIdSojaEpa}
    THEN El sistema debe habilitar el ingreso de datos EPA

UsabilidadSeleccionProductoNoEPA  
    GIVEN El usuario ingresa una carta de porte     123412345678
        AND El usuario selecciona el ingreso sin Cupo
    WHEN El usuario ingresa producto    ${gIdSoja}
    THEN El sistema debe deshabilitar el ingreso de datos EPA

UsabilidadRecuperarDatoDocumentoDeCupo
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN El usuario ingresa una carta de porte     123412345678
        AND El usuario selecciona el ingreso con Cupo
    WHEN El usuario ingresa el cupo  TMB-SOJ-20191016-4514
    THEN El sistema debe recuperar datos del cupo ingresado     TMB-SOJ-20191016-4514

### CIRCUITOS ####
FlujoOkCerealSinCupoSinWsAfip 
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN El usuario ingresa una carta de porte      888811111113
    WHEN El usuario selecciona el ingreso sin Cupo
        AND El usuario ingresa datos documento  ${gIdSoja}  ${gCuilZeni}    ${gCuilZeni}    ${gCuilLDC}     ${gIdFinalidadCV}   ${gIdMotivoCV}
        AND El usuario ingresa datos CTG    1   1   ${gCuilTransportista}   ${gCuilChofer}  1
        AND El usuario decide aceptar
        AND El usuario asigna Tarjeta   98
    THEN El sistema debe informar el ingreso exitoso
        AND El sistema debe guardar el movimiento   98
        AND El sistema debe volver al estado inical

FlujoOkCerealConCupoSinWsAfip
    [Setup]     Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    [Teardown]  Disconnect From Database
    GIVEN El usuario ingresa una carta de porte      888811111113
    WHEN El usuario selecciona el ingreso con Cupo
        AND El usuario ingresa el cupo   TMB-SOJ-20191016-4514
        AND El usuario ingresa datos CTG    1   1   ${gCuilTransportista}   ${gCuilChofer}  1
        AND El usuario decide aceptar
        AND El usuario asigna Tarjeta   98
    THEN El sistema debe informar el ingreso exitoso
        AND El sistema debe guardar el movimiento   98
        AND El sistema debe volver al estado inical