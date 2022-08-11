program practica10ej8;

type
    cadena15=string[15];
    empleado=record
        nombre:cadena15;
        apellido:cadena15;
        profesion:cadena15;
        codEmp:integer;
        codDep:integer;
        sueldo:real;
        antiguedad:integer;
    end;

    lista = ^nodo;
        nodo=record
        datos:empleado;
        sig:lista;
    end;

procedure insertarEmp (var l:lista; data:empleado);

var nue,act,ant:lista;

begin
    new(nue);
    nue^.datos := data;
    act := l;
    while (act <> nil) and (data.codEmp > act^.datos.codEmp) do
    begin
        ant := act;
        act := act^.sig;
    end;
    if (act <> nil) then
        ant^.sig := nue
    else 
        l:=nue;
    nue^.sig := act;
end;

{-------------------B-------------------}

procedure eliminarEmp(var l:lista)

var act,ant:lista;

begin
    act:=l;
    while (act <> nil) do
    begin
        while (act <> nil) and (act.datos.codDep <> 4) and (act.datos.codDep <> 10) do
        begin
            ant := act;
            act:=act^.sig;
        end;
        if (act < > nil) then
        begin
            if (act <> l) then
                ant^.sig := act^.sig
            else
                l := ant^.sig;
            dispose(act);
            act := ant^.sig;
        end;
    end;
end;
