program practica10ej4;

type 
    cadena15 = string[50];
    avion = record
        marca : cadena15;
        modelo : integer;
        asientos : integer;
    end;

    lista = ^nodo;
    nodo = record
        datos : avion;
        sig : lista;
    end;


procedure cargarLista (var l:lista);

var av:avion;

    procedure agregarDelante(var l:lista; data:avion);

    var nue:lista;

    begin
        new(nue);
        nue^.datos:=data;
        nue^.sig:=l;
        l:=nue;
    end;


begin
    with av do
    begin
        Write('Ingrese la marca del avion'); Readln(marca);
        while (marca <> 'qwe') do
        begin
            Write ('Ingrese el modelo del avion');Readln(modelo);
            Write('Ingrese la cantidad de asientos del avion'); Readln(asientos);
            agregarDelante(l,av);   
            Write('Ingrese la marca del avion'); Readln(marca);
        end;
    end;
end;


procedure agregarDelante (var l:lista; av:avion);

var ant,act,nue:lista;

begin
    new(nue);
    nue^.datos := av;
    act := l;
    while (act <> nil) and (act^.datos.marca > av.marca) do
    begin
        ant := act;
        act := act^.sig;
    end;
    if (act = l) then
        l := nue
    else 
        ant^.sig := nue;
    nue^.sig := act;
end;


procedure elimAvion (var l:lista; av2:avion; var ok:boolean);

var ant,act:lista;

begin

    ok := false;
    act := l;
    while ((act <> nil) and (act^.datos <> av2)) do 
    begin
        ant := act;
        act := act^.sig;
    end;
    if (act <> nil) then
    begin
        ok := true;
        if (act = l) then
            l := act^.sig
        else
            ant^.sig := act^.sig;
        dispose (act);
    end;
end;

procedure imprimirLista(l:lista);

begin
    while (l <> nil) do
    begin
        Write(l^.datos.marca,', ',l^.datos.modelo, ', ', l^.datos.asientos);
        l := l^.sig;
    end;
end;

var av2:avion; l:lista; ok:boolean;

begin
    l:=nil;
    cargarLista(l);
    imprimirLista(l);
    Readln(av2.marca); Readln(av2.modelo); Readln(av2.asientos);
    elimAvion(l,av2,ok);
    if (ok) then
        Writeln('La eliminacion se realizo correctamente');
    imprimirLista(l);
end.