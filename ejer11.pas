{se lee info de productos. de cada prod se lee codigo de producto, nombre del rubro y stock.
se pide realizar un programa que genere una estructura donde se almacene, para cada rubro leido:
su nombre, cantidad de productos del rubro y stock total, para los prod con stock distinto de cero.
la lectura finaliza cuando se lee el codigo-1 y la lectura viene ordenada por nombre del rubro.}

program ejer11;

type 
    producto = record 
        codigo:integer;
        nombreRubro:string;
        stock:integer;
    end;

    rubro = record 
        nombre:string;
        cantProd:integer;
        stockTotal:integer;
    end;

    listaRubros = ^nodoRubros

    nodoRubros = record 
        dato:rubro;
        sig:listaRubros;
    end;

procedure leerProducto ( var prod:producto);
begin 
    readln(prod.codigo);
    if (prod.codigo <> -1) then 
    begin 
        readln (prod.nombreRubro);
        readln (prod.stock);
    end;
end;

procedure agregarAlista (var lista:listaRubros; r:rubro);
var
nue:listaRubros;
begin 
    new (nue);
    nue^.dato:= rubro;
    nue^.sig:= lista;
    lista:= nue;
end;

procedure generarEstructura ( var lr:listaRubros);
var
 p:producto;
 r:rubro;
begin 
    leerProducto(p);// leo un producto
    while ( p.codigo <> -1) do 
    begin 
        //creo un tipo rubro y inicializo en cero el stock y cant prod
        r.nombre:= p.nombreRubro;
        r.cantProd:= 0; 
        r.stockTotal:=0;
        // si el prod tiene codigo distinto de -1 yle nombre es el mismo al rubro arranco el corte de control
        while (p.codigo <> -1) and ( p.nombreRubro = r.nombre) do 
        begin
            if (p.stock <> 0) then // sumo solo si tiene stock dintitno de cero 
            begin 
                r.cantProd:= r.cantProd +1 ;
                r.stockTotal:= p.stock; 
                
            end;
            // leo otro para volver a evaluar en el corte de control si seguir agregando al rubro o paso de rubro
            leerProducto (p);
        end;
        // cuando no hubo mas productos de ese rubro que estaba incrementando o el codigo fue -1 
        agregarAlista (lr,r);// agego a la lista de rubros ese rubro que venia iterando

    end;

end;

var 
 lr:listaRubros;
begin
    lr:= nil;
    generarEstructura (lr);


end.