*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/ControlesDejarCupoPendiente.robot

*** Keywords ***
IngresarObservacion
    [Arguments]    ${Observacion}
    ${txtObservacion}    Capturar Elemento    ${locTxtObservacion}
    Ingresar Texto    ${txtObservacion}    ${Observacion}

SeleccionarMotivo
    [Arguments]     ${IdMotivo}
    ${ddlMotivo}    Capturar Elemento   ${locDdlMotivo}
    Elegir Opcion Lista Por Valor  ${ddlMotivo}   ${IdMotivo}

PresionarAceptar
    ${btnAceptar}   Capturar Elemento   ${locBtnAceptarPendiente}
    Presionar Boton  ${btnAceptar}

PresionarCancelar
    ${btnCancelar}   Capturar Elemento   ${locBtnCancelarPendiente}
    Presionar Boton  ${btnCancelar}
