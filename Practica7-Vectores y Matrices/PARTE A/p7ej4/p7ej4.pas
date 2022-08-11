program practica7ej3;

const   cantCar=600; fin='.';

type    conjCar = set of char;
        vector= array[1..cantCar] of char;
    
procedure cargarVector (var v:vector; var dimL:integer);
begin
    Readln(v[1]); dimL:=1;
    while (v[dimL] <> fin) and (dimL < cantCar) do
        dimL := dimL + 1;
        Readln(v[dimL]);
end;

procedure puntoA(v:vector; con,conjAlf:conjCar;var cantCon,cantAlf:integer;dimL:integer);
var i:integer;

begin
    cantCon:=0; cantAlf:=0;
    for i:= 1 to dimL do
    begin
        if (v[i] in conjAlf) then
        begin
            cantAlf := cantAlf + 1;
            if (v[i] in con) then
                cantCon := cantCon + 1;
        end;
    end;
end;

procedure puntoB(v:vector; var cantB:integer; conjB:conjCar;dimL:integer);
var i:integer;
begin
    cantB:=0;
    for i:= 1 to dimL do
    begin
        if (v[i] in conjB ) then
            cantB := cantB + 1;
    end;
end;

var v:vector; dimL,cantB,cantCon,cantAlf:integer; conjB,conjAlf,con:conjCar;

begin
    conjAlf := ['A'..'z']; con := conjAlf - ['a','e','i','o','u','A','E','I','O','U'];
    conjB := conjAlf + ['0'..'9'];
    cargarVector(v,dimL);
    puntoA(v,con,conjAlf,cantCon,cantAlf,dimL);
    puntoB(v,cantB,conjB,dimL);
    Writeln((cantCon*100)/cantAlf);
    Writeln((cantB*100)/cantCar);
end.