{Un banco cuenta con 6 cajas. Implementar un programa que lea monto de los depósitos y nº de caja
hasta que se ingresa la caja con número 0. Acumule, para cada caja, el monto total. Finalizada la
carga informar el nº de caja que más recaudó y el promedio de caja.}

program practica7ej2;

const cantCajas=3;

type cajas=0..cantCajas;
    depositos=record monto:real; caja:cajas; end;
    vector = array [1..cantCajas] of real;

procedure InicVec(var v:vector);
var i:integer;
begin
    for i:= 1 to cantCajas do
        v[i] := 0;
end;

procedure cargarVector(var v:vector ; var dep:depositos);

procedure leerDep(var dep:depositos);
begin
    Readln(dep.caja);
    if dep.caja <> 0 then
        Readln(dep.monto);
end;

begin
    Readln(dep.caja);Readln(dep.monto);
    while (dep.caja <> 0) do
    begin
        v[dep.caja] := dep.monto;
        leerDep(dep);
    end;
end;

procedure procCajas(var v:vector; var cajaMax,promCaja:real; var nCajaMax:integer);
var i:integer;
begin
    promCaja:=0;cajaMax:=-9999;nCajaMax:=0;
    for i:= 1 to cantCajas do
    begin
        if (v[i] > cajaMax) then
        begin
            cajaMax := v[i]; nCajaMax := i;
        end;
        promCaja := promCaja + v[i];
    end;
    promCaja := promCaja / cantCajas;
end;

var v:vector; dep:depositos; nCajaMax:integer; cajaMax,promCaja:real;

begin
    InicVec(v);
    cargarVector(v,dep);
    procCajas(v,cajaMax,promCaja,nCajaMax);
    Writeln('Promedio de monto por caja : ',promCaja);
    Write ('Numero de caja con mayor monto : ',nCajaMax);
end.

