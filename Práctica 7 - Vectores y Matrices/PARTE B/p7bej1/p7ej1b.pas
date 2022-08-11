program practica7ej1b;

type    rangoVec=1..dimF;
        vector = array [1..dimF] of integer;

procedure moverVec(var v:vector; var dimL:rangoVec; pos:rangoVec);
var i:integer;

begin
    for i:= dimL downto pos do
    v[i+1] := v[i];
end;

procedure insVec(var v:vector; var dimL:integer; pos:rangoVec; num:integer);
var i:rangoVec:

begin
    if (dimL<dimF) then
    begin
        moverVec(v,diml,pos);
        v[pos]:=num;
        dimL := dimL + 1;
    end;
end; 

