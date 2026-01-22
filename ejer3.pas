//La Facultad de Informática organizará el congreso WICC 2022, en donde se expondrán
//trabajos de investigación. De cada trabajo se conoce: título, nombre del autor, DNI del autor y
//tipo de trabajo (1..10). Un mismo autor puede presentar varios trabajos. Se pide escribir un
//programa que:
//a) Lea y almacene en una estructura adecuada la información de los trabajos. La lectura
//finaliza al ingresar un DNI con valor 22222222 (el cual debe procesarse).
//b) Informar para cada autor la cantidad de trabajos presentados.

program ejercicio3;
uses crt;
const 
    rango:1..10;

type 

    trabajo = record    
        titulo:string;
        nombreA:string;
        dniA:integer;
        tipo:rango;
    end;

    lista = ^nodo;

    nodo = record   
        dato:trabajo;
        sig:lista;
    end;
//modulos
procedure leerTrabajo(var t:trabajo);
begin
     writeln('ingrese el titulo del trabajo');
    readln (t.nombre);
    writeln('ingrese el nombre de autor');
    readln (t.nombreA);
    writeln('ingrese el dni del autor');
    readln (t.dniA);
    writeln('ingrese el tipo de trabajo (1  a 10)');
    readln (t.tipo);
end;
procedure agregarLista(t:trabajo; var l:lista);
var
    nuevo, act, ant:lista;
begin
    new(nuevo);
    nuevo^.dato := t;
    nuevo^.sig := nil;

    act:= l;
    ant:= nil;
    while ( act <> nil) and ( act^.dato.dniA < t.dniA)do 
    begin
        act:= act^.sig;
    end;
    if (ant = nil) then
    begin
        nuevo^.sig := l;
        l := nuevo;
    end
    else
    begin
        ant^.sig := nuevo;
        nuevo^.sig := act;
    end;
end;
procedure informarTrabajos(l:lista);
var
    dniActual:integer;
    nombreActual:string;
    cant:integer;
begin
    while (l <> nil) do
    begin
        dniActual := l^.dato.dniA;
        nombreActual := l^.dato.nombreA;
        cant := 0;

        while (l <> nil) and (l^.dato.dniA = dniActual) do
        begin
            cant := cant + 1;
            l := l^.sig;
        end;

        writeln('Autor: ', nombreActual, ' - DNI: ', dniActual);
        writeln('Cantidad de trabajos: ', cant);
        writeln('---------------------------');
    end;
end;
procedure cargarTrabajo (var t:trabajo; var l:lista);
begin
    
    repeat
        leerTrabajo(t);
        agregarLista(t,l);
    until (t.dniA == 222);

end;
//fin modulos
var 
    t:trabajo; l:lista;
begin {p ppal}

    cargarTrabajo(t,l);
    informarTrabajos(l);
end.
