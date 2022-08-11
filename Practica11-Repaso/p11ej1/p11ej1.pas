//SIN PROBAR
program practica11ej1;


type 
    cadena15 = string[15];
    cliente = record
        DNI:integer;
        nom:cadena15;
        ap:cadena15;
        codImp:integer;
        monto:real;
    end;

    lista = ^nodo;
    nodo = record
        datos:cliente;
        sig:lista;
    end;

    //vector para contar la cantidad de apariciones de cada codigo

    vector = array [1..9] of integer;

procedure inicVector (var v:vector);

var i:integer;

begin
    for i:= 1 to 9 do
        v[i] := 0;
end;

procedure procesarLista(l:lista, var cant:integer);

var rec:real;

begin
    rec := 0;
    while (l <> nil) and (rec <= 100000) do
    begin
        rec := l^.datos.monto;
        v[l^.datos.codImp] := v[l^.datos.codImp] + 1;
        l := l^.sig;
    end; 
    while (l <> nil) do
    begin
        cant := cant + 1;
        l := l^.sig;
    end;
end;

procedure procesarVector(v:vector);

var i,codMax,max:integer;

begin
    max := -1;
    for i:= 1 to 9 do
    begin
        if (v[i] > max) then
        begin
            codMax := i;
            max := v[i];
        end;
    end;    
    if (max <> -1) then
        Writeln('El codigo de impuesto que mas se pago es: ',codMax);
end;


var v:vector; l:lista; sinAtender:integer;

begin
    l := nil; sinAtender:=0;
    //se dispone: cargarLista(l);
    inicVector(v);
    procesarLista(l,sinAtender);
    Writeln('Cantidad de clientes sin atender: ',sinAtender);
    procesarVector(v);
end.