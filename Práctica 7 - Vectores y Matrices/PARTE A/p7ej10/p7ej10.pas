program practica7ej10;

const   dimF=2000;

type    cadena15 = string[15];
        vector = array [1..dimF] of cadena15;


{---------------A---------------}

{funcion para buscar la posicion de un nombre que puede no existir en el vector}

function buscarPos(v:vector; dimL:integer; nom:cadena15):integer;

var i:integer;

begin
    i:=1; buscarPos:=0;
    while (i <= dimL) and (v[i] < nom) do
        i := i + 1;
        if (i > dimL) or (v[i] <> nom) then
            i := 0;
        buscarPos := i;
end;

{---------------B---------------}

{Funcion para buscar posicion en la que insertar, se checkea si hay espacio
antes de la invocacion.}

function buscarPosIns(v:vector;dimL:integer;nom:cadena15) :integer;

var i:integer;

begin
    i := 1;
    while (i<dimL) and (v[i] < nom) do
        i := i + 1;
    buscarPosIns := i;
end;

procedure insNombre(var v:vector; var dimL:integer; nom:cadena15; var exito:boolean);

procedure insertar(var v:vector; var dimL:integer; pos:integer; nom:cadena15);

var i:integer;

begin
    for i:= dimL downto pos do
        v[i+1] := v[i];
    v[pos] := nom;
    dimL := dimL + 1;
end;

var pos:integer;

begin
    exito := false;
    if (dimL < dimF) then
    begin
        buscarPosIns(v,dimL,nom);
        insertar(v,dimL,pos,nom);
        exito := true;
    end;
end;


{-----------C-----------}

procedure borrarPos(var v:vector; var dimL:integer; pos:integer);

var i:integer;

begin
    for i:= pos + 1 to dimL do
        v[i-1] := v[i];
    dimL := dimL + 1;
end;


procedure borrarElemento(var v:vector; var dimL:integer; var exito:boolean; nom:cadena15);

var pos:integer;

begin
    exito := false;
    pos := buscarPos(v,dimL,nom);
    if (pos <> 0) then
    begin
        borrarPos(v,dimL,pos);
        exito := true;
    end;
end;

{------D------}

function cantRep(v:vector; dimL,pos:integer; nom:cadena15):integer;

begin
    cantRep := 0; pos := pos + 1;
    while (pos <= dimL) and (v[pos] = nom) do
    begin
        pos := pos + 1; cantRep := cantRep + 1;
    end;
end;

procedure borrarPosMod(var v:vector; var dimL:integer; pos,rep:integer);

var i:integer;

begin
    for i:= pos + rep to dimL do
        v[i - rep] := v[i];
    dimL := dimL - rep;
end;

procedure borrarElemRep(var v:vector; var dimL:integer; var exito:boolean; nom:cadena15);

var pos,rep:integer;

begin
    exito := false;
    pos := buscarPos(v,dimL,nom);
    if (pos <> 0) then
    begin
        rep := cantRep (v,dimL,pos,nom);
        borrarPosMod(v,dimL,pos,rep);
        exito := true;
    end;
end;