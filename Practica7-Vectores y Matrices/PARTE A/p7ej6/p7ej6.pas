{* Defina un tipo de dato que permita almacenar una secuencia de 64 valores binarios e implemente
módulos que realicen las operaciones AND, OR y NOT (vistas en la práctica de operaciones lógicas),
junto con dos operandos o uno, según corresponda.}

program practica7ej6;

const cantBits=4;

type    bit=0..1;
        vector = array [1..cantBits] of bit;

procedure cargarVector(var v:vector; i:integer);
begin
    for i:= 1 to cantBits do
        Readln(v[i]);
end;

procedure imprimirVector (v:vector; i:integer);
begin
    for i:= 1 to cantBits do
        Write (v[i],' ');
        Writeln();
end;

procedure modNot(v:vector; var vNot:vector; i:integer);
begin
    for i:= 1 to cantBits do
    begin
        if (v[i] = 1) then
            vNot[i] := 0
        else
            vNot[i] := 1;
    end;
end;

procedure modAnd(v1,v2:vector; var vAnd:vector; i:integer);
begin
    for i := 1 to cantBits do
    begin
        if (v1[i] = 1) and (v2[i] = 1) then
            vAnd[i] := 1
        else
            vAnd[i] := 0;
    end;
end;

procedure modOr(v1,v2:vector; var vOr:vector; i:integer);
begin
    for i:= 1 to cantBits do
    begin
        if (v1[i]=1) or (v2[i]=1) then
            vOr[i]:=1
        else
            vOr[i]:=0;
    end;
end;

var v1,v2,vNot,vAnd,vOr:vector; i:integer;

begin
    i:=1;
    cargarVector(v1,i); cargarVector(v2,i);
    modNot(v1,vNot,i);
    modAnd(v1,v2,vAnd,i);
    modOr(v1,v2,vOr,i);
    imprimirVector(vNot,i);
    imprimirVector(vAnd,i);
    imprimirVector(vOr,i);
end.