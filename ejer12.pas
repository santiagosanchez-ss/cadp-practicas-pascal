{se dipone de la info de los participantes iscriptos a una carrera ( a lo sumo 5000).
 de cada participante se tiene dni, nombre y apellido, categoria (1..5) y fecha de inscripcion.
 se pide implementar un prog que guarde en una estructura adecuada los particiapntes de aquellas categorias que posean a lo sumo 
 50 inscriptos. se sabe que cada participante se puede anotar en una sola categoria}

{ como primer idea, se pude crear una estructura de tipo lista ( no es necesario que sea un vector aunque digan la cant maxima) 
  de esa lista mientras se recorra ( osea la l <> nil ) ir cargando un vector contador ( 1..5) luego, se pasara a un modulo en el que se
  evalua : si el v[l^.categoria] es > a 50, agrega el nodo en el que se esta de la lista a la estrucutura nueva. Sino se sigue al otro nodo 
}

 program ejer12;

 type 
    rango: 1..5;
    participante = record 
        dni:integer;
        nomApe:string;
        categoria:rango;
        fecha:integer; 
    end;

    listaParticipantes = ^nodoParticipantes;
    listaCumple= ^nodoParticipantes;
    nodoParticipantes = record 
        dato:participante;
        sig:listaParticipantes;




        
    end;

    vectorContador = array [rango] of integer;
   
// se dispone 
procedure leerParticipante ( var p: participante); { se dispone}
procedure cargarlistaDispone ( var l:listaParticipantes; var p: participante); {se dispone, dentro del modulo se usara el leer participante}

//
procedure incializarVector ( var v:vectorContador);
var
i:integer;
begin 
    for i:=1 to 5 do 
    begin 
        v[i]:= 0;
    end;

end;

procedure cargarVector ( var v:vectorContador; l:listaParticipantes);
begin 
    while ( l<> nil) do 
    begin 
        v[l^.dato.categoria]:= v[l^.dato.categoria] + 1;
        l:= l^.sig;
    end;

end;

procedure agregarlistaCumple ( l:listaParticipantes; var lc:listaCumple);
var
    nue:listaCumple;
begin 
    new ( nue);
    nue^.dato:= l^.dato;
    nue^.sig:= lc;
    lc:= nue;
end;

procedure cargarListaCumple ( v:vectorContador; var lc:listaCumple; l:listaParticipantes);
begin 
    while ( l <> nil ) do 
    begin 
        if ( v [l^.dato.categoria] <=  50) then 
            agregarlistaCumple (l,lc);
        l:= l^.sig;
    end;

end;
var 
l:listaParticipantes; p:participante; vec:vectorContador;
lc:listaCumple;
begin 
    l:= nil; 
    lc:= nil;
    cargarlistaDispone ( l, p) {se dispone};
    incializarVector ( vec); 
    cargarVector(vec, l); 
    cargarListaCumple( vec, lc,l);
end.
    
