program practica7ej7;

const  dimF=4; dimF2=dimF*2;

type    letras='a'..'z';
        vector = array [1..dimF] of letras;
        vector2 = array [1..dimF2] of letras;

procedure leerVector (var v:vector;i:integer);
begin
    for i := 1 to dimF do
    begin
        Readln(v[i]);
    end;
end;

function pertenece (v:vector; l:letras):boolean;
var i:integer;
begin
    i := 1;
    pertenece:=false;
    while (i <= dimF) and (pertenece=false) do
    begin
        pertenece := (v[i]=l);
        i := i + 1;
    end;
end;


procedure union(v1,v2:vector; var v3:vector2; var dimL3 : integer; j:letras);
begin
    dimL3:=0;
    for j := 'a' to 'z' do
    begin
        if (pertenece(v1,j)) or (pertenece(v2,j)) then
        begin
            dimL3 := dimL3 + 1;
            v3[dimL3] := j; 
        end;
    end;
end;

procedure diferencia (v1,v2:vector; var v3:vector2; var dimL3:integer; j:letras);
begin
    dimL3 := 0;
    for j:= 'a' to 'z' do
    begin
        if (pertenece(v1,j)) and (not(pertenece(v2,j))) then
        begin
            dimL3 := dimL3 + 1;
            v3[dimL3] := j; 
        end;
    end;
end;

procedure writeVec(v:vector2; dimL,i:integer);
begin
    for i := 1 to dimL do
        Write(v[i]);
    Writeln();
end;


var v1,v2:vector;vUnion,vDif:vector2; dimLUn,dimLDif,i:integer; j:letras;

begin
    i:=1;j:='a';
    leerVector(v1,i);
    leerVector(v2,i);
    union(v1,v2,vUnion,dimLUn,j);
    diferencia(v1,v2,vDif,dimLDif,j);
    writeVec(vUnion,dimLUn,i);
    writeVec(vDif,dimLDif,i);
end.