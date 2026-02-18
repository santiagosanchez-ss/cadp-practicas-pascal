{ final 
Una empresa dispone de una estructura de datos on los clientes de su comercio( 500 a lo sumo).
de cada cliente se conoce el numero d cliente, numero de dni y monto que paga.
se pide implementar un progr. que informe la cantidad de cleintes cuyo numero de dni es capicua( es igual leerlo de izq a derecha) }

program ejerFinal; 

type
    rango = 1..500;

    cliente = record 
        numCliente:integer;
        numDni:integer;
        monto:real;
    end;
    
    vectorClientes : array (rango) of cliente;

//modulos que se dispone
procedure leerCliente ( var c:cliente);
procedure cargarVectorClientes ( var v:vectorClientes; var diml:integer; var c: cliente);
/////
function analizar (num:integer): boolean;
var 
original, invertido, digito:integer;
begin 
    original:= num;
    invertido:= 0;
    while (num <> 0) do
    begin 
        digito:= num mod 10; 
        invertido := invertido * 10 + digito;
        num:= num div 10; 
    end;

    if ( original = invertido ) then
        cumple:= true;
    else 
        cumple := false;
    
end;
procedure contadorCapicuas ( v: vectorClientes; diml:integer ; var t: integer);
var 
i:integer; cumple: boolean;
begin 
    for i:= 1 to diml do
    begin 
        analizar(v[i].numDni);
        if(analizar = true) then 
            t:= t +1; 
        end;
    end;
    

end;
var 
v: vectorClientes; c:cliente; total:integer; diml:integer;
begin
    cargarVectorClientes ( v,diml, c); {se dispone}
    total:= 0; 
    contadorCapicuas ( v, diml, total);
    writeln( ' el total de numeros capicua es de ', total);


end;