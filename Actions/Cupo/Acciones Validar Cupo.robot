*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/Controles Validar Cupo.robot

*** Keywords ***
################# CIRCUITO ###################################
Seleccionar Tipo Producto
    [Arguments]     ${IdTipoProducto}
    ${ddlTipoProducto}  Capturar Elemento  ${locDdlTipoProducto}
    Elegir Opcion Lista Por Valor  ${ddlTipoProducto}  ${IdTipoProducto}  

################################################################

################### DOCUMENTO DE PORTE #########################
Seleccionar Tipo Documento Porte
    [Arguments] ${IdTipoDocumentoPorte}
    ${ddlTipoDocumentoPorte}  Capturar Elemento  ${locDdlTipoDocumentoPorte}
    Elegir Opcion Lista Por Valor  ${ddlTipoDocumentoPorte}  ${IdTipoDocumentoPorte} 
Ingresar Numero Documento Porte
    [Arguments]    ${NumeroDocumentoPorte}
    ${txtNumeroDocumentoPorte}    Capturar Elemento   ${locTxtNumeroDocumentoPorte}
    Ingresar Texto    ${txtNumeroDocumentoPorte}    ${NumeroDocumentoPorte}

##############################################################

##################### DATOS CUPO #############################
Seleccionar Opcion Con Cupo
    ${optConCupo}    Capturar Elemento    ${locOptConCupo}
    Presionar Boton  ${optConCupo}
Ingresar Codigo Cupo
    [Arguments]    ${NumeroCupo}
    ${txtCodigoCupo}    Capturar Elemento    ${locTxtCodigoCupo}
    Ingresar Texto    ${txtCodigoCupo}    ${NumeroCupo}
    Press Keys  ${txtCodigoCupo}  TAB
Seleccionar Opcion Sin Cupo
    ${optSinCupo}    Capturar Elemento    ${locOptSinCupo}
    Presionar Boton  ${optSinCupo}

#################################################################

################### DATOS DOCUMENTO #############################
Ingresar Producto
    [Arguments]    ${CodigoProducto}
    ${txtProducto}    Capturar Elemento    ${locTxtProducto}
    Ingresar Texto    ${txtProducto}    ${CodigoProducto}
    Press Keys  ${locTxtProducto}  TAB
Presionar Busqueda Avanzada Producto
    ${btnBuscarProducto}    Capturar Elemento    ${locBtnBuscarProducto}
    Presionar Boton    ${btnBuscarProducto}
Ingresar Vendedor
    [Arguments]    ${CuitVendedor}
    ${txtVendedor}    Capturar Elemento    ${locTxtVendedor}
    Ingresar Texto    ${txtVendedor}    ${CuitVendedor}
    Press Keys  ${txtVendedor}  TAB
Presionar Busqueda Avanzada Vendedor
    ${btnBuscarVendedor}    Capturar Elemento    ${locBtnBuscarVendedor}
    Presionar Boton    ${btnBuscarVendedor}
Ingresar Corredor
    [Arguments]    ${CuitCorredor}
    ${txtCorredor}    Capturar Elemento    ${locTxtCorredor}
    Ingresar Texto    ${txtCorredor}    ${CuitCorredor}
    Press Keys  ${txtCorredor}  TAB
Presionar Busqueda Avanzada Corredor
    ${btnBuscarCorredor}    Capturar Elemento    ${locBtnBuscarCorredor}
    Presionar Boton    ${btnBuscarCorredor}
Ingresar Destinatario
    [Arguments]    ${CuitDestinatario}
    ${txtDestinatario}    Capturar Elemento    ${locTxtDestinatario}
    Ingresar Texto    ${txtDestinatario}    ${CuitDestinatario}
    Press Keys  ${txtDestinatario}  TAB
Presionar Busqueda Avanzada Destinatario
    ${btnDestinatario}    Capturar Elemento    ${locBtnDestinatario}
    Presionar Boton    ${btnDestinatario}
Seleccionar Finalidad
    [Arguments]     ${IdFinalida}
    ${ddlFinalidad}  Capturar Elemento  ${locDdlFinalidad}
    Elegir Opcion Lista Por Valor  ${ddlFinalidad}  ${IdFinalida} 
Seleccionar Motivo Cupo
    [Arguments]     ${IdMotivoCupo}
    ${ddlMotivoCupo}  Capturar Elemento  ${locDdlMotivoCupo}
    Elegir Opcion Lista Por Valor  ${ddlMotivoCupo}  ${IdMotivoCupo} 
