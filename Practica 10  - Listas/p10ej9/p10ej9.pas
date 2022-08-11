program practica10ej9;

type
    subrCat=1..4;subrVuelo=1..30;

    cadena15=string[15];

    montos = array[1..30;1..4] of real;
    venta = record
        nombre:cadena15;
        codVuelo:subrVuelo;
        cat:subrCat;
        asiento:integer;
    end;

    lista = ^nodo
    nodo = record
        datos:venta;
        sig:lista;
    end;

    vuelo = record
        cod:integer;
        pasajesTotales:integer;
        montoTotal:integer;
    end;

    lista2 = ^nodo2
    nodo2 = record
        datos:vuelo;
        sig:lista2;
    end;

    {vector para el inciso b}
    v = array [1..5] of integer;


procedure agregarDelantel2 (var l2:lista; cod,pasajesTot:integer ,montoTot:real);

var nue:lista2;

begin
    new(nue);
    nue^.datos.pasajesTotales:=pasajesTot;
    nue^.datos.montoTotal := montoTot;
    nue^.sig:=l2;
    l2:=nue;
end;

procedure procesarLista (l:lista; var l2,;l3:lista2);

var montoTot:real; pasajesTot:integer; codActual:integer; 

begin
    while (l <> nil) do
    begin
        codActual:=l^.datos.codVuelo;
        montoTot:=0; pasajesTot:=0;
        while (l <> nil) and (l^.datos.codVuelo = codActual) do
        begin
            montoTot := montoTot + (montos[l^.datos.codVuelo;l^.datos.cat]);
            pasajesTot := pasajesTot + 1;
            l := l^.sig;
        end;
        agregarDelantel2(l2,codActual,pasajesTot,montoTot);
        if (pasajesTot > 46) then
            insertarLista(l3,codActual,pasajesTot,montoTot);
    end;
end;

procedure inicVecVuelos(var vCodigos:v);

var i:integer;

begin
    for i:= 1 to 5 do
        vCodigos[i]:=-9999;
end;

procedure insertarVector (var vCodigos:v, num,pos:integer);

var j:integer;

begin
    for j:= 5 down to pos+1 do
        v[j] ;= v[j-1];
    v[pos] := num;
end;

procedure vuelosMasVendidos (l2:lista2; var vCodigos:v);

var pos:=integer;

begin
    inicVecVuelos(vCodigos);
    while (l2 <> nil) do
    begin
        pos:=1;
        while (pos <= 5) and (l2^.datos.montoTotal < v[pos]) do
            pos := pos + 1;
        if (pos <= 5) and (l2^.datos.montoTotal > v[pos]) do
            insertarVector (vCodigos,l2^.datos.montoTotal,pos);
    end;
end;

procedure imprimirVector(vCodigos:v);

var i:integer;

begin
    for i:= 1 to 5 do
        Writeln(v[i]);
end;

procedure insertarLista (l:lista2; codActual,pasajesTot:integer; montoTot:real);

var nue,act,ant:lista2;

begin
    new(nue);
    nue^.datos.cod:=codActual;
    nue^.datos.pasajesTotales:=pasajesTot;
    nue^.datos.montoTotal:=montoTotal;
    act:=l;
    while(act <> nil) and (data.montoTotal > act^.datos.montoTotal) do
        ant := act;
        act := act^.sig;
    if (act <> nil) then
        ant^.sig := act^.sig
    else
        l := nue;
    nue^.sig := act;
end;

var l:lista; l2,l3:lista2; 

begin
    l2:=nil;
    l3:=nil;
    procesarLista(l,l2,l3);
    vuelosMasVendidos(l2,vCodigos);
    Writeln('Vuelos mas vendidos: ');
    imprimirVector(vCodigos);
end.