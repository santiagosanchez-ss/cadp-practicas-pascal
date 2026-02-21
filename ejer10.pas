{Una empresa dispone d la info de las asistencias de sus empleados durante un periodo de tiempo. de cada empleado se conoce:
dni, apellido y nombre, codigo de departamento en el que trabaja (1 y 100) fecha y si estuvo presente o no ese dia 
( no todos los dias se toma asistencia y los empleados puede ser que hayan trabajado o hayan faltado) 
la estructura se encuentra ordenanda por codigo de departamento.
se pide realizar un programa que informe el departamento con mas empleados presentes durante el periodo evaluado por la empresa}


program ejercicio10;
const 
maximo: 100;
type 
    rango = 1..maximo;
    empleado = record 
        dni:integer;
        nomYape:string;
        codDepto:rango;
        fechaAct:integer;
        presente:boolean;
    end;
    listaEmpleados = ^nodo;
    nodo = record 
        dato:empleado;
        sig:listaEmpleados;
    end;

    vectorDeptos= array [rango] of integer; 

/// modulos que se disponen
procedure leerEmpleado ( var e: empleado);{se dispone}
procedure cargarListaOrdenada ( var l: listaEmpleados; var e: empleado){se dispone}
//
procedure inicializarVector ( var v:vectorDeptos);
var
i:integer;
begin 
    for i:= 1 to max do 
    begin
        v[i]:= 0; 
    end;
end;
procedure recorrerLista ( l:listaEmpleados; var v:vectorDeptos; var diml:integer);
var 
i: integer;
begin 
     while (l <> nil) do
    begin
        if (l^.dato.presente) then
            v[l^.dato.codDepto] := v[l^.dato.codDepto] + 1;

        l := l^.sig;
    end;
end;

procedure maximo(v: vectorDeptos; diml:integer);
var
max:integer;
indice:integer;
i:integer;
begin
    max:= 0;
    for i:= 1 to maximo do 
    begin 
        if ( v[i] > max) then 
        begin 
            indice:=i;
            max:= v[i];
        end;
    end;
    writeln(' el codigo de dpto con mas asistencias es:',indice, ' con un total de', max);
end;

var 
l:listaEmpleados;
e:empleado;
vec:vectorDeptos;
diml:integer;
begin 
    l:= nil;
    cargarListaOrdenada (l,e); {se dispone}
    inicializarVector ( vec) ;
    diml:=1;
    recorrerLista ( l,vec, diml);
    maximo ( vec, diml); 


end.