Ingresar Sede
    [Arguments]     ${valorABuscar}
    ${txtSedeOrigen}      Capturar Elemento  ${locTxtSedeOrigen}
    Ingresar Texto  ${txtSedeOrigen}   ${valorABuscar}
    #Press Keys  ${txtSedeOrigen}  RETURN

#############################################################

################ CAMPO EPA ###################################
Ingresar Titular
    [Arguments]    ${CuitTitular}
    ${txtTitular}    Capturar Elemento    ${locTxtTitular}
    Ingresar Texto    ${txtTitular}    ${CuitTitular}
    Press Keys  ${txtTitular}  TAB
Presionar Busqueda Avanzada Titular
    ${btnBuscarTitular}    Capturar Elemento    ${locBtnBuscarTitular}
    Presionar Boton    ${btnBuscarTitular}
Seleccionar Campo EPA
    [Arguments] ${IdCampoEPA}
    ${ddlCampoEPA}  Capturar Elemento  ${locDdlCampoEPA}
    Elegir Opcion Lista Por Valor  ${ddlCampoEPA}  ${IdCampoEPA} 
Seleccionar Cosecha
    [Arguments] ${IdCosecha}
    ${ddlCosecha}  Capturar Elemento  ${locDdlCosecha}
    Elegir Opcion Lista Por Valor  ${ddlCosecha}  ${IdCosecha} 
Ingresar Procedencia
    [Arguments]    ${Procedencia}
    ${txtProcedencia}    Capturar Elemento    ${locTxtProcedencia}
    Ingresar Texto    ${txtProcedencia}    ${Procedencia}

#################################################################

###########  CTG  ###############################################
Ingresar CTG
    [Arguments]    ${NumeroCTG}
    ${txtCTG}    Capturar Elemento    ${locTxtCTG}
    Ingresar Texto    ${txtCTG}    ${NumeroCTG}
Ingresar Transportista
    [Arguments]    ${CuitTransportista}
    ${txtTransportista}    Capturar Elemento    ${locTxtTransportista}
    Ingresar Texto    ${txtTransportista}    ${CuitTransportista}
    Press Keys  ${txtTransportista}  TAB
Presionar Busqueda Avanzada Transportista
    ${btnBuscarTransportista}    Capturar Elemento    ${locBtnBuscarTransportista}
    Presionar Boton    ${btnBuscarTransportista}
Ingresar Codigo Cancelacion CTG
    [Arguments]    ${CodigoCancelacionCTG} 
    ${txtCodigoCancelacionCTG}    Capturar Elemento    ${locTxtCodigoCancelacionCTG}
    Ingresar Texto    ${txtCodigoCancelacionCTG}    ${CodigoCancelacionCTG}
Ingresar Chofer
    [Arguments]    ${documentoChofer}
    ${txtChofer}    Capturar Elemento    ${locTxtChofer}
    Ingresar Texto    ${txtChofer}    ${documentoChofer}
    Press Keys  ${txtChofer}  TAB
Presionar Busqueda Avanzada Chofer
    ${btnBuscarChofer}    Capturar Elemento    ${locBtnBuscarChofer}
    Presionar Boton    ${btnBuscarChofer}
Seleccionar Sin Confirmacion CTG
    ${chkSinConfirmarCTG}    Capturar Elemento    ${locChkSinConfirmarCTG}
    Presionar Boton  ${optCchkSinConfirmarCTGonCupo}
Ingresar KG Netos
    [Arguments]    ${KilosNeto}
    ${txtKgNeto}    Capturar Elemento    ${locTxtKgNeto}
    Ingresar Texto    ${txtKgNeto}    ${KilosNeto}
########################################################

############### ACCIONES ##############################
Presionar Aceptar
    ${btnAceptar}    Capturar Elemento    ${locBtnAceptar}
    Presionar Boton    ${btnAceptar}
Presionar Cancelar
    ${btnCancelar}    Capturar Elemento    ${locBtnCancelar}
    Presionar Boton    ${btnCancelar}
Presionar Dejar Pendiente
    ${btnDejarPendiente}    Capturar Elemento    ${locBtnDejarPendiente}
    Presionar Boton    ${btnDejarPendiente}
Presionar Consultar datos AFIP
    ${btnConsultarDatosAFIP}    Capturar Elemento    ${locBtnConsultarDatosAFIP}
    Presionar Boton    ${btnConsultarDatosAFIP}
#######################################################