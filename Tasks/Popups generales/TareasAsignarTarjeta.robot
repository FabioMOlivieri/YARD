*** Settings ***
Resource        ../../Actions/Popups generales/AccionesAsignarTarjeta.robot

*** Keywords ***
AsignarTarjeta
    [Arguments]     ${NroTarjeta}
    AccionesAsignarTarjeta.IngresarNumeroTarjeta  ${NroTarjeta}
    AccionesAsignarTarjeta.PresionarAceptar

CancelarAsignaciónTarjeta
    AccionesAsignarTarjeta.PresionarCancelar