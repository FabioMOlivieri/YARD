*** Settings ***
Resource        ../../Actions/Cupo/Acciones Busqueda Avanzada Producto.robot

*** Keywords ***
Busca producto por codigo
    [Arguments]     ${aCodigoProducto}
    Acciones Busqueda Avanzada Producto.Ingresar Codigo Producto  ${aCodigoProducto}
    Acciones Busqueda Avanzada Producto.Presionar Buscar
    Acciones Busqueda Avanzada Producto.Seleccionar primer registro
    Acciones Busqueda Avanzada Producto.Presionar Aceptar