*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/Asignar Tarjeta.robot

*** Keywords ***
Ingresar Numero Tarjeta
    [Arguments]    ${NumeroTarjeta}
    ${txtTarjeta}    Capturar Elemento    ${locTxtTarjeta}
    Ingresar Texto    ${txtTarjeta}    ${NumeroTarjeta}
Presionar Aceptar
    ${btnAceptar}    Capturar Elemento    ${locBtnAceptarModal}
    Presionar Boton    ${btnAceptar}
Presionar Cancelar
    ${btnCancelar}    Capturar Elemento    ${locBtnCancelarModal}
    Presionar Boton    ${btnCancelar}