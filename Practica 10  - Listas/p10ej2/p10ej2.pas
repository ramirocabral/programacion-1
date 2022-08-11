program practica10ej2;

const fin=0;

type lista = ^nodo;
     nodo = record
        datos : integer;
        sig : lista;
     end;

procedure insAdelante (var l:lista; n:integer);

var nue:lista;

begin
    new(nue);
    nue^.datos := n;
    nue^.sig:=l;
    l:=nue;
end;

procedure cargarLista(var l:lista);

var n:integer;

begin
    Write('Ingrese el numero a agregar : '); Readln(n);
    while (n <> fin) do 
    begin
        insAdelante(l,n);
        Write('Ingrese el numero a agregar : '); Readln(n);
    end;
end;

function numMayor (l:lista):integer;

var max:integer;

begin
    max := -9999;
    while (l <> nil) do
    begin
        if (l^.datos > max) then
            max := l^.datos;
        l := l^.sig;
    end;
    numMayor := max;
end;

function contarDig (num:integer):integer;

begin
    contarDig := 0;
    while (num <> 0) do
    begin
        contarDig := contarDig + 1;
        num := num div 10;
    end;
end;

function digImpar(l:lista):integer;

begin
    digImpar := 0;
    while (l <> nil) do
    begin
        if (contarDig(l^.datos) mod 2) <> 0 then
            digImpar := digImpar + 1;
        l := l^.sig;
    end;
end;

procedure numPares (l:lista; var numAct,numAnt:integer);

begin
    numAct := 1;
    numAnt := 1;
    while (l <> nil) and ((numAnt = 1) or (numAct = 1)) do
    begin
        if (l^.datos mod 2 = 0) then
        begin
            numAnt := numAct;
            numAct := l^.datos;
        end;
        l := l^.sig;
    end;
end;

var l:lista; numAct,numAnt:integer;

begin
    cargarLista(l);
    Writeln('Mayor numero leido : ', numMayor(l));
    Writeln('Numeros cuya cantidad de digitos es impar : ',digImpar(l));
    numPares(l,numAct,numAnt);
    Writeln('Los dos ultimos numeros pares de la lista son : ',numAnt, ', ',numAct);
end.