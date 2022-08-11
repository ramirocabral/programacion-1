program practica7ej2b;

const dimF=10;

type vector = array [1..dimF] of integer;
    rangoVec = 1..dimF;

procedure leerVector(var v:vector ; var dimL:rangoVec);

var i:rangoVec;

begin
    for i:= 1 to dimF do
        Readln(v[i]);
    dimL := dimF;
end;


procedure suprimirVec (var v:vector; var dimL:rangoVec);

var i,j,pos,k:rangoVec;

begin
    Write ('Ingrese el valor i: ');Readln(i); 
    Write ('Ingrese el valor j: ');Readln(j); 
    pos := j-i+1;
    if (i>=1 ) and (j<=diml) and ((j-i) < dimL) then
    begin
        for k:= j+1 to dimL do
            v[k-pos] := v[k];
        dimL := dimL - pos;
    end;
end;

procedure informarVector(v:vector; dimL:rangoVec);

var i:rangoVec;

begin
    for i:= 1 to dimL do
        Write(v[i], ' ,');
end;

var v:vector; dimL:rangoVec;

begin
    leerVector(v,dimL);
    suprimirVec(v,dimL);
    informarVector(v,dimL);
end.