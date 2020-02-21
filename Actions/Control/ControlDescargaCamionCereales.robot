**Settings
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Control/ControlDescargaCamionCereales.robot


**Keywords
Ingresar Numero Documento Porte
    [Arguments]     ${aNumeroDocumento}
    ${txtNumeroDocumentoPorte}  Capturar Elemento   ${locTxtNumeroDocumentoPorte}
    Ingresar Texto  ${txtNumeroDocumentoPorte}  ${aNumeroDocumento}

Ingresar CEE    
    [Arguments]     ${aCEE} 
    ${txtCEE}   Capturar Elemento  ${locTxtCEE}    
    Ingresar Texto  ${txtCEE}  ${aCEE}   

Ingresar CTG
    [Arguments]     ${aCTG} 
    ${txtCTG}    Capturar Elemento  ${locTxtCTG}    
    Ingresar Texto  ${txtCTG}   ${aCTG} 


Ingresar Fecha Vencimiento  
    [Arguments]     ${aFechaVencimiento}    
    ${TxtFechaVencimiento}   Capturar Elemento  ${locTxtFechaVencimiento}   
    Ingresar Texto  ${TxtFechaVencimiento}    ${aFechaVencimiento}  

Ingresar Titular
    [Arguments]     ${aTitular} 
    ${txtTitular}    Capturar Elemento  ${locTxtTitular}    
    Ingresar Texto  ${txtTitular}     ${aTitular}    

Ingresar Corredor Comprador
    [Arguments]     ${aCorredorComprador}   
    ${txtCorredorComprador}  Capturar Elemento  ${locTxtCorredorComprador}  
    Ingresar Texto  ${txtCorredorComprador}  ${aCorredorComprador}

Ingresar Transportista
    [Arguments]     ${aTransportista}   
    ${txtTransportista}  Capturar Elemento  ${locTxtTransportista}  
    Ingresar Texto  ${txtTransportista}    ${aTransportista}

Ingresar Chofer
    [Arguments]     ${aChofer}  
    ${txtChofer}    Capturar Elemento  ${locTxtChofer} 
    Ingresar Texto  ${txtChofer}     ${aChofer}  

Ingresar Producto
    [Arguments]     ${aProducto}      
    ${txtProducto}   Capturar Elemento  ${locTxtProducto}    
    Ingresar Texto  ${txtProducto}      ${aProducto}
    Press Keys  ${txtProducto}    TAB

Ingresar Localidad
    [Arguments]     ${aLocalidad}  
    ${txtLocalidad}  Capturar Elemento  ${locTxtLocalidad}  
    Ingresar Texto  ${txtLocalidad}  ${aLocalidad}   
    Sleep  5 
    Press Keys    ${txtLocalidad}    TAB   
     
Ingresar Patente
    [Arguments]     ${aPatenteCamion}    
    ${txtPatenteCamion}  Capturar Elemento  ${locTxtPatenteCamion}   
    Ingresar Texto  ${txtPatenteCamion}     ${aPatenteCamion}

Ingresar Patente Acoplado
    [Arguments]     ${aPatenteAcoplado}
    ${txtPatenteAcoplado}    Capturar Elemento  ${locTxtPatenteAcoplado}     
    Ingresar Texto  ${txtPatenteAcoplado}       ${aPatenteAcoplado}

Ingresar Kilometros Recorridos
    [Arguments]     ${aKmRecorridos}  
    ${txtKmRecorridos}    Capturar Elemento  ${locTxtKmRecorridos} 
    Ingresar Texto  ${txtKmRecorridos}    ${aKmRecorridos}

Ingresar Tarifa Referencial
    [Arguments]     ${aTarifaReferencial}  
    ${txtTarifaReferencial}  Capturar Elemento  ${locTxtTarifaReferencial}   
    Ingresar Texto  ${txtTarifaReferencial}     ${aTarifaReferencial}     

Ingresar Tarifa Tonelada
    [Arguments]     ${aTarifaTN}  
    ${txtTarifaTN}    Capturar Elemento  ${locTxtTarifaTN} 
    Ingresar Texto  ${txtTarifaTN}    ${aTarifaTN}  


Ingresar Codigo de cancelacion
    [Arguments]     ${aCodigoCancelacionCTG}  
    ${txtCodigoCancelacionCTG}    Capturar Elemento  ${locTxtCodigoCancelacionCTG} 
    Ingresar Texto  ${txtCodigoCancelacionCTG}     ${aCodigoCancelacionCTG}  

Presionar Dejar Pendiente
    ${btnDejarPendiente}   Capturar Elemento  ${locBtnDejarPendiente}
    Presionar Boton  ${btnDejarPendiente}

Presionar Consultar AFIP
    ${btnConsultarAFIP}   Capturar Elemento  ${locBtnConsultarAFIP} 
    Presionar Boton  ${btnConsultarAFIP}    

Presionar Cerrar AFIP
    ${btnCerrarAFIP}    Capturar Elemento  ${locBtnCerrarAFIP}
    Presionar Boton  ${btnCerrarAFIP}

Presionar Aceptar
    ${btnAceptar}   Capturar Elemento  ${locBtnAceptar}
    Presionar Boton  ${btnAceptar}

Presionar Cancelar
    ${btnCancelar}  Capturar Elemento  ${locBtnCancelar}
    Presionar Boton  ${btnCancelar}

Presionar Aceptar Tarjeta
    ${btnAceptarTarjeta}    Capturar Elemento  ${locBtnAceptarTarjeta}
    Presionar Boton  ${btnAceptarTarjeta}   

Presionar Cancelar Tarjeta
    ${btnCancelarTarjeta}   Capturar Elemento  ${locBtnCancelarTarjeta}
    Presionar Boton  ${locBtnCancelarTarjeta}   


