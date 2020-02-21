**Variables
#Circuito
${locDdlTipoProducto}  id:selectTipoProducto
#Documento Porte
${locDdlTipoDocumentoPorte}  id:selectTipoDocumentoPorte
${locTxtNumeroDocumentoPorte}  xpath://*[@id="validarCupoSection"]/form/yrd-documento-porte/fieldset/div[1]/div[2]/yrd-texto-mascara-con-etiqueta/div/div/input
#Datos Cupo
${locOptConCupo}   id:radioConCupo
${locTxtCodigoCupo}    xpath://*[@id="validarCupoSection"]/form/yrd-cupo/fieldset/div/div[2]/yrd-texto-mascara-con-etiqueta/div/div/input
${locOptSinCupo}   id:radioSinCupo
${locTxtUsuarioSAN}    xpath://*[@id="validarCupoSection"]/form/yrd-cupo/fieldset/div/div[4]/yrd-texto-con-etiqueta/div/div/input
#Datos Documento
${locTxtProducto}  id:inputCodigoProducto
${locBtnBuscarProducto}    xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/div[1]/div[1]/yrd-buscador-producto/div/div/div/div[1]/button
${loclblDescripcionProducto}    xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/div[1]/div[1]/yrd-buscador-producto/div/strong
${locTxtVendedor}  id:inputVendedor
${locBtnBuscarVendedor}    xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/div[1]/div[2]/yrd-buscador-vendedor/div/div/div/div[1]/button
${locTxtCorredor}  id:inputCorredor
${locBtnBuscarCorredor}    xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/div[2]/div[1]/yrd-buscador-corredor/div/div/div/div[1]/button
${locTxtDestinatario}  id:inputDestinatario
${locBtnDestinatario}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/div[2]/div[2]/yrd-buscador-destinatario/div/div/div/div[1]/button
${locDdlFinalidad}     id:selectFinalidad
${locDdlMotivoCupo}    id:selectMotivoCupo
${locTxtSedeOrigen}    xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/div[4]/div/yrd-autocomplete/div/div/input
#Campo EPA
${locTxtTitular}   id:inputTitular
${locBtnBuscarTitular}     xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/fieldset/div[1]/div[1]/yrd-buscador-titular/div/div/div/div[1]/button
${locDdlCampoEPA}  id:selectCampoEpaSustentable
${locDdlCosecha}   id:selectCosecha
${locTxtProcedencia}   xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/fieldset/div[2]/div[2]/yrd-autocomplete-localidad/div/div/input
#Estado Cupo
${locTxtVigenteTotal}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[2]/div[1]/yrd-texto-con-etiqueta/div/div/input
${locTxtVigenteOtorgado}   xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[2]/div[3]/yrd-numero-con-etiqueta/div/div/input
${locTxtVigenteIngresado}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[2]/div[4]/yrd-numero-con-etiqueta/div/div/input
${locTxtVigenteSaldo}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[2]/div[5]/yrd-numero-con-etiqueta/div/div/input
${locTxtAnteriorTotal}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[3]/div[1]/yrd-texto-con-etiqueta/div/div/input
${locTxtAnteriorOtorgado}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[3]/div[3]/yrd-numero-con-etiqueta/div/div/input
${locTxtAnteriorIngresado}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[3]/div[4]/yrd-numero-con-etiqueta/div/div/input
${locTxtAnteriorSaldo}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[3]/div[5]/yrd-numero-con-etiqueta/div/div/input
${locTxtSiguienteTotal}    xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[4]/div[1]/yrd-texto-con-etiqueta/div/div/input
${locTxtSiguienteOtorgado}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[4]/div[3]/yrd-numero-con-etiqueta/div/div/input
${locTxtSiguienteIngresado}    xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[4]/div[4]/yrd-numero-con-etiqueta/div/div/input
${locTxtSiguienteSaldo}    xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[4]/div[5]/yrd-numero-con-etiqueta/div/div/input
${locTxtSinCupoTotal}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-estado-cupo/fieldset/div[5]/div[4]/yrd-numero-con-etiqueta/div/div/input
${chkCupo}   xpath://*[@id="inputCheckbox"]
#CTG
${locTxtCTG}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-confirmacion-arribo-ctg/fieldset/div[1]/div[1]/yrd-numero-con-etiqueta/div/div/input
${locTxtTransportista}  id:inputTransportista
${locBtnBuscarTransportista}   xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-confirmacion-arribo-ctg/fieldset/div[1]/div[2]/yrd-buscador-transportista/div/div/div/div[1]/button
${locTxtCodigoCancelacionCTG}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-confirmacion-arribo-ctg/fieldset/div[2]/div[1]/yrd-numero-con-etiqueta/div/div/input
${locTxtChofer}    id:inputChofer
${locBtnBuscarChofer}  xpath://*[@id="validarCupoSection"]/form/yrd-datos-documento-validar-cupo/fieldset/yrd-confirmacion-arribo-ctg/fieldset/div[2]/div[2]/yrd-buscador-chofer/div/div/div/div[1]/button
${locChkSinConfirmarCTG}   xpath://*[@id="inputCheckbox"]
${locTxtKgNeto}    id:kgNeto
#Acciones
${locBtnAceptar}   xpath://*[@id="validarCupoSection"]/div/div[2]/button[1]
${locBtnCancelar}  xpath://*[@id="validarCupoSection"]/div/div[2]/button[2]
${locBtnDejarPendiente}    xpath://*[@id="validarCupoSection"]/div/div[1]/button[1]
${locBtnConsultarDatosAFIP}    xpath://*[@id="validarCupoSection"]/div/div[1]/button[2]

${locDdlSedeOrigen}     xpath://*[@id="ngb-typeahead-0"]

