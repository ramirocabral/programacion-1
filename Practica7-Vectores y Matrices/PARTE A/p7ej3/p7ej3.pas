{Realizar un programa que lea de teclado un vector de 600 caracteres. Finalizada la carga informar:
a) La cantidad y porcentaje de consonantes sobre el total de caracteres alfabéticos.
b) La cantidad y porcentaje de caracteres que son dígitos, letras mayúsculas, letras minúsculas
sobre el total de caracteres ingresados.}

program practica7ej3;

const   cantCar=600;

type    conjCar = set of char;
        vector= array[1..cantCar] of char;
    
procedure cargarVector (var v:vector);
var i:integer;
begin
    for i:= 1 to cantCar do
        Readln(v[i]);
end;

procedure puntoA(v:vector; con,conjAlf:conjCar; var cantCon,cantAlf:integer);
var i:integer;

begin
    cantCon:=0; cantAlf:=0;
    for i:= 1 to cantCar do
    begin
        if (v[i] in conjAlf) then
        begin
            cantAlf := cantAlf + 1;
            if (v[i] in con) then
                cantCon := cantCon + 1;
        end;
    end;
end;

procedure puntoB(v:vector; var cantB:integer; conjB:conjCar);
var i:integer;
begin
    cantB:=0;
    for i:= 1 to cantCar do
    begin
        if (v[i] in conjB ) then
            cantB := cantB + 1;
    end;
end;

var v:vector; cantB,cantCon,cantAlf:integer; conjB,conjAlf,con:conjCar;

begin
    conjAlf := ['A'..'z']; con := conjAlf - ['a','e','i','o','u','A','E','I','O','U'];
    conjB := conjAlf + ['0'..'9'];
    cargarVector(v);
    puntoA(v,con,conjAlf,cantCon,cantAlf);
    puntoB(v,cantB,conjB);
    Writeln((cantCon*100)/cantAlf);
    Writeln((cantB*100)/cantCar);
end.