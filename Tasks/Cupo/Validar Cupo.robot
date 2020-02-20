*** Settings ***
Resource        ../../Actions/Cupo/Validar Cupo.robot
Resource        ../../Actions/Cupo/Asignar Tarjeta.robot
Resource        ../Menu.robot

*** Keywords ***
El usuario ingresa una carta de porte
    [Arguments]     ${NroDocPorte}
    Ingresar Numero Documento Porte  ${NroDocPorte}

El usuario selecciona el ingreso con Cupo
    Seleccionar Opcion Con Cupo

El usuario ingresa el cupo
    [Arguments]     ${aNroCupo}
    Ingresar Codigo Cupo    ${aNroCupo}

El usuario selecciona el ingreso sin Cupo
    Seleccionar Opcion Sin Cupo    

El usuario ingresa producto
    [Arguments]     ${aIdProducto}
    Ingresar Producto  ${aIdProducto}

El usuario ingresa datos documento
    [Arguments]     ${aCodProducto}    ${aCuilVendedor}    ${aCuilCorredor}    ${aCuilDestinatario}    ${aIdFinalidad}   ${aIdMotivo}
    Ingresar Producto   ${aCodProducto}
    Ingresar Vendedor   ${aCuilVendedor}
    Ingresar Corredor   ${aCuilCorredor}
    Ingresar Destinatario   ${aCuilDestinatario}
    Seleccionar Finalidad   ${aIdFinalidad}
    Seleccionar Motivo Cupo     ${aIdMotivo}

El usuario ingresa datos CTG
    [Arguments]     ${aCTG}     ${aCodCancCTG}  ${aCuilTransportista}   ${aCuilChofer}  ${aKgNetos}
    Ingresar CTG  ${aCTG}
    Ingresar Codigo Cancelacion CTG  ${aCodCancCTG}
    Ingresar Transportista  ${aCuilTransportista}
    Ingresar Chofer  ${aCuilChofer}
    Ingresar KG Netos  ${aKgNetos}

El usuario decide aceptar
    Validar Cupo.Presionar Aceptar

El usuario asigna Tarjeta
    [Arguments]     ${aNroTarjeta}
    Ingresar Numero Tarjeta  ${aNroTarjeta}
    Asignar Tarjeta.Presionar Aceptar