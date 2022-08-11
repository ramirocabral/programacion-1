program practica7ej10;

const cantN=7;

type vector = array [1..cantN] of real;

procedure inicVector(var v:vector);

var i:integer;

begin
    for i:= 1 to cantN do
        v[i] := -9999;
end;

procedure insVec(var v:vector; pos:integer; num:real);

var j:integer;

begin
    for j:= cantN downto pos + 1 do
        v[j] := v[j-1];
    v[pos] := num;
end;

procedure compararMax(var v:vector; var pos:integer; num:real);

begin
    pos := 1;
    while (pos <= cantN) and (num < v[pos]) do
        pos := pos + 1;
    if (pos <= cantN) and (num > v[pos]) then
        insVec(v,pos,num);
end;

procedure informarVector(v:vector);

var i:integer;

begin
    Writeln ('Numeros mas grandes ingresados :');
    for i:= 1 to cantN do
        Write (' ,',v[i]);
end;

var num:real; v:vector; pos:integer;

begin
    inicVector(v);
    Readln(num);
    while (num <> 50) do
    begin
        compararMax(v,pos,num);
        Readln(num);
    end;
    informarVector(v);
end.