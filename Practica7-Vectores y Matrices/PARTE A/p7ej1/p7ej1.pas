program practica7ej1;

const cantN=3;

type vectorNum = Array [1..cantN] of integer;

var i:integer;

procedure cargarVector(var v:vectorNum);

begin
    for i:= 1 to cantN do
    begin
        Readln(v[i])
    end;
end;

procedure procVec(var V:vectorNum);
var i:integer; porN,porP,prom:real;
begin
    porP:=0;porN:=0;prom:=0;
    for i:= 1 to cantN do
    begin
        prom := prom + v[i];
        if v[i] >= 0 then
            porP := porP + 1
        else
            porN := porN + 1;
    end;
    prom := prom / cantN; porP := (porP * cantN) / 100; porN := (porN * cantN) / 100;
    Writeln ('Promedio del vector : ',prom);
    Writeln ('Porcentaje de numeros positivos : ',porP,' , Porcentaje de numeros negativos : ',porN);
end;

function puntoC (v:vectorNum):integer;
var i,n1,n2:integer;
begin
    Write('Ingrese el rango de valores : '); Read(n1); Readln(n2);
    puntoC := 0;
    for i := 1 to cantN do
    begin
        if (v[i] > n1 ) and (v[i] <= n2) then
            puntoC := puntoC + 1;
    end;
end;

procedure valMax(v:vectorNum);
var max1,max2,pos1,pos2:integer; 
begin
    max1:=-9999;max2:=-9999;pos1:=0;
    for i:= 1 to cantN do
    begin
        if v[i] > max1 then
        begin
            max2:=max1; pos2:=pos1;
            max1:=v[i]; pos1:=i;
        end
        else if v[i] > max2 then
        begin
            max2:=v[i]; pos2:=i;
        end;
    end;
    Writeln ('Valor maximo : ',max1, ', posicion: ',pos1);
    Write ('Segundo valor maximo : ',max2, ', posicion: ',pos2);
end;

var v:vectorNum;

begin
    cargarVector(v);
    procVec(v);
    puntoC(v);
    valMax(v);
end.