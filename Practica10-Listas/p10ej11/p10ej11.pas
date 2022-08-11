program practica10ej11;

const cantMaratonistas=50;

type
    cadena15=string[15];
    //registro para almacenar el tiempo
    tiempo = record
        minutos:integer;
        segundos:integer;
    end;

    //lista que tendra cada maratonista, para almacenar los tiempos
    lsTiempo = ^nodo;

    nodo = record
        datos:tiempo;
        sig:lsTiempo;
    end;

    //registro para almacenar los datos de cada maratonista

    maratonista = record
        nombre:cadena15;
        apellido:cadena15;
        genero:cadena15;
        tiempos:lsTiempo;
    end;

    vector = array [1..cantMaratonistas] of maratonista;

procedure insertarAdelante {( ͡ʘ ͜ʖ ͡ʘ)}(var l:lsTiempo; min,seg:integer);

var nue:lsTiempo;

begin
    new(nue);
    nue^.datos.minutos:=min;
    nue^.datos.segundos:=seg;
    nue^.sig:=l;
    l:=nue;
end;

procedure cargarDatos (var v:vector);

var i,min,seg:integer;

begin
    for i:= 1 to cantMaratonistas do 
    begin
        with v[i] do
        begin
            tiempos := nil;
            Write('Ingrese el nombre del maratonista: ');Readln(v[i].nombre);
            Write('Ingrese el apellido: ');Readln(v[i].apellido);
            Write('Ingrese el genero: ');Readln(v[i].genero);
            Write('Ingrese el tiempo en minutos de la maraton: ');Readln(min);
            while (min <> -1) do
            begin
                Write('Ingrese el tiempo en segundos de la maraton: '); Readln(seg);
                insertarAdelante(v[i].tiempos,min,seg);
                Write('Ingrese el tiempo en minutos de la maraton: ');Readln(min);
            end;
        end;
    end;
end;

procedure informarTiempo (v:vector);

var i,mejTiempo,t:integer;

begin
    for i:= 1 to cantMaratonistas do
    begin
        mejTiempo:=9999;
        while (v[i].tiempos <> nil) do
        begin
            t := (v[i].tiempos^.datos.minutos * 60) + (v[i].tiempos^.datos.segundos);
            if (t < mejTiempo) then
                mejTiempo := t;
            v[i].tiempos:= v[i].tiempos^.sig;
        end;
        Writeln('El mejor tiempo del maratonista ',v[i].nombre,' es de ',mejTiempo div 60,' minutos y ',mejTiempo mod 60,' segundos.');
    end;
end;

procedure promTiempo(v:vector);

var i,cantMaratones,tiempoProm:integer;

begin
    for i:= 1 to cantMaratonistas do
    begin
        tiempoProm:=0; cantMaratones:=0;
        while (v[i].tiempos <> nil) do
        begin
            cantMaratones := cantMaratones + 1;
            tiempoProm := tiempoProm + ((v[i].tiempos^.datos.minutos * 60) + (v[i].tiempos^.datos.segundos));
            v[i].tiempos := v[i].tiempos^.sig;
        end;
        tiempoProm := tiempoProm / cantMaratones;
        Writeln ('El tiempo promedio de ',v[i].nombre,' es de ',(tiempoProm div 60) , ' minutos y ',tiempoProm mod 60, ' segundos');
    end;
end;

var v:vector; 

begin
    cargarDatos(v);
    informarTiempo(v);
    promTiempo(v);
end.