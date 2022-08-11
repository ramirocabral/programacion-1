program BATALLANAVAL;

const cantBarcos=5; dimTablero=10;

type 
    rangoTab=1..dimTablero; cadena15=string[15];

    tablero = array[1..dimTablero,1..dimTablero] of char;


procedure inicTab(var m:tablero);

var i,j:rangoTab;

begin
    for i:= 1 to dimTablero do
        for j:= 1 to dimTablero do
            m[i,j] := '-';
end;

procedure cargarTab(var m:tablero);

var i,j,k:integer;

begin
    for k:= 1 to cantBarcos do
    begin
        Write ('Ingrese la fila y la columna de su barco ',k, ' : ');
        Read(i); Readln(j);
        m[i,j] := 'O';
    end;
end;

procedure inicJugador(var m1,m2:tablero; var nom1,nom2:cadena15);

begin
    Write('Bienvenido jugador 1, ingrese su nombre: ');Readln(nom1);
    inicTab(m1);
    cargarTab(m1);
    Write('Bienvenido jugador 2, ingrese su nombre: ');Readln(nom2);
    inicTab(m2);
    cargarTab(m2);
end;

procedure infTab(m:tablero; nom:cadena15);

var i,j:integer;

begin
    Writeln('Tablero final de ',nom,' : ');
    for i:= 1 to dimTablero do
    begin
        for j:= 1 to dimTablero do
            Write(m[i,j]);
        Writeln();
    end;
end;


procedure turno(var m:tablero; nom:cadena15; var cantBarcos:integer; var ganador:boolean);

var f,c:integer;

begin
    Write(nom,', ingresa numero de fila y columna de la posicion a atacar : ');
    Read(f);Readln(c);
    if (m[f,c] = 'O') then
    begin
        cantBarcos := cantBarcos - 1;
        m[f,c] := 'X';
        Writeln('HUNDIDO');
    end
    else 
        Writeln('AGUA');
    if (cantBarcos = 0) then    
    begin
        ganador := true;
        Writeln('Ganador de la BATALLA: ',nom); 
    end;
end;


var m1,m2:tablero; nom1,nom2:cadena15; barcosJ1,barcosJ2:integer; ganador:boolean;

begin
    inicJugador(m1,m2,nom1,nom2);
    barcosJ1:=5; barcosJ2:=5; ganador:=false;
    while (ganador = false) do
    begin
        turno(m2,nom1,barcosJ2,ganador);
        if (ganador = false) then
            turno(m1,nom2,barcosJ1,ganador);
    end;
    infTab(m1,nom1);
    infTab(m2,nom2);
end.
