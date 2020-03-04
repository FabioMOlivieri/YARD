*** Settings ***
Resource        ../Libraries Proxy/Selenium Proxy.robot
Resource        ../Actions/AccionesLogin.robot
Resource        ../Global Definitions/Variables.robot

*** Keywords ***
IniciarAplicacion
    [Arguments]    ${Url}    ${Browser}    ${Usuario}    ${Contrasenia}    ${Terminal}
    Set Selenium Speed  ${gSpeed}
    AbrirNavegador    ${Url}    ${Browser}
    IndicarUsuario  ${Usuario}    ${Contrasenia}
    IndicarTerminal  ${Terminal}
    GuardarToken

IndicarUsuario
    [Arguments]    ${Usuario}    ${Contrasenia}
    AccionesLogin.IngresarUsuario  ${Usuario}
    AccionesLogin.IngresarContrasenia  ${Contrasenia}
    AccionesLogin.PresionarIngresar

IndicarTerminal
    [Arguments]    ${Terminal}
    AccionesLogin.SeleccionarTerminal  ${Terminal}
    AccionesLogin.PresionarIngresar

GuardarToken
    Sleep  5
    ${LocalStorageToken}=    Devolver valor local storage   YardToken
    ${BearerToken}  Catenate  Bearer  ${LocalStorageToken}
    Set Global Variable    ${gAutToken}    ${BearerToken}