*** Settings ***
Resource        ../Libraries Proxy/Selenium Proxy.robot
Resource        ../Actions/Login.robot

*** Keywords ***
Iniciar Aplicacion
    [Arguments]    ${aUrl}    ${aBrowser}    ${aUsuario}    ${aContrasenia}    ${aTerminal}
    AbrirNavegador    ${aUrl}    ${aBrowser}
    Indicar usuario  ${aUsuario}    ${aContrasenia}
    Indicar Terminal  ${aTerminal}
    Guardar Token

Indicar usuario
    [Arguments]    ${aUsuario}    ${aContrasenia}
    Ingresar Usuario    ${aUsuario}
    Ingresar Contrasenia    ${aContrasenia}
    Presionar Ingresar

Indicar Terminal
    [Arguments]    ${aTerminal}
    Seleccionar Terminal    ${aTerminal}
    Presionar Ingresar

Guardar Token
    Sleep  5
    ${localStorageToken}=    Devolver valor local storage   YardToken
    ${BearerToken}  Catenate  Bearer  ${localStorageToken}
    Set Global Variable    ${gAutToken}    ${BearerToken}