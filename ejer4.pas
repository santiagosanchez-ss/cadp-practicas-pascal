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
procedure recorrerFebrero (vectorF:mes; var cantidadFacturas:integer; dimL:integer; var arranca:integer; var cantidad:integer);
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
procedure agregarEnero (var vectorE:mes; vectorF:mes; inicio:integer; cantidad:integer);
begin
    for i:=
end;

var
    vecE: mes; 
    vecF:mes;
    cantFacturas:integer;
    dimL:integer;
    dondeArranca:integer;
    cantidad444:integer
begin 
    recorrerFebrero ( vecF,cantFacturas,dimL,dondeArranca,cantidad444);
    agregarEnero (vecE,vecF,dondeArranca,cantidad444);
end.