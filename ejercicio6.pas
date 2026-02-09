{Consigna creada con GPT:
Un hospital dispone de una lista de atenciones médicas, ordenada por dni del paciente.
De cada atención se conoce:
dni del paciente
código de especialidad
fecha
costo de la consulta
Implementar un programa que genere una nueva lista donde cada nodo contenga:
dni del paciente
cantidad total de atenciones realizadas
monto total abonado
La lista resultante no necesita estar ordenada.}

program ejercicio6;

type 

    atencion = record
        dniPaciente:integer;
        codigoEspecialidad: integer;
        fecha:integer;
        costoConsul:real;
    end;

    listaAtenciones = ^nodoAtenciones;

    nodoAtenciones = record
        dato:atencion;
        sig:listaAtenciones;
    end;

    paciente = record 
        dni:integer;
        cantAtenciones:integer;
        montoT:real;
    end;

    listaPacientes = ^nodoPaciente;

    nodoPaciente = record 
        dato:paciente;
        sig:listaPacientes;
    end;
procedure leerAtencion (var a:atencion);{se dispone}
procedure cargarListaAtenciones (var lAtenciones:listaAtenciones; a:atencion);{se dispone}

procedure generarlistaPacientes ( lAtenciones:listaAntenciones;var lPacientes: listaPacientes);
pacie:paciente;
begin
    
    while (lAtenciones <> nil) do
    begin 
        pacie.dni:= lAtenciones^.dato.dniPaciente;
        pacie.cantAtenciones:= 0; 
        pacie.montoT:= 0; 
        while ( lAtenciones <> nil) and (pacie.dni = lAtenciones^.dato.dniPaciente)do 
        begin 
            pacie.cantAtenciones:= pacie.cantAtenciones +1;
            pacie.montoT:= pacie.montoT + lAtenciones^.dato.costoConsul;
            lAtenciones:= lAtenciones^.sig;
        end;
        insertarLista (lPacientes,pacie);

    end;
end;

procedure insertarLista ( var lp:listaPacientes; p:paciente);
nue:listaPacientes;
begin 
    new(nue);
    nue^.dato:= p;
    nue^.sig:= lp;
    lp:= nue;
end;
var
lA:listaAtenciones; lP: listaPacientes;
ate:atencion; 
begin
    lA:= nil; lP:= nil;
    leerAtencion (ate); {se dispone}
    cargarListaAtenciones (lA,ate);{se dipone}
    generarlistaPacientes ( lA,lP);

end;
