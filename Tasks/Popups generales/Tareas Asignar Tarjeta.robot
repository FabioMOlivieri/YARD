*** Settings ***
Resource        ../../Actions/Popups generales/Acciones Asignar Tarjeta.robot

*** Keywords ***
Asigna Tarjeta
    [Arguments]     ${aNroTarjeta}
    Acciones Asignar Tarjeta.Ingresar Numero Tarjeta  ${aNroTarjeta}
    Acciones Asignar Tarjeta.Presionar Aceptar

Cancela Asignación Tarjeta
    Acciones Asignar Tarjeta.Presionar Cancelar