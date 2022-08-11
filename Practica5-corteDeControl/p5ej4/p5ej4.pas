program practica5ej4;

type cadena15=string[15];
    juegos=record
    nombre:cadena15; cat:cadena15; idioma:cadena15; votos:integer; end;

procedure leerJuego(var juego:juegos);
begin
    with juego do
    begin
        Write('Ingrese la categoria : ');Readln(cat);
        if (cat <> 'fin') then
        begin
            Readln(nombre); Readln(idioma); Readln(votos);
        end;
    end;
end;

procedure procesarJuego(votos:integer ; var cantVotos,cantJuegos:integer);
begin
    cantVotos := cantVotos + votos;
    cantJuegos := cantJuegos + 1;
end;

procedure juegoMayor(nombre,idioma:cadena15; cant:integer; var juegoMax,idJuegoMax:cadena15; var cantJuegoMax:integer);
begin
    if (cant > cantJuegoMax) then
    begin
        juegoMax := nombre; idJuegoMax := idioma; cantJuegoMax:=cant;
    end;
end;

var juego:juegos; cantVotos,cantJuegos,cantJuegoMax,jMaxCat,vMaxCat,vCat,jCat:integer;
    juegoMax,idJuegoMax,catMaxJ,catMaxV,catActual,idActual:cadena15;

begin
    cantJuegoMax:=1; jMaxCat:=-1; vMaxCat:=-1;
    leerJuego(juego);
    while (juego.cat <> 'fin') do
    begin
        jCat:=0; vCat:=0; catActual:=juego.cat;
        while (juego.cat <> 'fin') and (juego.cat = catActual) do
        begin
            cantVotos:=0; cantJuegos:=0; idActual:=juego.idioma;
            while (juego.cat <> 'fin') and (juego.cat = catActual) and (juego.idioma = idActual) do
            begin
                procesarJuego(juego.votos,cantVotos,cantJuegos);
                juegoMayor(juego.nombre,juego.idioma,juego.votos,juegoMax,idJuegoMax,cantJuegoMax);
                leerJuego(juego);
            end;
            if (catActual = 'Educativo') then
                Writeln('El promedio de votos del idioma es : ',cantJuegos/cantJuegos);
            jCat := jCat + cantJuegos; vCat := vCat + cantVotos;
        end;
        if (jCat > jMaxCat) then
        begin
            jMaxCat := jCat; catMaxJ := catActual;
        end;
        if (vCat > vMaxCat) then
        begin
            vMaxCat := vCat; catMaxV := catActual;
        end;
    end;
    Writeln('Categoria con mas juegos : ',catMaxJ);
    Writeln('Categoria con mas votos : ',catMaxV);
    Writeln('Juego mas vendido : ',juegoMax);
    Writeln('Idioma del juego mas vendido : ', idJuegoMax);
end.