program practica10ej10;

type
    codPlatos = 1..100;

    cadena15=string[15];
    
    clientes = record
        codCliente:integer;
        nombre:cadena15;
        apellido:cadena15;
        domicilio:cadena15;
        telefono:integer; 
    end;

    lsClientes = ^nodo;
    nodo = record   
        datos:clientes;
        sig:clientes;
    end;

    platos = record 
        nom:cadena15;
        stock:integer;
    end;

    vPlatos = array [1..codPlatos] of platos;

    pedido = record
        codCl:integer;
        codPlato:codPlatos;
        cant:integer;
    end;

procedure leerPedidos (var p:pedido);

begin
    with p do 
    begin
        Readln(codCl);
        if (codCl <> -1) then
        begin
            Write('Ingrese el codigo del plato que desea: '); Readln(codPlato);
            Write('Ingrese la cantidad que desea: '); Readln(cant);
        end;
    end;

end;

function codEnLista (cod:integer; l:lsClientes):boolean;

begin
    codEnLista := false;
    while (l <> nil) and (codEnLista = false) do
    begin
        codEnLista := (cod = l^.datos.codCliente);
        if (not codEnLista) then
            l := l^.sig;
    end;
end;

procedure procesarPedidos (var p:pedido; var v:vPlatos; l:lsClientes);

var exito:boolean;

begin
    leerPedidos(p);
    while (p.codCliente <> -1) do
    begin
        exito := false;
        if (codEnLista(p.codCl)) and (((v[p.cod].stock) - p.cant) >= 0) then
            begin
                exito := true;
                v[p.cod].stock := v[p.cod].stock - p.cant;
                Writeln ('La venta se realizo correctamente.');
            end;
        leerPedidos(p);
    end;
end;

procedure procesarStock (v:vPlatos);

i:integer;

begin
    Write('Los platos sin stock son: ');
    for i:= 1 to 100 do
    begin
        if (v[i].stock = 0) then
            Write (v[i].nom, '; ');
    end;
end;


var l:lsClientes; v:vPlatos; p:pedido;

begin
    procesarPedidos(p,v,l);
    procesarStock(v,conj);
end.
