*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/Controles Dejar Cupo Pendiente.robot

*** Keywords ***
Ingresar Observacion
    [Arguments]    ${Observacion}
    ${txtObservacion}    Capturar Elemento    ${locTxtObservacion}
    Ingresar Texto    ${txtObservacion}    ${Observacion}

Seleccionar Motivo
    [Arguments]     ${IdMotivo}
    ${ddlMotivo}    Capturar Elemento   ${locDdlMotivo}
    Elegir Opcion Lista Por Valor  ${ddlMotivo}   ${IdMotivo}

Presionar Aceptar
    ${btnAceptar}   Capturar Elemento   ${locBtnAceptarPendiente}
    Presionar Boton  ${btnAceptar}

Presionar Cancelar
    ${btnCancelar}   Capturar Elemento   ${locBtnCancelarPendiente}
    Presionar Boton  ${btnCancelar}
