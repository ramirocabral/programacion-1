program practica7bej11;

const dimFil=x;dimCol=x; dimFV=x;

type matriz = array[1..dimFil,1..dimCol] of integer;
    
     vector = array[1..dimFV] of integer;

procedure suprimirM(var m:matriz; dimLCol:integer; var dimLFil:integer);

var f,c,n:integer;

begin
    Readln(n);
    if (n>=1) and (n<=dimLFil) then
    begin
        for f:= n+1 to dimLFil do
            for c:= 1 to dimLCol 
                m[f-1,c] := m[f,c];
    dimLFil := dimLFil - 1;
    end;
end;

procedure insertarVec(var m:matriz; v:vector; dimLV,dimLCol:integer; var dimlFil:integer);

var f,c,n:integer;

begin
    if (dimLV = dimLCol) and (dimLFil < dimFil) then
    begin
        Write ('Ingrese la fila en la que desea insertar el vector : '); Readln(n);
        if (n >= 1) and (n <= dimLFil) then
        begin
            for f:= n to dimLFil do
                for c := 1 to dimLCol do
                    m[f+1,c] := m[f,c];
            dimLFil := dimLFil + 1;
            for c:= 1 to dimLCol do
                m[n,c] := v[c];
        end;
    end;
end;
