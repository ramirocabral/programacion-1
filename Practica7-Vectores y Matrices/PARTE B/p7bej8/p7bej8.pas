program practica7bej8;

const empMax=800; cantOf=20; 

type rangoEmp=0..empMax; rangOf=1..cantOf; cadena15=string[15]; dias=1..31; meses=1..12; anios=1900..2022;

     fecha = record {registro para fecha de nacimiento de cada empleado}
        dia : dias;
        mes : meses;
        anio : anios;
     end;

     vOficina = array [1..cantOf] of integer; {vector para contar la cantidad de empleados por oficina}

     nomYAp = record {registro para leer nombre y apellido del empleado}
        nom : cadena15;
        ap : cadena15;
     end;

     empleado = record {registro con los datos de cada empleado}
        DNI : integer;
        nombre : nomYAp;
        nac : fecha;
        nOf : rangOf;
     end;

     vEmp = array [1..empMax] of empleado;

     vOf1 = array [1..empMax] of nomYAp; {cuenta nombre y apellido de empleados de oficina 1}


procedure inicVecOf(var v:vOficina);

var i:integer;

begin
    for i:= 1 to cantOf do
        v[i] := 0;
end;

procedure informarEmpOf(v:vOficina);

var i:rangOf;

begin
    for i:= 1 to cantOf do
    begin
        Writeln ('Empleados de la oficina ',i, ' : ',v[i]);
    end;
end;

procedure leerEmp (var v:vEmp; var dimL:rangoEmp; var emp:empleado);

begin
    Write ('Ingrese el DNI : '); Readln(emp.DNI);
    if (emp.DNI <> 0 ) then
    begin
        with emp do
        begin
            Write ('Ingrese el apellido : '); Readln(nombre.ap);
            Write ('Ingrese el nombre : '); Readln(nombre.nom);
            Write ('Ingrese el dia, mes y anio de nacimiento : '); Readln(nac.dia);
                Readln(nac.mes); Readln(nac.anio);
            Write ('Ingrese el numero de oficina : '); Readln(nOf);
        end;
        dimL := dimL + 1;
        v[dimL] := emp;
    end;
end;


procedure cargarOf1 (var v:vOf1; var dimL:rangoEmp; nombre:nomYAp);

begin
    v[dimL + 1] := nombre;
    dimL := dimL + 1;
end;

procedure informarOf1(v:vOf1;dimL:rangoEmp);

var i:rangoEmp;

begin
    Writeln('Empleados de la oficina 1: ');
    for i:= 1 to dimL do
    begin
        Write(v[i].nom, ' ');
        Writeln(v[i].ap);
    end;
end;

procedure procesarEmp(var vOf:vOficina; var vOfic1:vOf1; var dimLOf1,cantM:rangoEmp; emp:empleado; m:meses);

begin
    vOf[emp.nOf] := vOf[emp.nOf] + 1;
    if (emp.nOf = 1) then
        cargarOf1(vOfic1,dimLOf1,emp.nombre);
    if (emp.nac.mes = m) then
        cantM := cantM + 1;
end;


var vecEmp:vEmp ;vOf:vOficina; vOfic1:vOf1; emp:empleado; dimLEmp,dimLOf1,cantM:rangoEmp; m:meses;

begin
    inicVecOf(vOf); cantM:=0; dimLEmp:=0; dimLOf1:=0; 
    Write('Ingrese el mes del que desea saber la cantidad de empleados : '); Readln(m);
    leerEmp(vecEmp,dimLEmp,emp);
    while (dimLEmp < empMax) and (emp.dni <> 0) do
    begin
        procesarEmp(vOf,vOfic1,dimLOf1,cantM,emp,m);
        leerEmp(vecEmp,dimLEmp,emp);
    end;
    Writeln();
    informarOf1(vOfic1,dimLOf1);
    informarEmpOf(vOf);
    Writeln('Cantidad de empleados nacidos en el mes ', m, ': ', cantM);
end.