*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/ControlesValidarCupo.robot

*** Keywords ***
################# CIRCUITO ###################################
SeleccionarTipoProducto
    [Arguments]     ${IdTipoProducto}
    ${ddlTipoProducto}  Capturar Elemento  ${locDdlTipoProducto}
    Elegir Opcion Lista Por Valor  ${ddlTipoProducto}  ${IdTipoProducto}  

################################################################

################### DOCUMENTO DE PORTE #########################
SeleccionarTipoDocumentoPorte
    [Arguments] ${IdTipoDocumentoPorte}
    ${ddlTipoDocumentoPorte}  Capturar Elemento  ${locDdlTipoDocumentoPorte}
    Elegir Opcion Lista Por Valor  ${ddlTipoDocumentoPorte}  ${IdTipoDocumentoPorte} 
IngresarNumeroDocumentoPorte
    [Arguments]    ${NumeroDocumentoPorte}
    ${txtNumeroDocumentoPorte}    Capturar Elemento   ${locTxtNumeroDocumentoPorte}
    Ingresar Texto    ${txtNumeroDocumentoPorte}    ${NumeroDocumentoPorte}

##############################################################

##################### DATOS CUPO #############################
SeleccionarOpcionConCupo
    ${optConCupo}    Capturar Elemento    ${locOptConCupo}
    Presionar Boton  ${optConCupo}
IngresarCodigoCupo
    [Arguments]    ${NumeroCupo}
    ${txtCodigoCupo}    Capturar Elemento    ${locTxtCodigoCupo}
    Ingresar Texto    ${txtCodigoCupo}    ${NumeroCupo}
    Press Keys  ${txtCodigoCupo}  TAB
SeleccionarOpcionSinCupo
    ${optSinCupo}    Capturar Elemento    ${locOptSinCupo}
    Presionar Boton  ${optSinCupo}

#################################################################

################### DATOS DOCUMENTO #############################
IngresarProducto
    [Arguments]    ${CodigoProducto}
    ${txtProducto}    Capturar Elemento    ${locTxtProducto}
    Ingresar Texto    ${txtProducto}    ${CodigoProducto}
    Press Keys  ${locTxtProducto}  TAB
PresionarBusquedaAvanzadaProducto
    ${btnBuscarProducto}    Capturar Elemento    ${locBtnBuscarProducto}
    Presionar Boton    ${btnBuscarProducto}
IngresarVendedor
    [Arguments]    ${CuitVendedor}
    ${txtVendedor}    Capturar Elemento    ${locTxtVendedor}
    Ingresar Texto    ${txtVendedor}    ${CuitVendedor}
    Press Keys  ${txtVendedor}  TAB
PresionarBusquedaAvanzadaVendedor
    ${btnBuscarVendedor}    Capturar Elemento    ${locBtnBuscarVendedor}
    Presionar Boton    ${btnBuscarVendedor}
IngresarCorredor
    [Arguments]    ${CuitCorredor}
    ${txtCorredor}    Capturar Elemento    ${locTxtCorredor}
    Ingresar Texto    ${txtCorredor}    ${CuitCorredor}
    Press Keys  ${txtCorredor}  TAB
PresionarBusquedaAvanzadaCorredor
    ${btnBuscarCorredor}    Capturar Elemento    ${locBtnBuscarCorredor}
    Presionar Boton    ${btnBuscarCorredor}
IngresarDestinatario
    [Arguments]    ${CuitDestinatario}
    ${txtDestinatario}    Capturar Elemento    ${locTxtDestinatario}
    Ingresar Texto    ${txtDestinatario}    ${CuitDestinatario}
    Press Keys  ${txtDestinatario}  TAB
PresionarBusquedaAvanzadaDestinatario
    ${btnDestinatario}    Capturar Elemento    ${locBtnDestinatario}
    Presionar Boton    ${btnDestinatario}
SeleccionarFinalidad
    [Arguments]     ${IdFinalida}
    ${ddlFinalidad}  Capturar Elemento  ${locDdlFinalidad}
    Elegir Opcion Lista Por Valor  ${ddlFinalidad}  ${IdFinalida} 
SeleccionarMotivoCupo
    [Arguments]     ${IdMotivoCupo}
    ${ddlMotivoCupo}  Capturar Elemento  ${locDdlMotivoCupo}
    Elegir Opcion Lista Por Valor  ${ddlMotivoCupo}  ${IdMotivoCupo} 
