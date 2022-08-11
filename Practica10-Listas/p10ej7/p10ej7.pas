program practica10ej7;

type 
    cadena15:string[15];
    jubilado = record
        nombre:cadena15;
        apellido:cadena15;
        monto:real;
        dni:integer;
    end;

    lista = ^nodo;
    nodo = record  
        datos:jubilado;
        sig:lista;
    end;

    vectorListas = record [1..10] of lista;

procedure inicVectorListas(var v:vListas);

var i:integer;

begin
    for i:= 1 to 10 do
        v[i] := nil;
end;

procedure insertarAtras {( ͡~ ͜ʖ ͡°)} (var l:lista; data:jubilado);

var act,nue:lista;

begin
    new(nue);
    nue^.datos := data;
    nue^.sig := nil;
    if (l <> nil) then
    begin
        act:=l;
        while (act^.sig <> nil) do
            act := act^.sig;
        act^.sig := nue;
    end
    else
        l := nue;
end;

procedure cargarListas (l:lista; var vListas:vectorListas);

var digito:integer;

begin
    digito := 0;
    while (l <> nil) do
    begin
        digito := l^.datos.dni mod 10;
        insertarAtras(v[digito],l^.datos);
        l := l^.sig;
    end;
end;

var l:lista; vListas:vectorListas;

begin{
    l := nil;
    Se dispone:
    cargarLista(l);
    }
    inicVectorListas(vListas);
    cargarListas(l,vListas);
end.