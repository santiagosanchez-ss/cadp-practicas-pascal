{Consigna creada con GPT:
Una empresa registra las ventas diarias de sus sucursales en un vector (máx. 3000 ventas), ordenado por código de sucursal.
De cada venta se conoce:

código de sucursal

día

monto

Se pide generar una lista que contenga, para cada sucursal:

código de sucursal

cantidad total de ventas

monto total vendido

📌 Resolver de la forma más eficiente posible en tiempo.}

program ejercicio7;
const 
    max = 3000;
type 
    venta = record 
        codigoSucursal: integer;
        dia:integer;
        monto:real;
    end;

    vectorVentas = array [1..max] of venta;

    sucursal = record 
        codigo: integer;
        cantidadVentas: integer;
        montoTotal:real;
    end;

    listaSucursales = ^nodo

    nodo = record 
        dato: sucursal;
        sig:listaSucursales;
    end;

procedure leerVenta (var v:venta) {se dispone}
procedure cargarVector (var vec:vectorVentas; v: venta){se dispone}

procedure generarlistaSucursales (var ls:listaSucursales; vec:vectorVentas; diml:integer);
var
unaSucursal: sucursal; i:integer;
begin
    i:= 1;
    while  (i>= diml) do 
    begin 
        unaSucursal.cantidadVentas:= 0;
        unaSucursal.montoTotal:= 0;
        unaSucursal.codigo := vec[i].codigoSucursal;
        while (i <= diml) and (unaSucursal.codigo = vec[i].codigoSucursal) do 
        begin 
            unaSucursal.cantidadVentas:= unaSucursal.cantidadVentas +1 ;
             unaSucursal.montoTotal:=  unaSucursal.montoTotal+ vec[i].monto;
            i:= i+1;
        end;
        insertarLista(ls,unaSucursal);

    end;
end;

procedure insertarLista ( var ls:listaSucursales; s:sucursal);
var 
nue:listaSucursales;
begin
    new (nue);
    nue^.dato:= s;
    nue^.sig:= ls;
    ls:= nue;
end;

var
v:venta; vector: vectorVentas; ls:listaSucursales; diml:integer;
begin
    ls:= nil ;
    diml:= 0;
    leerVenta(v){se dispone};
    cargarVector(vector,v,diml){se dispone};
    generarlistaSucursales (ls,vector,diml);

end.