IngresarSede
    [Arguments]     ${ValorABuscar}
    ${txtSedeOrigen}      Capturar Elemento  ${locTxtSedeOrigen}
    Ingresar Texto  ${txtSedeOrigen}   ${ValorABuscar}
    #Press Keys  ${txtSedeOrigen}  RETURN

#############################################################

################ CAMPO EPA ###################################
IngresarTitular
    [Arguments]    ${CuitTitular}
    ${txtTitular}    Capturar Elemento    ${locTxtTitular}
    Ingresar Texto    ${txtTitular}    ${CuitTitular}
    Press Keys  ${txtTitular}  TAB
PresionarBusquedaAvanzadaTitular
    ${btnBuscarTitular}    Capturar Elemento    ${locBtnBuscarTitular}
    Presionar Boton    ${btnBuscarTitular}
SeleccionarCampoEPA
    [Arguments] ${IdCampoEPA}
    ${ddlCampoEPA}  Capturar Elemento  ${locDdlCampoEPA}
    Elegir Opcion Lista Por Valor  ${ddlCampoEPA}  ${IdCampoEPA} 
SeleccionarCosecha
    [Arguments] ${IdCosecha}
    ${ddlCosecha}  Capturar Elemento  ${locDdlCosecha}
    Elegir Opcion Lista Por Valor  ${ddlCosecha}  ${IdCosecha} 
IngresarProcedencia
    [Arguments]    ${Procedencia}
    ${txtProcedencia}    Capturar Elemento    ${locTxtProcedencia}
    Ingresar Texto    ${txtProcedencia}    ${Procedencia}

#################################################################

###########  CTG  ###############################################
IngresarCTG
    [Arguments]    ${NumeroCTG}
    ${txtCTG}    Capturar Elemento    ${locTxtCTG}
    Ingresar Texto    ${txtCTG}    ${NumeroCTG}
IngresarTransportista
    [Arguments]    ${CuitTransportista}
    ${txtTransportista}    Capturar Elemento    ${locTxtTransportista}
    Ingresar Texto    ${txtTransportista}    ${CuitTransportista}
    Press Keys  ${txtTransportista}  TAB
PresionarBusquedaAvanzadaTransportista
    ${btnBuscarTransportista}    Capturar Elemento    ${locBtnBuscarTransportista}
    Presionar Boton    ${btnBuscarTransportista}
IngresarCodigoCancelacionCTG
    [Arguments]    ${CodigoCancelacionCTG} 
    ${txtCodigoCancelacionCTG}    Capturar Elemento    ${locTxtCodigoCancelacionCTG}
    Ingresar Texto    ${txtCodigoCancelacionCTG}    ${CodigoCancelacionCTG}
IngresarChofer
    [Arguments]    ${DocumentoChofer}
    ${txtChofer}    Capturar Elemento    ${locTxtChofer}
    Ingresar Texto    ${txtChofer}    ${DocumentoChofer}
    Press Keys  ${txtChofer}  TAB
PresionarBusquedaAvanzadaChofer
    ${btnBuscarChofer}    Capturar Elemento    ${locBtnBuscarChofer}
    Presionar Boton    ${btnBuscarChofer}
SeleccionarSinConfirmacionCTG
    ${chkSinConfirmarCTG}    Capturar Elemento    ${locChkSinConfirmarCTG}
    Presionar Boton  ${optCchkSinConfirmarCTGonCupo}
IngresarKGNetos
    [Arguments]    ${KilosNeto}
    ${txtKgNeto}    Capturar Elemento    ${locTxtKgNeto}
    Ingresar Texto    ${txtKgNeto}    ${KilosNeto}
########################################################

############### ACCIONES ##############################
PresionarAceptar
    ${btnAceptar}    Capturar Elemento    ${locBtnAceptar}
    Presionar Boton    ${btnAceptar}
PresionarCancelar
    ${btnCancelar}    Capturar Elemento    ${locBtnCancelar}
    Presionar Boton    ${btnCancelar}
PresionarDejarPendiente
    ${btnDejarPendiente}    Capturar Elemento    ${locBtnDejarPendiente}
    Presionar Boton    ${btnDejarPendiente}
PresionarConsultarDatosAFIP
    ${btnConsultarDatosAFIP}    Capturar Elemento    ${locBtnConsultarDatosAFIP}
    Presionar Boton    ${btnConsultarDatosAFIP}
#######################################################