program practica10ej3;

type cadena15 = string[15];
     lugar = record
        nombre : cadena15;
        pais : cadena15;
     end;

     lista = ^nodo;
     nodo = record
        datos : lugar;
        sig : lista;
     end;

     lista2 = ^nodo2;
     nodo2 = record
        nombre : cadena15;
        sig:lista2;
     end;

procedure cargarLista (var l:lista);

var nue:lista;

begin
    new(nue);
    Readln(nue^.datos.pais);
    Readln(nue^.datos.nombre);
    while (nue^.datos.pais <> 'brasil') do 
        begin
            nue^.sig := l;
            l := nue;
            new(nue);
            Readln(nue^.datos.pais);
            Readln(nue^.datos.nombre);
        end;
end;

{----------------A-------------}

function long (l:lista):integer;


begin
    long := 0;
    while (l <> nil) do 
    begin
        long := long + 1;
        l := l^.sig;
    end;
end;

{-----------------B-------------------}

function cantPais (l:lista; p:cadena15):integer;

begin
    cantPais := 0;
    while (l <> nil) do
    begin
        if (l^.datos.pais = p) then
            cantPais := cantPais + 1;
        l := l^.sig;
    end;
end;

{----------------C/D----------------------}

procedure insAdelante (var l:lista2; p:cadena15);

var nue:lista2;

begin
    new(nue);
    nue^.nombre := p;
    nue^.sig := l;
    l := nue;
end;

procedure insertarDetras {( ͡° ͜ʖ ͡°)} (var l:lista2; lug:cadena15);

var nue,act:lista2;

begin
    new(nue);
    nue^.nombre := lug;
    nue^.sig := nil;
    if (l <> nil) then
    begin
        act := l;
        while (act^.sig <> nil) do
            act := act^.sig;
        act^.sig := nue;
    end
    else
        l := nue;
end;

procedure agregarLugar (var l:lista2);

var lug:cadena15;

begin
    Write('Ingrese el nombre del lugar al que desea agregar a la lista : '); Readln(lug);
    insertarDetras(l,lug);
end;


procedure listarPais (l:lista; paisLista:cadena15; var listaPais:lista2);

begin
    while (l <> nil) do
    begin
        if (l^.datos.pais = paisLista) then
            insAdelante(listaPais,l^.datos.nombre);
        l := l^.sig;
    end;
    if (listaPais = nil) then
        dispose(listaPais)
    else 
        agregarLugar(listaPais);
end;


var l:lista; listaPais:lista2; p,paisLista:cadena15;

begin
    l := nil;
    cargarLista(l);
    Writeln('Longitud de la lista de lugares turisticos : ',long(l));
    Write ('Ingrese el pais del que desea conocer la cantidad de apariciones en la lista : '); 
    Readln(p);
    Writeln ('Cantidad de apariciones de ', p ,' : ', cantPais(l,p));
    Write ('Ingrese el nombre del pais con el que desea generar una lista de sus lugares turisticos : ');
    Readln(paisLista);
    listarPais(l,paisLista,listaPais);
end.