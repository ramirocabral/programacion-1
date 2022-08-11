program practica5ej1;

type cadena15=string[15];
    colectivo=record
    emp:cadena15; linea:integer; pat:cadena15; monto:integer; end;

procedure leerBondi(var col:colectivo);
begin
    with col do
    begin
        Readln(emp);
        if (emp <> 'FIN') then
        begin
            Readln(linea);
            if (linea <> 0 ) then
            begin
                Readln(pat); Readln(monto);
            end;
        end;
    end;
end;

var col:colectivo; montoEmp,montoLinea,linActual:integer; empActual:cadena15;

begin
    leerBondi(col);
    while (col.emp <> 'FIN') do
    begin
        montoEmp:=0; empActual:=col.emp;
        while (col.emp <> 'FIN') and (col.emp = empActual) do
        begin
            montoLinea:=0; linActual:=col.linea;
            while (col.emp <> 'FIN') and (col.emp = empActual) and (col.linea = linActual) do
            begin
                montoLinea := montoLinea + col.monto;
                leerBondi(col);
            end;
            Writeln('El monto recaudado por la linea ',linActual,' es de : ',montoLinea);
            montoEmp := montoEmp + montoLinea;
        end;
            Writeln('El monto recaudado por la empresa ',empActual,' es de : ',montoEmp);
    end;
end.
