program practica7bej7;

const   cantTweets=1000; carMax=140;

type    dia = 1..31;
        vecTuit = array [1..carMax] of char;
        Tweet = record
            fecha : dia;
            texto : vecTuit;
            cantTexto : integer;
        end;
        vecFecha = array [1..31] of integer;
        vecTweets = array [1..cantTweets] of Tweet;

procedure procesarTweet (v:vecTuit; dimL:integer; var cantHash,cantUs:integer);

var i:integer;

begin
    for i:= 1 to dimL do
    begin
        if (v[i] = '#') and (i < dimL) and (v[i+1] <> ' ') then
            cantHash := cantHash + 1
        else if (v[i] = '@') and (i < dimL) and (v[i+1] <> ' ') then
            cantUs := cantUs + 1;
    end;
end;

procedure inicVFechas(var vF:vecFecha);

var i:integer;

begin
    for i:= 1 to 31 do
        vF[i] := 0;    
end;

procedure contarPalabras (v:vecTuit; var cantPalabras:integer; dimL:integer);

var i:integer;

begin
    i := 1;
    while (i < dimL) do
    begin
        while (i < dimL) and (v[i] = ' ') do
            i := i + 1;
        while (i < dimL) and (v[i] <> ' ') do
            i := i + 1;
        if (v[i-1] <> ' ') then
            cantPalabras := cantPalabras + 1;
    end;
end;

procedure informarDias (v:vecFecha);

var i:integer;

begin
    Writeln( 'Cantidad de tweets publicados por dia: ');
    for i:= 1 to 31 do
        Write (i, ' : ',v[i]);
        Writeln();
end;

var vTweets:vecTweets; vF:vecFecha; i,cantHash,cantUs,cantPalabras:integer;

begin
    cantHash:=0; cantUs:=0; cantPalabras:=0;
    inicVFechas(vF);
    for i:= 1 to cantTweets do
    begin
        procesarTweet(vTweets[i].texto,vTweets[i].cantTexto,cantHash,cantUs);
        contarPalabras(vTweets[i].texto,cantPalabras,vTweets[i].cantTexto);
        vF[vTweets[i].fecha] := vF[vTweets[i].fecha] + 1; 
    end;
    Writeln ('Cantidad de hastags : ',cantHash);
    Writeln ('Cantidad de usuarios : ',cantUs);
    Writeln ('Promedio de palabras por tuit: ',cantPalabras/cantTweets);
    informarDias(vF);
end.

{preguntar por contar palabras y usuarios/hasshtagas. vector dentro de registro 
dentro de vector}