//Realizar un programa que procese la información de los productos de un supermercado. De
//cada producto se lee código, rubro, stock y monto. La información se lee ordenada por rubro,
//hasta que llega el producto con código -1. Se pide almacenar, en una estructura de datos
//adecuada, solamente los productos del rubro “Limpieza”.

program ejercicio2;

uses crt;
type 

    producto = record   
        codigo:integer;
        rubro:string;
        stock:integer;
        monto:integer;
    end;

    prodLimpieza =^nodo;
    nodo = record 
        dato:producto;
        sig:prodLimpieza;
    end;
procedure inicializarLista (var l:prodLimpieza);
begin
    l:= nil;
end;
procedure leerProducto(var prod:producto);
begin
    writeln('ingrese el codigo del prod');
    readln (prod.codigo);
    writeln('ingrese el rubro del prod');
    readln (prod.rubro);
    writeln('ingrese el stock del prod');
    readln (prod.stock);
    writeln('ingrese el monto del prod');
    readln (prod.monto);
end;
procedure agregarAdelante (p:producto; var l:prodLimpieza);
var
nue:prodLimpieza;
begin
    new(nue);
    nue^.dato:=p;
    nue^.sig:=l;
    l:= nue;
end;
procedure cargarProdLimpieza (var p:producto; var l:prodLimpieza);
begin
   { 
        leerProducto(p);
        while (p.codigo <> -1) and (p.rubro <> 'limpieza') do begin 
            leerProducto(p);
        end;

        while (p.codigo <> -1 ) and ( p.rubro = 'limpieza') do begin 
            agregarAdelante(p,l);
            leerProducto(p);
        end; 
    } //asi lo pense a la primera pero la forma correcta es la siguiente ya que nunca dice que si aparecen prod de limpieza dsp no aparezcan mas.

    leerProducto(p);
  while p.codigo <> -1 do
  begin
    if p.rubro = 'limpieza' then
      agregarAdelante(p, l);
    leerProducto(p);
  end;
end;

var 
p:producto;
l:prodLimpieza;
begin {progr ppal} 
    inicializarLista (l);
    cargarProdLimpieza(p,l);
end.