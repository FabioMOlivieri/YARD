*** Settings ***
Resource        ../../Libraries Proxy/Selenium Proxy.robot
Resource        ../../User Interface/Cupo/ControlesGestionarCupos.robot
Resource        ../../User Interface/Cupo/ControlesValidarCupo.robot
Resource        ../../Actions/Cupo/AccionesGestionarCupos.robot
Resource        ../../Global Definitions/Mensajes.robot
Resource        ../../Global Definitions/Constantes.robot
Library         String

**Keywords
######### FILTRO #############3
SistemaDebeFiltrarMovimientosPendienteCupoPorTipoDocPorte
    [Arguments]     ${IdTipoDocumentoPorte} 
    ${ResultadoQuery}   Query   SELECT COUNT(*) FROM T_MOVEMENT WHERE ID_CARRIAGE_DOCUMENT = ${IdTipoDocumentoPorte} and ID_MOVEMENT_STATUS = 22
    ${CantRegistros}=   Convert To String  ${ResultadoQuery[0][0]}
    Element Should Contain  ${locLblCantidadRegistros}  ${CantRegistros}

SistemaDebeFiltrarMovimientosPendienteCupoPorNroDocPorte
    [Arguments]     ${NroDocumentoPorte} 
    ${ResultadoQuery}   Query   SELECT COUNT(*) FROM T_MOVEMENT WHERE CARRIAGE_DOCUMENT_NUMBER = '${NroDocumentoPorte}' and ID_MOVEMENT_STATUS = 22
    ${CantRegistros}=   Convert To String  ${ResultadoQuery[0][0]}
    Element Should Contain  ${locLblCantidadRegistros}  ${CantRegistros}

SistemaDebeFiltrarMovimientosPendienteCupoPorFechaEntrada
    [Arguments]     ${FechaEntrada} 
    ${ResultadoQuery}   Query   SELECT COUNT(*) FROM T_MOVEMENT WHERE convert(date,ENTRY_DATE) = '${FechaEntrada}' and ID_MOVEMENT_STATUS = 22
    ${CantRegistros}=   Convert To String  ${ResultadoQuery[0][0]}
    Element Should Contain  ${locLblCantidadRegistros}  ${CantRegistros}

############# ACCIONES ###############
SistemaDebeAnularMovimiento
    [Arguments]     ${NroDocumentoPorte}
    Page Should Contain  ${msjAnulacionExitosa}
    ${ResultadoQuery}   Query   SELECT ID_MOVEMENT_STATUS FROM T_MOVEMENT WHERE CARRIAGE_DOCUMENT_NUMBER = '${NroDocumentoPorte}'
    Should Be Equal As Integers     ${ResultadoQuery[0][0]}     ${gEstadoAnulado}
SistemaDebeVisualizarMovimientoModoConsulta
    [Arguments]     ${NroDocumentoPorte}
    Page Should Contain  Validar Cupo
    Element Should Be Disabled  ${locTxtNumeroDocumentoPorte}
    ${NroDocMask}=     Get Value  ${locTxtNumeroDocumentoPorte}
    ${NroDocValue}=     Remove String  ${NroDocMask}  -
    Should Be Equal As Strings  ${NroDocValue}  ${NroDocumentoPorte}
    #idem con el resto de los controles
SistemaDebeVisualizarMovimientoModoEdicion
    [Arguments]     ${NroDocumentoPorte}
    Page Should Contain  Validar Cupo
    Element Should Be Enabled  ${locTxtNumeroDocumentoPorte}
    ${NroDocMask}=     Get Value  ${locTxtNumeroDocumentoPorte}
    ${NroDocValue}=     Remove String  ${NroDocMask}  -
    Should Be Equal As Strings  ${NroDocValue}  ${NroDocumentoPorte}
    #idem con el resto de los controles
