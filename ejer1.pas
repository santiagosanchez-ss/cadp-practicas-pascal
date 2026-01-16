program practicaDeFinal;
//Se dispone de la información de los participantes inscriptos a una carrera (a lo sumo 5000). De
//cada participante se tiene DNI, nombre y apellido, categoría (1..5) y fecha de inscripción. Se
//pide implementar un programa que guarde en una estructura adecuada los participantes de
//aquellas categorías que posean a lo sumo 50 inscriptos. Se sabe que cada participante se
//puede anotar en una sola categoría.


uses crt;
const 
dimf= 5000;
type 
    rangoCat = 1..5;
    participante = record
        dni:integer;
        nombre:string;
        apellido:string;
        categoria:rangoCat;
        fecha:integer;
    end;
    participanteCumple= record
        dni:integer;
    end;
    vectorParticipantes = array [1..dimf] of participante;
    vecContadorCategorias = array [rangoCat] of integer;
    listacumplen= ^ nodo;
    nodo = record 
        dato:participante;
        sig:listacumplen;
    end;
procedure cargarParticipantes(var v: vectorParticipantes; var dimL: integer);
var
  p: participante;
begin
  dimL := 0;

  { leer participante }
  leerParticipante(p);
  while (dimL < dimF) and (p.dni <> 0) do
  begin
    dimL := dimL + 1;
    v[dimL] := p;
    leerParticipante(p);
  end;
end;
procedure incializarlista(var l:listacumplen);
begin
    l:= nil;
end;
procedure agregarAdelante(p:participante; var lista:listacumplen);
var
nue:listacumplen;
begin
    new(nue);
    nue^.dato:= p;   
    nue^.sig:= lista;
    lista:= nue;
end;
procedure inicializarContador(var vc: vecContadorCategorias);
var
  i: rangoCat;
begin
  for i := 1 to 5 do
    vc[i] := 0;
end;
procedure inscriptos(vecParticipantes:vectorParticipantes; var diml:integer; var vecCategorias:vecContadorCategorias);
var
i :integer;
begin
    for i:= 1 to diml do begin
        vecCategorias[vecParticipantes[i].categoria]:= vecCategorias[vecParticipantes[i].categoria] +1;
    end;

end;
procedure agregarLista(vecParticipantes:vectorParticipantes; diml:integer; vecCategorias:vecContadorCategorias;var l: listacumplen);
var
i :integer;
begin
    l:= nil;
    for i:= 1 to diml do begin 
       if  (vecCategorias[vecParticipantes[i].categoria] <= 50) then 
        agregarAdelante(vecParticipantes[i],l);
    end;
    
end;
var
participantes : vectorParticipantes;
vecContador:vecContadorCategorias;
diml:integer;
i:integer;
lista:listacumplen;
begin
    diml:= 0;
    cargarParticipantes(vecParticipantes,diml);
    inicializarContador(vecContador);
    inscriptos (participantes,diml,vecContador);
    agregarLista (participantes,diml,vecContador,lista);
end.