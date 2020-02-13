*** Settings ***
Resource        ../Libraries Proxy/Selenium Proxy.robot
Resource        ../User Interface/Login.robot

*** Keywords ***
Ingresar Usuario
    [Arguments]    ${aUser}
    ${txtUsuario}    Capturar Elemento    ${locTxtUsuario}
    Ingresar Texto    ${txtUsuario}    ${aUser}

Ingresar Contrasenia
    [Arguments]    ${aPass}
    ${txtContrasenia}    Capturar Elemento    ${locTxtContrasenia}
    Ingresar Password  ${txtContrasenia}  ${aPass}

Presionar Ingresar
    ${btnIngresar}    Capturar Elemento    ${locBtnIngresar}
    Presionar Boton    ${btnIngresar}

Seleccionar Terminal
    [Arguments]    ${aValor}
    ${ddlTerminal}    Capturar Elemento    ${locDdlTerminal}
    Elegir Opcion Lista Por Valor    ${ddlTerminal}    ${aValor}
