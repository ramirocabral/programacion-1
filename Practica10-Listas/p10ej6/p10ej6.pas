program practica10ej6;

const
    cantCajas=6;

type
    subCajas=1..cantCajas;
    ticket = record
        nCaja:subCajas;
        nroTicket:integer;
        monto:real;
    end;
    lista = ^nodo;
    nodo = record   
        datos:ticket;
        sig:lista;
    end;

    cajasLista = set of subCajas;

    regCaja = record
        montoTot:real;
        tickets:integer;
    end;
    vCajas = array [1..cantCajas] of regCaja;

{INICIALIZO EL VECTOR CON LOS DATOS DE LAS 6 CAJAS}

procedure cargarLista(var l:lista);

    procedure insertarAdelante(var l:lista; t:ticket);

    var nue:lista;

    begin
        new(nue);
        nue^.datos := t;
        nue^.sig:=l;
        l:=nue;
    end;

var t:ticket;

begin
    with t do
    begin
        Write('Ingrese el monto del ticket: '); Readln(monto);
        while (monto <> -1) do
        begin
            Write('Ingrese el numero de ticket: '); Readln(nroTicket);
            Write('Ingrese el numero de caja: '); Readln(nCaja);
            insertarAdelante(l,t);
            Write('Ingrese el monto del ticket: '); Readln(monto);
        end;
    end;    
end;


procedure inicVectorCajas (var v:vCajas);

var i:integer;

begin
    for i:= 1 to cantCajas do
    begin
        v[i].montoTot:=0;
        v[i].tickets:=0;
    end;
end;

{LLENAR LAS LISTAS DE LOS INCISOS A Y C}

procedure agregarAdelante (var l:lista; data:ticket);

var nue:lista;

begin
    new(nue);
    nue^.datos := data;
    nue^.sig := l;
    l := nue;
end;

{MODULO PRINCIPAL PARA PROCESAR LA LISTA POR PRIMERA VEZ}

procedure procesarLista(l:lista; var l2:lista; var montoProm:real; var v:vCajas);

var cantTickets:integer;

begin
    cantTickets:=0; montoProm:=0;
    while (l <> nil) do
    begin
        if (l^.datos.monto < 1000) then
            agregarAdelante(l2,l^.datos);
        cantTickets := cantTickets + 1;
        montoProm := montoProm + l^.datos.monto;
        v[(l^.datos.nCaja)].tickets := v[(l^.datos.nCaja)].tickets + 1;
        v[(l^.datos.nCaja)].montoTot := v[(l^.datos.nCaja)].montoTot + l^.datos.monto;
        l := l^.sig;
    end;
    montoProm := montoProm / cantTickets;
end;

{AGREGO LAS CAJAS QUE CUMPLEN LA CONDICION A UN CONJUNTO PARA LLENAR LA LISTA DEL INCISO D}

procedure procesarCajas(v:vCajas; var conjCajas:cajasLista);

var i:integer;

begin
    conjCajas := [];
    for i:= 1 to cantCajas do
    begin
        if (v[i].montoTot > 12000) and (v[i].tickets < 100) then
            conjCajas := conjCajas + [i];
    end;
end;

{RECORRO LA LISTA MAIN POR SEGUNDA VEZ PARA CREAR LA LISTA DEL INCISO D}

procedure procesarLista2 (l:lista; var l3:lista; conjCajas:cajasLista);

begin
    begin
        while (l <> nil) do
        begin
            if ((l^.datos.nCaja) in conjCajas) then
                agregarAdelante(l3,l^.datos);
            l:=l^.sig;
        end;
    end;
end;

procedure imprimirLista(l:lista);

begin
    while (l <> nil) do
    begin
        Writeln(l^.datos.nCaja, ' ,',l^.datos.nroTicket, ', ',l^.datos.monto, '.');
        l:=l^.sig;
    end;
end;

var l,l2,l3:lista; v:vCajas; conjCajas:cajasLista; montoProm:real;

begin
    l := nil; l2:=nil; l3:=nil;
    cargarLista(l);
    imprimirLista(l);
    inicVectorCajas(v);
    procesarLista(l,l2,montoProm,v);
    Write('El monto promedio recaudado pot ticket es de : ',montoProm);
    procesarCajas(v,conjCajas);
    procesarLista2(l,l3,conjCajas);
    imprimirLista(l3);
end.