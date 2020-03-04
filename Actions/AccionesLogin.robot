*** Settings ***
Resource        ../Libraries Proxy/Selenium Proxy.robot
Resource        ../User Interface/ControlesLogin.robot

*** Keywords ***
IngresarUsuario
    [Arguments]    ${Usuario}
    ${txtUsuario}    Capturar Elemento    ${locTxtUsuario}
    Ingresar Texto    ${txtUsuario}    ${Usuario}

IngresarContrasenia
    [Arguments]    ${Contrasenia}
    ${txtContrasenia}    Capturar Elemento    ${locTxtContrasenia}
    Ingresar Password  ${txtContrasenia}  ${Contrasenia}

PresionarIngresar
    ${btnIngresar}    Capturar Elemento    ${locBtnIngresar}
    Presionar Boton    ${btnIngresar}

SeleccionarTerminal
    [Arguments]    ${Valor}
    ${ddlTerminal}    Capturar Elemento    ${locDdlTerminal}
    Elegir Opcion Lista Por Valor    ${ddlTerminal}    ${Valor}
