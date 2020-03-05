*** Settings ***
Resource        ../Libraries Proxy/Selenium Proxy.robot
Resource        ../Actions/AccionesLogin.robot
Resource        ../Global Definitions/Variables.robot
Library         RequestsLibrary
Library         Collections
Library         OperatingSystem
Library         JSONLibrary

*** Keywords ***
IniciarAplicacion
    [Arguments]    ${Url}    ${Browser}    ${Usuario}    ${Contrasenia}    ${Terminal}
    Set Selenium Speed  ${gSpeed}
    AbrirNavegador    ${Url}    ${Browser}
    IndicarUsuario  ${Usuario}    ${Contrasenia}
    IndicarTerminal  ${Terminal}
    #GuardarToken

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
    [Arguments]     ${Token}
    #Sleep  5
    #${LocalStorageToken}=    Devolver valor local storage   YardToken
    ${BearerToken}  Catenate  Bearer  ${Token}
    Set Global Variable    ${gAutToken}    ${BearerToken}

LoguearUsuarioSinIniciarAplicacion
    [Arguments]     ${Usuario}    ${Contrasenia}    ${IdTerminal}
    ${body}=    Create Dictionary    nombreUsuario=${Usuario}    contrasenia=${Contrasenia}     idTerminal=${IdTerminal}
    ${Headers}=    Create Dictionary    Content-Type=application/json
    Create Session    mySession    ${gAppUrlUat}
    ${Response}=    Post Request    mySession    /login    data=${Body}    headers=${Headers}
    ${bodyResponse}=    To Json    ${response.content}
    ${Token}=    Get Value From Json    ${bodyResponse}    $.access_token
    GuardarToken    ${Token[0]}
    
