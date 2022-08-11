//FUNCIONA
program practica11ej5;

type
    subRcasillas=1..15;
    subNumeros=0..10;
    casillero = record
        numero:subNumeros;
        usado:boolean;
    end;
    tablero = array [1..15,1..15] of casillero;

    data=record
        fila:integer;
        columna:integer;
        num:subNumeros;
    end;

    lista = ^nodo;
    nodo = record
        datos:data;
        sig:lista;
    end;
    conjunto = set of subRcasillas;

procedure insertarAdelante (var l:lista; x:data);

var nue:lista;

begin
    new(nue);
    nue^.datos:=x;
    nue^.sig:=l;
    l:=nue;
end;

procedure cargarLista (var l:lista;var conjFilas,conjCol:conjunto);

var d:data;

begin
    with d do 
    begin
        Write('Ingrese el numero de fila');Readln(fila);
        while (fila <> -1) do
        begin
            Write('Ingrese el numero de columna');Readln(columna);
            Write('Ingrese el numero del casillero');Readln(num);
            insertarAdelante(l,d);
            conjFilas := conjFilas + [fila];
            conjCol := conjCol + [columna];
            Write('Ingrese el numero de fila: '); Readln(fila);
        end;
    end;
end;

procedure insertarMatriz(var m:tablero; l:lista; conjFilas,conjCol:conjunto);

var i,j:integer;

begin
    while (l <> nil) do
    begin
        m[l^.datos.fila,l^.datos.columna].numero:=l^.datos.num;
        m[l^.datos.fila,l^.datos.columna].usado:=false;
        l:=l^.sig;
    end;
    for i:= 1 to 15 do
        for j:= 1 to 15 do
            if (m[i,j].usado <> false ) then
            begin
                m[i,j].numero := 0;
                m[i,j].usado := false;
            end;
end;

procedure liberarMem(l:lista);

var aux:lista;

begin
    while (l <> nil) do
    begin
        aux:=l;
        l:=l^.sig;
        dispose(aux);
    end;
end;

procedure turno (var m:tablero; var f,c,num:integer);

begin
    Write('Ingrese el numero de fila: '); Readln(f);
    Write('Ingrese el numero de columna: '); Readln(c);
    num := m[f,c].numero;
end;

procedure jogar (var m:tablero; var puntos1,puntos2:integer);

var f,c,num1,num2,i:integer;

begin
    puntos1:=0; puntos2:=0;
    Writeln('BIENVENIDOS AL JUEGO');
    for i:= 1 to 10 do
    begin
        Writeln('Turno del jugador 1:');
        turno(m,f,c,num1);
        if (m[f,c].usado) = true then //si el casillero del jugador 1 ya esta usado
        begin
            Writeln('Turno del jugador 2:');
            turno(m,f,c,num2);
            if (m[f,c].usado = true) then
            begin
                Writeln('Ambos jugadores ingresan casilleros ya usados, ninguno suma puntos.');
            end
            else 
            begin
                Writeln('El casillero elegido por el jugador 1 ya fue usado, pierde la ronda');
                m[f,c].usado:=true;
                puntos2 := puntos2 + 1;
            end;
        end
        else //si el casillero del jugador 1 no fue usado
        begin
            m[f,c].usado:=true;
            Writeln('Turno del jugador 2');
            turno(m,f,c,num2);
            if (m[f,c].usado = true) then //si el casillero del jugador 2 ya fue usado
            begin
                Writeln('El casillero elegido por el jugador 2 ya fue usado, pierde la ronda');
                puntos1:=puntos1 + 1;
            end
            else //si el casillero del jugador 2 no fue usado 
            begin
                m[f,c].usado := true;
                if (num1 > num2) then
                begin
                    Writeln('El jugador 1 gana la ronda.');
                    puntos1 := puntos1 + 1;
                end
                else if (num2 > num1) then
                begin
                    Writeln('El jugador 2 gana la ronda.');
                    puntos2 := puntos2 + 1;
                end
                else 
                    Writeln('Ronda empatada.');
            end;
        end;
    end;
end;

var l:lista; m:tablero; conjFilas,conjCol:conjunto; puntos1,puntos2:integer;

begin
    conjFilas := []; conjCol := [];
    l := nil;
    cargarLista(l,conjFilas,conjCol);
    insertarMatriz(m,l,conjFilas,conjCol);
    liberarMem(l);
    jogar(m,puntos1,puntos2);
    if (puntos1 > puntos2) then
        Writeln('GANADOR JUGADOR 1, PUNTOS : ',puntos1)
    else if (puntos2 > puntos1) then
        Writeln('GANADOR JUGADOR 2, PUNTOS : ',puntos2)
    else Writeln('EMPATE JAJAJAJ');
end.