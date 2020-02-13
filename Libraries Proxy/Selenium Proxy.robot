*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Abrir Navegador
    [Arguments]    ${aURL}    ${aBrowser}
    Open Browser    ${aURL}    ${aBrowser}

Capturar Elemento
    [Arguments]    ${aLocator}
    Wait Until Page Contains Element    ${aLocator}    10 seconds
    ${aElement}    set variable    ${aLocator}
    [Return]    ${aElement}

Ingresar Texto
    [Arguments]    ${aElement}    ${aText}
    Set Focus To Element    ${aElement}
    Input Text    ${aElement}    ${aText}

Ingresar Password
    [Arguments]    ${aElement}    ${aText}
    Set Focus To Element    ${aElement}
    Input Password    ${aElement}    ${aText}

Elegir Opcion Lista Por Valor
    [Arguments]    ${aElement}    ${aValue}
    Select From List By Value    ${aElement}    ${aValue}

Presionar Boton
    [Arguments]    ${aElement}
    Set Focus To Element    ${aElement}
    Click Element    ${aElement}

Scrollear Hasta Final Pagina
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)

Scrollear al Inicio Pagina
    Execute Javascript    window.scrollTo(0,-document.body.scrollHeight)

Scrollear Hasta Elemento
    [Arguments]    ${aElement}
    Scroll Element Into View    ${aElement}
    Wait Until Element Is Visible    ${aElement}

Ir A Otra Pagina
    [Arguments]    ${aURL}
    Go To    ${aURL}

Volver
    Go Back

Cerrar Todo
    Close All Browsers

Cerrar Pantalla
    Close Browser

Imprimir pantalla
    [Arguments]    ${aLocalDir}
    Capture Page Screenshot    ${aLocalDir}

Imprimir Elemento
    [Arguments]    ${aElement}    ${aLocalDir}
    Capture Element Screenshot    ${aElement}    ${aLocalDir}

Devolver valor local storage 
    [Arguments]     ${aConcepto}
    ${valor}=    Execute Javascript    return window.localStorage.getItem("${aConcepto}")
    [Return]    ${valor}

Elemento debe contener valor
    [Arguments]     ${aLocator}     ${aValor}
    Element Should Contain  ${aLocator}  ${aValor}

Pagina debe contener valor
    [Arguments]     ${aValor}
    Page Should Contain  ${aValor}
