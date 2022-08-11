program practica7bej6;

const cantEstrellas = 250; gasesMax=10; 

type cadena15=string[15];

     vGases = array [1..gasesMax] of cadena15;

     estrella = record
        nom : cadena15;
        sup : integer;
        gases : vGases;
        dimLG : integer;
        dist : integer;
        end;

     vEstrella = array [1..cantEstrellas] of estrella;

     vPuntoC = array [1..cantEstrellas] of cadena15;

procedure mayorEstrella (e:estrella, var nombre1,nombre2:cadena15; var max1,max2,i:integer);

begin
    if (e.sup) > max1 then
    begin
        max2 := max1; nombre2 := nombre1;
        max1 := e.sup; nombre1 := e.nom;
    end
    else if (v[i] > max2) then
    begin
        max2 := e.sup; nombre2:=e.nom;
    end;
end;

procedure puntoB (e:estrella; var cantB:integer);

begin
    if (e.dimLG >= 5) then
        cantB := cantB + 1;
end;

procedure descNum (n:integer; sumaPar,sumaImpar:integer);
begin
    sumaPar:=0; sumaImpar:=0;
    while (num <> 0) do
    begin
        cifra := num mod 10;
        if (cifra mod 2) = 0 then
            sumaPar := sumaPar + cifra
        else 
            sumaImpar := sumaImpar + cifra;
        num := num div 10;
    end;
end;

function puntoC(num:integer):boolean;

var sumaImpar,sumaPar:integer;

begin
    descNum (num,sumaImpar,sumaPar);
    puntoC := (sumaPar > sumaImpar);
end;

procedure sumarVector (var v:vector, var dimL:integer, nom:cadena15);
begin
    v[dimL + 1] := nom;
    dimL := dimL + 1;
end;

procedure informarVector(v:vector, dimL:integer);

var i:integer;

begin
    for i:= 1 to dimL do
        Writeln(v[i]);
end;

var vEst:vEstrella; vPC:vPuntoC; dimLC,cantB,cantC,max1,max2:integer; nombre1,nombre2:cadena15;

begin
    cantB := 0; cantC:=0; max1:=-9999; nombre1:=' ';
    for i:= 1 to cantEstrellas do
    begin
        mayorEstrella(vEst[i],nombre1,nombre2,max1,max2);
        puntoB(v[i],cantB);
        if puntoC(v[i].dist) = true then
            sumarVector(vPC,dimLC,v[i].nom);
    end;
    Writeln('Estrellas con mayor superficie : ',nombre1, ', ', nombre2);
    Writeln(' Cantidad de estrellas con al menos 5 gases: ', cantB);
    Writeln(' Nombre de las estrellas que cumplen la condicion c : ')
    informarVector(vPC,dimLC);
end.