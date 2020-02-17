*** Settings ***
Resource        ../../Actions/Cupo/Validar Cupo.robot

*** Keywords ***
Validar acciones
    Ingresar Numero Documento Porte  123456789
    Seleccionar Opcion Sin Cupo
    Ingresar Producto  1
    Ingresar Vendedor  1
    Ingresar Corredor  1
    Ingresar Destinatario  1 
    Seleccionar Finalidad  1
    Seleccionar Motivo Cupo  1
    Ingresar CTG  123456789
    Ingresar Transportista  1
    Ingresar Chofer  1
    Ingresar KG Netos  1
    Presionar Cancelar


