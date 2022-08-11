{program practica4ej1;

type
    lados = record
    ancho:real; altura:real; profundidad:real;
    end;
var
    prisma:lados;

function volumen(l:lados):real;
begin
    with l do
    begin
        volumen := (ancho * profundidad)*altura;
    end;
end;

function area(l:lados):real;
begin
    with l do
    begin
        area := (2*(ancho*altura)) + (2*(ancho*profundidad)) + (2*(altura*profundidad));
    end;
end;

procedure leerPrisma(var l:lados);
begin
    with l do
    begin
        Readln(ancho);Readln(altura);Readln(profundidad);
    end;
end;

begin
    leerPrisma(prisma);
    Writeln(volumen(prisma),area(prisma));
end.

program practica4ej2;

type 
    min =0..59;
    tiempo =record
    horas:integer; minutos:min;
    end;

procedure leerTiempo(var t:tiempo);
begin
    with t do
    begin
        Readln(horas); Readln(minutos);
    end;
end;

procedure diferencia(t1,t2:tiempo; var dif:tiempo);
begin
    if (t2.minutos > t1.minutos) and (t1.horas <>0) then
    begin
        t1.horas := t1.horas - 1;
        t1.minutos := t1.minutos + 60;
        dif.minutos := t1.minutos - t2.minutos;
    end
    else if (t1.minutos=0) and (t1.horas=0) then
        dif.minutos := -1*(t1.minutos - t2.minutos)
    else dif.minutos := t1.minutos - t2.minutos;    
    dif.horas := t1.horas - t2.horas;
    if dif.horas < 0 then
        dif.horas := dif.horas *(-1);
end;

function menor(t1,t2:tiempo):integer;
begin
    if (t1.horas < t2.horas) then
        menor := 1
    else if (t1.horas < t2.horas) then
      menor := 2
    else
    begin
        if t1.minutos < t2.minutos then
            menor := 1
        else if t2.minutos < t1.minutos then
            menor := 2
        else menor := 0;
    end;
end;

var t1,t2,dif : tiempo;

begin
    leerTiempo(t1);leerTiempo(t2);
    case menor(t1,t2) of
    1 : Writeln('El menor es el primer tiempo.');
    2 : Writeln('El menor es el segundo tiempo.');
    0 : Writeln('Los tiempos son iguales.');
    end;
    diferencia(t1,t2,dif);
    Writeln('La diferencia de horas es de: ',dif.horas);
    Write('La diferencia de minutos es de: ',dif.minutos);
end.}

program practica4ej3;

type tipos = 1..2;
    product = record
    codigo,cant,precio:integer; tipo:tipos;
    end;

procedure leerProducto (var producto:product);
begin
    with producto do
    begin
        Write('Ingrese el codigo: ');Readln(codigo);
        if (producto.codigo <> 9999) then
        begin
        Write('Ingrese la cantidad : ');Readln(cant);
        Write('Ingrese el precio: ');Readln(precio);
        Write('Para alfajor ingrese 1, para mermelada ingrese 2: ');Readln(tipo);
        end;
    end;
end;

procedure procesarMermelada(precio,cant:integer; var cantMermelada,precioTotal:integer);
begin
    precioTotal := precioTotal + precio;
    cantMermelada := cantMermelada + cant;
end;

procedure productosMayor(cod,cant:integer; var codMayor,codMayor2,cantMax,cantMax2:integer);
begin
    if (cant > cantMax) then
    begin
        cantMax2 := cantMax; codMayor2 := codMayor;
        cantMax := cant; codMayor := cod;
    end
    else if (cant > cantMax2) then
    begin
        cantMax2 := cant; codMayor2 := cod;
    end;
end;

var producto:product;
    codMayor,codMayor2,cantMax,cantMax2,precioTotal,uniMermeladas,uniJorgitos:integer;

begin
    uniJorgitos:=0;codMayor:=0;codMayor2:=0;cantMax:=-9999;cantMax2:=-9999;precioTotal:=0;uniMermeladas:=0;
    leerProducto(producto);
    while (producto.codigo <> 9999) do
    begin
        if (producto.tipo = 1) then
            uniJorgitos := uniJorgitos + producto.cant
        else
        begin
            procesarMermelada(producto.precio,producto.cant,uniMermeladas,precioTotal);
        end;
        productosMayor(producto.codigo,producto.cant,codMayor,codMayor2,cantMax,cantMax2);
        leerProducto(producto);
    end;
    Writeln('La cantidad de alfajores vendidos es de : ',uniJorgitos);
    Writeln('El precio promedio de las mermeladas es de : ',precioTotal / uniMermeladas);
    Writeln('Los codigos de los dos productos mas vendidos son : ',codMayor, ', ',codMayor2);
end.