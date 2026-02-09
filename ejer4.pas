//un comercio dispone de una estructura de datos con las facturas (como maximo 2000 facturas) realizadasdurante enero de 2023.
// de cada factura se conoce el numero de factura m el codigo de cliente y monto total. 
// tambien dispone de una estructura con las facturas realizadas durante febrero (como max 2000 facturas ) .  
//En ambas estructuras, las facutras se encuentran ordenadas por cliente. se pide implementar un programa que incorpore las facturas
//del mes de febrero del cliente con codigo 444, de ser posible, a las estructura con las facturas de enero. Dicha incorporacion
// debe realizarse de la manera mas eficiente con respecto al tiempo de ejecucion. Uncliente puede tener varias facturas por mes.
//dicha incorporacion debe llevar el menor tiempo posible y ser lo mas eficiente posible.


program ejercicio4;
const 
    max: 2000;
   
type
    factura = record
        numero:integer;
        codigoC:integer;
        monto:real;
    end;
    mes = array [1..max] of facturas;
//procedures
procedure recorrerFebrero (vectorF:mes; dimL:integer; var arranca:integer; var cantidad:integer);
var 
    i:integer;
begin
    i:= 1;
    cantidad:= 0;
    while (i <= dimL) and (vectorF[i].codigoC <> 444) do
    begin
        i:= i + 1; 
    end;
    if ( i <= dimL)then 
    begin
        arranca:= i;
        while  (i <= dimL) and (vectorF[i].codigoC = 444) do
        begin
            cantidad:= cantidad + 1;
            i:= i + 1; 
        end;
    end;

end;
procedure agregarEnero (var vectorE:mes; vectorF:mes; inicio:integer; cantidad:integer;dimle:integer);
var 
    i:integer;
begin
    for i:=1 to cantidad do begin
        insertarAlVector(vecE,vectorF[inicio],dimle);
        inicio:= inicio + 1; 
    end;
end;
procedure insertarAlVector ( var vectorE:mes; elemento:factura;var dimle:integer);
begin
    if (dimle < max) then 
    begin 
        dimle := dimle + 1;
        vectorE[dimle] := elemento;
    end;
end;

var
    vecE: mes; 
    vecF:mes;
    cantFacturas:integer;
    dimLf:integer;
    dondeArranca:integer;
    cantidad444:integer;
    DimLe:integer;
begin 
    recorrerFebrero ( vecF,dimLf,dondeArranca,cantidad444);
    agregarEnero (vecE,vecF,dondeArranca,cantidad444,dimLe);
end.

//HECHO CON LISTAS 
{program comercio;
const dimf=2000;
type
  factura=record 
    num:integer;
    cod:integer;
    monto:real;
  end;
lista=^nodo;
nodo=record 
  datos:factura;
  sig:lista;
end;

procedure leer(var f:factura); {se dispone
procedure cargarListaE(var LE:lista); {se dispone
procedure cargarListaF(var LF:lista); {se dispone

procedure agregarOrdenado(var l:lista;f:factura);
var act,ant,nue:lista;
begin
  new(nue);
  nue^.datos:=f;
  act:=l;
  ant:=l;
  while(act <> nil) and (f.cod  > act^.datos.cod) do begin
    ant:=act;act:=act^.sig;
  end;
  if(act=ant) then
    l:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure procesar(var le:lista;lf:lista);
var actF,antF:lista;
begin
  actF:=lf;
  while(actF <> nil) and (actF^.datos.cod < 444) do begin
    actF:=actF^.sig;
  end;
  while(actF <> nil) and (actF^.datos.cod = 444) do begin
    agregarOrdenado(le,actF^.datos);
    actF:=actF^.sig;
  end;
end;

var le:lista;lf:lista;
begin
  le:=nil;lf:=nil;
  cargarListaE(le);{se dispone
  cargarListaF(lf);{se dispone
  procesar(le,lf);
end;
}