{un comercio dispone de la info de sus ventas. De cada venta se conoce: 
codigo de producto, dni del cliente,fecha,cantidad y precio unitario
La info esta ordenada por dni.Implementar un programa que genere una nueva estructura de datos que contenga dni del cliente,
cantiad total de compras que realizo y el monto total de sus compras }

program ejercicio5;

type

    venta = record
        codigo:integer;
        dniCliente:integer;
        fecha:integer;
        cant:integer;
        precio:real;
    end;
    
    listaVentas= ^nodoVenta;
    
    nodoVenta = record 
        dato:venta;
        sig:listaVentas;
    end;

    cliente = record 
        dni:integer;
        cantCompras: integer;
        montoTotal:real;
    end;

    listaCliente = ^ nodoCliente;

    nodoCliente = record
        dato: cliente;
        sig:listaCliente;
    end;

procedure leerVenta (var v: venta); {se dispone}
procedure cargarListaVentas ( var lV: listaVentas; v: venta); {se dispone}

procedure cargarListaClientes ( var lC: listaCliente; lV:listaVentas);
var 
cli:cliente;
begin
    while (lV <> nil) do 
    begin 
        cli.dni:= lV^.dato.dni;
        cli.cantCompras:= 0;
        cli.montoTotal:= 0;
        while (lV <> nil) and ( cli.dni = lV^.dato.dniCliente) do 
        begin
            cli.cantCompras:= cli.cantCompras + 1;
            cli.montoTotal:=cli.montoTotal + lV^.dato.montoTotal ; 
            lV:= lV^.sig;
        end;
        AgregarAdelante (lC,cli);
    
    end;
end;

procedure AgregarAdelante (var listaC:listaCliente; c:cliente);
var
nue:listaCliente;
begin
    new (nue);
    nue^.dato:= c;
    nue^.sig:=listaC;  
    listaC:= nue;
end;


var
lVentas: listaVentas; lClientes:listaCliente;
v:venta; 
begin 
    lVentas:= nil;
    lClientes:= nil; 
    leerVenta (v);{se dispone}
    cargarListaVentas( lVentas,v); {se dispone }
    cargarListaClientes ( lClientes,lVentas);

end;



