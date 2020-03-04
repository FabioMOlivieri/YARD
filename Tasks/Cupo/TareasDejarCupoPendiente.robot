*** Settings ***
Resource        ../../Actions/Cupo/AccionesDejarCupoPendiente.robot

*** Keywords ***
AceptarDejarPendienteCupo
    [Arguments]     ${IdMotivo}    ${Observacion}
    AccionesDejarCupoPendiente.SeleccionarMotivo  ${IdMotivo} 
    AccionesDejarCupoPendiente.IngresarObservacion  ${Observacion}
    AccionesDejarCupoPendiente.PresionarAceptar