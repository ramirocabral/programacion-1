program practica7bej4;

type vector = array[1..dimF] of integer;

procedure procVector (v:vector; dimL:integer var exito:boolean);

var i,n:integer;

begin
    Readln(n);
    i := 1;
    exito := false;
    while (i <= dimL) and (v[i] > n) do
        i := i + 1;
    if (i <= dimL) and (v[i] = n) then
        exito := true;
end;
