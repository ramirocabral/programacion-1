program practica7bej3;

const dimF=x;

type    vector = array[1..dimF] of integer;

procedure correrVector(var v:vector; dimLA,dimLB,i:integer)

var j:integer;

begin
    for j:= (dimLB + dimLA) downto i+1+dimLb do
        v[i] := v[i-dimLB];
end;

procedure insertarVector(var v:vector,v2:vector;dimLB,i:integer);

var j:integer

begin
    for j:= 1 to dimLB do
        v[i+j] := v2[j];
end;

procedure modVector (var vA:vector; vB:vector; var dimLA:integer; dimLB:integer; var exito:boolean);

var i:integer;

begin
    exito := false;
    Readln(i);
    if ((dimLB + dimLA) <= dimF) and ((i>=1) and (i<dimLA)) then
    begin
        pos := dimLB + dimLA;
        correrVector(v,dimLA,dimLB);
        dimLA := dimLA + dimLB;
        insertarVector(vA,vB,dimLB,i);
        exito := true;
    end;
end;

