program practica4ej6;

type suc=record
    canBicis:integer;monto:real;canBicisDef:integer;montoDev:real;
    end;

procedure leerSucursal (var sucursal:suc;var recMes:real);
begin 
    with sucursal do
    begin
        Readln(canBicis);Readln(monto);Readln(canBicisDef);Readln(montoDev);
    end;
    recMes := sucursal.monto - sucursal.montoDev;
end;

procedure procMarzo(monto:real; var recMarzo:real);
begin
    recMarzo := recMarzo + monto;
end;

procedure menorGanancia (num:integer; var menorSuc:integer; monto:real; var montoMenor:real);
begin
    if monto < montoMenor then
    begin
        montoMenor := monto; menorSuc:=num;
    end;
end;

procedure procesarMes(mes:integer; var mesMax:integer; monto:real; var montoMax:real);
begin
    if monto > montoMax then
    begin
        mesMax:=mes; montoMax:=monto;
    end;
end;

procedure sumarMonto(monto:real; var montoTotal:real);
begin
    montoTotal := montoTotal + monto;
end;

var sucursal:suc; montoTotal,recMarzo,montoMes,menorMonto,montoMax:real; menorSuc,mesMax,i,j:integer;

begin
    recMarzo:=0;menorMonto:=9999;menorSuc:=1;
    for i :=1 to 7 do
    begin
        montoMax:=-9999;mesMax:=1;montoTotal:=0;
        for j:= 1 to 12 do
        begin
            leerSucursal(sucursal,montoMes);
            sumarMonto(montoMes,montoTotal);
            procesarMes(j,mesMax,montoMes,montoMax);
            if (j=3) then
                procMarzo(montoMes,recMarzo);
        end;
        Writeln('El mes con mas ventas fue: ',mesMax);
        if (montoTotal<menorMonto) then
        begin
            menorMonto:=montoTotal; menorSuc:=i;
        end;
    end;
    Writeln('La sucursal que menos vendió fe la numero ',menorSuc);
    Writeln('La recaudacionpromedio de marzo fue de:  ',recMarzo/7);
end.
