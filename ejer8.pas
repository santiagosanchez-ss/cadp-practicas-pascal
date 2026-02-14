
{EJERCICIO DE FINAL 
    la facultad dispone de sus prestamos ordenados por codigo de tema (1..15). 
    de cada prestamo se conoce:
    CODIGO DE TEMA
    FECHA
    CODIGO DEL LIBRO 
    se pide realizar un programa que informe el codigo de tema con mas cantidad 
    de prestamos y la cantidad total de prestamos para cada tema.
    Declare todas la estructuras utilizadas para resolver el programa.
    considerar que la solucion prouesta debe ptimizar el tiempo de ejecucion y 
    la mem estatica   
}
// para primer inciso hacer un vector contador de cada codigo y dsp informar el indice que mas tiene 


program ejercicio8;

type
    rango = 1..15;
    prestamo = record
        codigoTema:rango;
        fecha:integer;
        codigoLibro:integer;
    end;

    listaPrestamos = ^nodoPrestamos

    nodoPrestamos = record  
        dato:prestamo;
        sig:listaPrestamos,
    end;

    vectorCodigos = array [rango] of integer;

procedure leerPrestamo (var p:prestamo);{ se dispone y se utiliza dentro del procedure cargarListaPrestamos}
procedure cargarListaPrestamos ( var lp:listaPrestamos, var p: prestamo) {se dispone}

procedure inicializarVectorContador ( var vc:vectorCodigos);
var 
i:integer;
begin 
    for i:= 1 to 15 do 
        vc[i]:= 0;
end;

procedure cargarVectorcontador ( lPrestamos:listaPrestamos; vc:vectorCodigos);
begin 
    while (lPrestamos <> nil) do
    begin 
        vc[lPrestamos^.dato.codigoTema]:= vc[lPrestamos^.dato.codigoTema] +1;
        lPrestamos:= lPrestamos^.sig;
    end;
end;

procedure codigoConMasCantidad( v:vectorCodigos);
var 
i:integer; max:integer; codigo:integer; 
begin 
    max:= 0;
    for i:= 1 to 15 do 
    begin 
        if (v[i] > max) then  
        begin 
            codigo:=i;
            max:= v[i];
        end;
    writeLn('la cantidad del codigo', i, ' es de ', v[i]);
    end;
    
    writeLn('el codigo con mayor prestamos es' , codigo, ' con una cantida de ', max);
end;

var 
lPrestamos : listaPrestamos;
p:prestamo;
vContador: vectorCodigos;
begin
    lprestamos:= nil;
    cargarListaPrestamos ( lPrestamos,p); {se dispone}
    inicializarVectorContador ( vContador);
    cargarVectorcontador ( lPrestamos, vContador);
    codigoConMasCantidad ( vContador);

end.