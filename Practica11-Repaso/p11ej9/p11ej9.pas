program practica11ej9;

const cantPaquetes=300;

type
    cadena20=string[20];
    cliente = record
        num:integer;
        nom:cadena20;
        ap:cadena20;
        dom:cadena20;
        DNI:integer;
    end;

    //lista con la informacion de los clientes
    lista=^nodo;

    nodo=record
        datos:cliente;
        sig:lista;
    end;

    //vector con los datos de los 300 paquetes

    paquete = record
        destino:cadena20;
        plazas:integer;
    end;

    vector = array [1..cantPaquetes] of paquete;

    //registro para los pedidos

    pedido=record
        dni:integer;
        cod:integer;
        cant:integer;
    end;

function pertenece(l:lista; dni:integer):boolean;
begin
    while (l <> nil) and (l^.datos.DNI <> dni) do
        l := l^.sig;
    pertenece := (l <> nil);
end;

procedure leerPedidos(l:lista; var v:vector; var porDNI,porPlazas:integer);

var p:pedido;

begin
    porDNI:=0; porPlazas:=0;
    Readln(p.dni);
    while (p.dni <> 0) do
    begin
        Readln(p.cod);
        Readln(p.cant);
        if (pertenece(l,dni)) and ((v[p.cod]-p.cant) >= 0) then
            v[p.cod] := v[p.cod] - p.cant
        else if (not pertenece(l,dni)) then
            porDNI := porDNI + 1
        else 
            porPlazas := porPlazas + 1;
        Readln(p.dni);
    end;
end;

procedure maximos(v:vector);

var i,cod1,cod2,max1,max2:integer;

begin
    max1:=-9999; max2:=-9999; cod1:=0;cod2:=0;
    for i:=1 to cantPaquetes do
    begin
        if (v[i] > max1) then
        begin
            max2:=max1; cod2:=cod1;
            max1:=v[i]; cod1:=i;
        end
        else if (v[i] > max2) then
        begin
            max2:=v[i]; cod2:=i;
        end;
    end;
    Writeln('Codigo con mayor cantidad de plazas disponibles: ',cod1);
    Writeln('Segundo codigo con mayor cantidad de plazas disponibles: ',cod2);
end;

var l:lista; v:vector; porDNI,porPlazas:integer;

begin
    porDNI:=0; porPlazas:=0;
    leerPedidos(l,v,porDNI,porPlazas);
    maximos(v);
end.
