*** Settings ***
Resource        ../../Actions/Cupo/Acciones Dejar Cupo Pendiente.robot

*** Keywords ***
Acepta dejar pendiente el cupo
    [Arguments]     ${aIdMotivo}    ${aObservacion}
    Acciones Dejar Cupo Pendiente.Seleccionar Motivo  ${aIdMotivo} 
    Acciones Dejar Cupo Pendiente.Ingresar Observacion  ${aObservacion}
    Acciones Dejar Cupo Pendiente.Presionar Aceptar