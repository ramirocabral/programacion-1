program practica7bej5;

const dimF=5; dimC=5;

type matriz = array [1..dimF,1..dimC] of integer;

procedure leerMatriz (var m:matriz);

var f,c:integer;

begin
    for f:= 1 to dimF do
        for c:= 1 to dimC do
            Readln(m[f,c]);
end;

procedure impFilPares (m:matriz);

var f,c:integer;

begin
    f := 2;
    while (f <= dimF) do
    begin
        for c:= 1 to dimC do
        begin
            Write ((m[f,c]), ', ');
            Writeln();
        end;
        f := f + 2;
    end;
end;

procedure impColImpares (m:matriz);

var f,c: integer;

begin
    c := 1;
    while (c <= dimC) do
    begin
        for f:= 1 to dimF do
        begin
            Write ((m[f,c]), ', ');
            Writeln();
        end;
        c := c + 2;
    end;
end;

procedure impDiag (m:matriz);

var f,c:integer;

begin
    c := dimC;
    for f:= 1 to dimF do
    begin
        Writeln (m[f,c]);
        c := c - 1;
    end;
end;

var m:matriz;

begin
    leerMatriz(m);
    impDiag(m);
end.