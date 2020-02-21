**Settings 
Resource    ../../Actions/Control/ControlDescargaCamionCereales.robot
Library     DateTime

**Keywords  
IngresoCamionCerealTarjetaCancelar
    ${fecha}=   get Current Date
    ControlDescargaCamionCereales.Ingresar Numero Documento Porte  333333333333
    Ingresar CEE  12345678901243
    ControlDescargaCamionCereales.Ingresar CTG  1
    Ingresar Fecha Vencimiento  ${fecha}
    ControlDescargaCamionCereales.Ingresar Titular  ypf
    Ingresar Corredor Comprador  direc 
    ControlDescargaCamionCereales.Ingresar Transportista  ber33
    ControlDescargaCamionCereales.Ingresar Chofer  20252208578 
    ControlDescargaCamionCereales.Ingresar Producto  1
    Ingresar Localidad  222
    Ingresar Patente  yui123
    Ingresar Patente Acoplado  iuy321
    Ingresar Kilometros Recorridos  1
    Ingresar Tarifa Referencial  1
    Ingresar Tarifa Tonelada  1
    Ingresar Codigo de cancelacion  1
    ControlDescargaCamionCereales.Presionar Aceptar
    Presionar Cancelar Tarjeta
    Cerrar Pantalla