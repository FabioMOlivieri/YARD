*** Settings ***
Resource        ../../Actions/Cupo/Acciones Validar Cupo.robot
Resource        ../../Global Definitions/Constantes.robot
Resource        ../Menu.robot
Library         DatabaseLibrary

*** Keywords ***
Ingresa Carta de porte
    [Arguments]     ${NroDocPorte}
    Run Keyword If  '${NroDocPorte}' is not '${Empty}'  Acciones Validar Cupo.Ingresar Numero Documento Porte  ${NroDocPorte}

Selecciona Ingreso con Cupo
    Acciones Validar Cupo.Seleccionar Opcion Con Cupo

Ingresa Cupo
    [Arguments]     ${aNroCupo}
    Acciones Validar Cupo.Ingresar Codigo Cupo    ${aNroCupo}

Selecciona Ingreso sin Cupo
    Acciones Validar Cupo.Seleccionar Opcion Sin Cupo    

Ingresa Producto
    [Arguments]     ${aIdProducto}
    Acciones Validar Cupo.Ingresar Producto  ${aIdProducto}

Ingresa Datos Documento
    [Arguments]     ${aCodProducto}    ${aCuilVendedor}    ${aCuilCorredor}    ${aCuilDestinatario}    ${aIdFinalidad}   ${aIdMotivo}   ${aIdSede}
    Run Keyword If  '${aCodProducto}' is not '${Empty}'  Acciones Validar Cupo.Ingresar Producto   ${aCodProducto}
    Run Keyword If  '${aCuilVendedor}' is not '${Empty}'  Acciones Validar Cupo.Ingresar Vendedor   ${aCuilVendedor}
    Run Keyword If  '${aCuilCorredor}' is not '${Empty}'  Acciones Validar Cupo.Ingresar Corredor   ${aCuilCorredor}
    Run Keyword If  '${aCuilDestinatario}' is not '${Empty}'  Acciones Validar Cupo.Ingresar Destinatario   ${aCuilDestinatario}
    Run Keyword If  '${aIdFinalidad}' is not '${Empty}'  Acciones Validar Cupo.Seleccionar Finalidad   ${aIdFinalidad}
    Run Keyword If  '${aIdFinalidad}' is not '${Empty}' and '${aIdMotivo}' is not '${Empty}'  Acciones Validar Cupo.Seleccionar Motivo Cupo     ${aIdMotivo}
    Run Keyword If  '${aCuilVendedor}' is not '${Empty}' and '${aIdSede}' is not '${Empty}' and '${aCuilVendedor}' == '${gCuilLDC}'  Acciones Validar Cupo.Ingresar Sede  ${aIdSede}

Ingresa Datos CTG
    [Arguments]     ${aCTG}     ${aCuilTransportista}   ${aCuilChofer}  ${aKgNetos}
    Run Keyword If  '${aCTG}' is not '${Empty}'  Acciones Validar Cupo.Ingresar CTG  ${aCTG}
    Run Keyword If  '${aCuilTransportista}' is not '${Empty}'  Acciones Validar Cupo.Ingresar Transportista  ${aCuilTransportista}
    Run Keyword If  '${aCuilChofer}' is not '${Empty}'  Acciones Validar Cupo.Ingresar Chofer  ${aCuilChofer}
    Run Keyword If  '${aKgNetos}' is not '${Empty}'  Acciones Validar Cupo.Ingresar KG Netos  ${aKgNetos}

Ingresa codigo cancelacion CTG
    [Arguments]     ${aCodCancCTG}
    Acciones Validar Cupo.Ingresar Codigo Cancelacion CTG  ${aCodCancCTG}

Decide aceptar
    Acciones Validar Cupo.Presionar Aceptar

Va a la busqueda avanzada de Producto
    Acciones Validar Cupo.Presionar Busqueda Avanzada Producto

Realiza Busqueda Rapida Sede
    [Arguments]     ${valor}
    Acciones Validar Cupo.Ingresar Sede     ${valor}

Decide dejar pendiente el Cupo
    Acciones Validar Cupo.Presionar Dejar Pendiente

Deshabilita Accion WS Afip
    [Arguments]     ${IdPuestoTrabajo}
    ${UpdateOutput}=    Execute Sql String    UPDATE T_WORKSTATION_ACTION_MODE SET IS_AUTOMATIC = 0 WHERE ID_WORKSTATION = ${IdPuestoTrabajo} AND ID_ACTION = 7;
    Should Be Equal As Strings    ${UpdateOutput}    None

Habilita Accion WS Afip
    [Arguments]     ${IdPuestoTrabajo}
    ${UpdateOutput}=    Execute Sql String    UPDATE T_WORKSTATION_ACTION_MODE SET IS_AUTOMATIC = 1 WHERE ID_WORKSTATION = ${IdPuestoTrabajo} AND ID_ACTION = 7;
    Should Be Equal As Strings    ${UpdateOutput}    None

Deshabilita Accion Uso Tarjeta
    [Arguments]     ${IdPuestoTrabajo}
    ${UpdateOutput}=    Execute Sql String    UPDATE T_WORKSTATION_ACTION_MODE SET IS_ENABLED = 0 WHERE ID_WORKSTATION = ${IdPuestoTrabajo} and ID_ACTION = 6;
    Should Be Equal As Strings    ${UpdateOutput}    None

Habilita Accion Uso Tarjeta
    [Arguments]     ${IdPuestoTrabajo}
    ${UpdateOutput}=    Execute Sql String    UPDATE T_WORKSTATION_ACTION_MODE SET IS_ENABLED = 1 WHERE ID_WORKSTATION = ${IdPuestoTrabajo} and ID_ACTION = 6;
    Should Be Equal As Strings    ${UpdateOutput}    None
