*** Settings ***
Resource        ../../Actions/Cupo/Acciones Validar Cupo.robot
Resource        ../Menu.robot

*** Keywords ***
Ingresa Carta de porte
    [Arguments]     ${NroDocPorte}
    Acciones Validar Cupo.Ingresar Numero Documento Porte  ${NroDocPorte}

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
    [Arguments]     ${aCodProducto}    ${aCuilVendedor}    ${aCuilCorredor}    ${aCuilDestinatario}    ${aIdFinalidad}   ${aIdMotivo}
    Acciones Validar Cupo.Ingresar Producto   ${aCodProducto}
    Acciones Validar Cupo.Ingresar Vendedor   ${aCuilVendedor}
    Acciones Validar Cupo.Ingresar Corredor   ${aCuilCorredor}
    Acciones Validar Cupo.Ingresar Destinatario   ${aCuilDestinatario}
    Acciones Validar Cupo.Seleccionar Finalidad   ${aIdFinalidad}
    Acciones Validar Cupo.Seleccionar Motivo Cupo     ${aIdMotivo}

Ingresa Datos CTG
    [Arguments]     ${aCTG}     ${aCodCancCTG}  ${aCuilTransportista}   ${aCuilChofer}  ${aKgNetos}
    Acciones Validar Cupo.Ingresar CTG  ${aCTG}
    Acciones Validar Cupo.Ingresar Codigo Cancelacion CTG  ${aCodCancCTG}
    Acciones Validar Cupo.Ingresar Transportista  ${aCuilTransportista}
    Acciones Validar Cupo.Ingresar Chofer  ${aCuilChofer}
    Acciones Validar Cupo.Ingresar KG Netos  ${aKgNetos}

Decide aceptar
    Acciones Validar Cupo.Presionar Aceptar

Va a la busqueda avanzada de Producto
    Presionar Busqueda Avanzada Producto