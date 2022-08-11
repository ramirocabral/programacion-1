program practica7ej9;

const   dimF=5; fin=9999;

type    vector = array [1..dimF] of integer;

procedure cargarVector(var v:vector; var dimL:integer);
begin
    dimL:=0;
    while (dimL<dimF) and (v[dimL]<>fin) do
    begin
        dimL:=dimL + 1; Readln(v[dimL]);    
    end;
end;

procedure infImpar(v:vector; dimL:integer);
var i:integer;
begin
    i:=1;
    while (i<dimL) do
    begin
        write(v[i],' , ');
        i := i + 2;
    end;
end;

function elemPar(v:vector; dimL:integer):integer;
var i:integer;
begin
    elemPar:=0; i:=1;
    while (i<=dimL) and (elemPar=0) do
    begin
        if (v[i] mod 2 = 0) then
            elemPar := i;
        i := i + 1;
    end;
end;

var v:vector; dimL:integer;

begin
    cargarVector(v,dimL);
    infImpar(v,dimL);
    Writeln('Posicion del primer elemento par : ',elemPar(v,dimL));
end.