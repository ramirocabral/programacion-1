program practica11ej10;

const cantMensajes=1000;

type
    cadena200=string[200];
    msj = record
        text:cadena200;
        cantLikes:integer;
        compartido:integer;
    end;

    vMsjs = array[1..cantMensajes] of msj;

procedure determinarPos( v:vMsjs; likes:integer; dimL:integer);

var i:integer;

begin
    i:=1;
    while (i <= dimL) and (v[i].cantLikes < m.cantLikes) do
        i:=i+1;
    if (i <= dimL) then
        determinarPos := i;
end;

procedure insOrdenado(var v:vMsjs; var dimL:integer; pos:integer; m:msj);

var i:integer;

begin
    for i:= dimL downto pos do
        v[i+1] := v[i];
    v[pos]:=m;
    dimL := dimL + 1;
end;

procedure insertar (var v:vMsjs; var dimL:integer, m:msj);

var pos:integer;

begin
    if (dimL < dimF) then
    begin
        pos := determinarPos(v,cantLikes,dimL);
        insOrdenado(v,dimL,pos,m);
    end;
end;

