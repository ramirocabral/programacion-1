program practica5ej2;

type empleado = record
    DNI:integer; sueldo:integer; depto:integer; suc:integer; end;

procedure leerEmpleado(var emp:empleado);
begin
    with emp do
    begin
        Readln(suc);
        if (suc <> -1) then
            begin
                Readln(depto);Readln(DNI);Readln(sueldo);
            end;
    end;
end;

procedure procDepto(monto,suc,depto:integer; var monto1,suc1,depto1,monto2,suc2,depto2:integer);
begin
    if monto > monto1 then
    begin
        suc2:=suc1; depto2:=depto1; monto2:=monto1;
        suc1:=suc; depto1:=depto; monto1:=monto;
    end
    else if monto > monto2 then
    begin
        suc2:=suc; depto2:=depto; monto2:=monto;
    end;
end;

var emp:empleado; montoDepto,montoSuc,monto1,suc1,depto1,monto2,suc2,depto2,sucActual,deptoActual:integer;

begin
    monto1:=0;suc1:=0;depto1:=0;
    leerEmpleado(emp);
    while (emp.suc <> -1) do
    begin
        sucActual:=emp.suc; montoSuc:=0;
        while (emp.suc <> -1) and (emp.suc = sucActual) do
        begin
            deptoActual:=emp.depto; montoDepto:=0;
            while (emp.suc <> -1) and (emp.suc = sucActual) and (emp.depto = deptoActual) do
            begin
                montoDepto := montoDepto + emp.sueldo;
                leerEmpleado(emp);
            end;
            montoSuc := montoSuc + montoDepto;
            procDepto(montoDepto,sucActual,deptoActual,monto1,suc1,depto1,monto2,suc2,depto2);
        end;
        Writeln('Sucursal numero ',sucActual,' monto de sueldos: ',montoSuc);
    end;
    Writeln('Mayor monto de sueldos: ',suc1, ' ',depto1);
    Writeln('Segundo mayor monto de sueldos: ',suc2, ' ',depto2);
end.