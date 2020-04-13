**Settings
Library          XML
Library         OperatingSystem
Library         Collections
Library         RequestsLibrary
Library         String
Resource        ../../../External Resources/RutaRecursos.robot

**Variables
${FilePathXmlPost}     Business/Cupo/RequestObtenerFechaStock.xml

**Test Cases
Prueba
    ${RutaRecurso}=     ObtenerRutaRecursos
    Create Session    mySession    http://arrosvmapp243.neoris.cxnetworks.net/Interfaces.Presentation.WebServices.LagosInterface/LagosInterface.asmx?
    ${Headers}=    Create Dictionary    Content-Type=text/xml
    ${Body}=        Get File        ${RutaRecurso}/${FilePathXmlPost}  
    Replace String      ${Body}     IdSociedad  1
    Replace String      ${Body}     IdProducto  23
    Replace String      ${Body}     IdTerminal  148
    Replace String      ${Body}     Fecha       20200326
    ${Response}=    Post Request    mySession    GetStockDateWithoutEquivalences    data=${Body}    headers=${Headers}
    ${StatusCode}=    Convert To String    ${Response.status_code}
    Should Be Equal    ${StatusCode}    200
    ${Content}=     Convert To String   ${Response.content}
    ${XmlContent}=  Parse Xml  ${Content}
    ${Valor}=   Get Element Text  ${XmlContent}     .//GetStockDateWithoutEquivalencesResult
    Should Be Equal  ${Valor}    26/03/2020