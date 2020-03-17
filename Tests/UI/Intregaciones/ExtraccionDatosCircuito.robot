**Settings
Library         OpenPyxlLibrary
Library         String

**Variables
${HojaExcelCupo}        Cupo

**Keywords
ObtenerDatosCupo
    [Arguments]     ${CasoPruebaCupo}
    ${NroDocPorte}=     Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    2
    ${ConCupo}=     Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    3
    ${NroCupo}=     Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    4
    ${CodProducto}=     Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    5
    ${CuilVendedor}=    Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    6
    ${CuilCorredor}=    Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    7
    ${CuilDestinatario}=    Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    8
    ${IdFinalidad}=     Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    9
    ${IdFinalidadStr}=     Convert To String  ${IdFinalidad}
    ${IdMotivo}=    Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    10
    ${IdMotivoStr}=    Convert To String  ${IdMotivo}
    ${SedeOrigen}=  Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    11
    ${ConWSAfip}=   Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    12
    ${CTG}=     Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    13
    ${CuilTransportista}=   Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    14
    ${CuilChofer}=  Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    15
    ${KgNeto}=  Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    16
    ${CodCancCTG}=  Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    17
    ${ConTarjeta}=  Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    18
    ${NroTarjeta}=  Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    19
    ${ValFront}=    Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    20
    ${MotivoPend}=  Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    21
    ${MotivoPendStr}=   Convert To String  ${MotivoPend}
    ${ObsPend}=     Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    22
    ${Msj}=     Read Cell Data By Coordinates   ${HojaExcelCupo}   ${CasoPruebaCupo}    23
    @{DatosCupo}=   Create List  ${ConWSAfip}    ${NroDocPorte}  ${ConCupo}  ${NroCupo}  ${CodProducto}     ${CuilVendedor}    ${CuilCorredor}    ${CuilDestinatario}    ${IdFinalidadStr}     ${IdMotivoStr}  ${SedeOrigen}   ${CTG}     ${CuilTransportista}   ${CuilChofer}  ${KgNeto}  ${CodCancCTG}   ${ConTarjeta}   ${NroTarjeta}   ${ValFront}   ${Msj}    ${MotivoPendStr}   ${ObsPend}
    [Return]    @{DatosCupo}