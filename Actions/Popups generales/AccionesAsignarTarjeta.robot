*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Popups generales/ControlesAsignarTarjeta.robot

*** Keywords ***
IngresarNumeroTarjeta
    [Arguments]    ${NumeroTarjeta}
    ${txtTarjeta}    Capturar Elemento    ${locTxtTarjeta}
    Ingresar Texto    ${txtTarjeta}    ${NumeroTarjeta}
PresionarAceptar
    ${btnAceptar}    Capturar Elemento    ${locBtnAceptarModal}
    Presionar Boton    ${btnAceptar}
PresionarCancelar
    ${btnCancelar}    Capturar Elemento    ${locBtnCancelarModal}
    Presionar Boton    ${btnCancelar}