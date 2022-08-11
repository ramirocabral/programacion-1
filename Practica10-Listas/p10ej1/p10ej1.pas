program practica10ej1;

const fin=999;

type lista = ^nodo;
     nodo = record 
        datos : integer;
        sig : ^nodo;
    end;

procedure agregarAdelante(var l:lista; n:integer);

var nue:lista;

begin
    New(nue);
    nue^.datos := n;
    nue^.sig := l;
    l := nue;
end;

procedure cargarLista (var l:lista);

var n:integer;

begin
    Readln(n);
    while (n <> fin) do 
    begin
        agregarAdelante(l,n);
        Readln(n);
    end;
end;

procedure writeLista(l:lista);

begin
    while (l <> nil) do
    begin
        Writeln(l^.datos);    
        l := l^.sig;
    end;
end;

{----------A-----------}

function cant3(l:lista):integer;

var cant:integer;

begin
    cant := 0;
    while (l<>nil) do
    begin
        if ((l^.datos < -99) and (l^.datos > -1000)) or ((l^.datos > 99) and (l^.datos<1000)) then
            cant := cant + 1;
        l := l^.sig;
    end;
    cant3 := cant;
end;

function numEnLista (l:lista; num:integer):boolean;

begin
    numEnLista := false;
    while (l <> nil) and (l^.datos <> num) do
        l := l^.sig;
    if (l <> nil) then
        numEnLista := (l^.datos = num);
end;

{-----------C----------}

procedure liberarMem (var l:lista);

var aux:lista;

begin
    while (l <> nil) do
    begin
        aux := l;
        l := l^.sig;
        dispose(aux);
    end;
end;


var l:lista; num:integer;

begin
    l := nil;
    cargarLista(l);
    {Writeln ('Cantidad de numeros con 3 digitos : ', cant3(l));
    writeLista(l);
    Write('Numero a encontrar en la lista : '); Readln(num);
    if (numEnLista(l,num)) then 
        Writeln('El numero se encuentra en la lista')
    else
        Writeln('El numero no se encuentra en la lista');}
    liberarMem(l);
    writeLista(l);
end.
