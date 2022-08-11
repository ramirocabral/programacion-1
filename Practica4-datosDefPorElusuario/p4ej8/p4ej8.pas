program practica4ej8;

type puntos=0..100; cadena20=string[20];
    participantes=record
    nombre:cadena20;cont:cadena20;puntaje:puntos;
    end;
    pEu=record euAp:integer;euPr:integer;end;
    pAs=record asAp:integer;asPr:integer;end;
    pAm=record amAp:integer;amPr:integer;end;

procedure leerPart(var part:participantes);
begin
    with part do
    begin
        Readln(nombre);Readln(puntaje);
        Write('Ingrese el conti;
    end;
end;

procedure puntMax(nombre:cadena20; var nombreMax:cadena20; punt:integer; var notaMax:integer);
begin
    if (punt>notaMax) then
    begin
        notaMax:=punt;nombreMax:=nombre;
    end;
end;

procedure resultados(punt:integer; var cantA,cantP:integer);
begin
    if(punt>=90) then
        cantP := cantP + 1
    else if (punt >= 70) then
        cantA := cantA + 1;
end;

procedure calcEU(punt:integer; var puntEu,cantEu:integer);
begin
    puntEu := puntEu + punt; cantEu := cantEu + 1;
end;

var part:participantes; eu:pEu; as:pAs; am:pAm; nombreMax:cadena20;
    notaMax,puntEu,cantEu:integer;

begin
    notaMax:=-1;puntEu:=0;cantEu:=0;nombreMax:=' ';
    leerPart(part);
    while (part.nombre <> 'zzz') do
    begin
        while (part.cont = 'Europa') and (part.nombre <> 'zzz') do
        begin
            calcEU(part.puntaje,puntEu,cantEu);
            resultados(part.puntaje,eu.euAp,eu.euPr);
            puntMax(part.nombre,nombreMax,part.puntaje,notaMax);
            leerPart(part);
        end;
        while (part.cont = 'Asia') and (part.nombre <> 'zzz') do
        begin
            resultados(part.puntaje,as.asAp,as.asPr);
            puntMax(part.nombre,nombreMax,part.puntaje,notaMax);
            leerPart(part);
        end;
        while (part.cont = 'America') and (part.nombre <> 'zzz') do
        begin
            resultados(part.puntaje,am.amAp,am.amPr);
            puntMax(part.nombre,nombreMax,part.puntaje,notaMax);
            leerPart(part);
        end;
    end;
    Writeln('El participante con la mejor nota fue: ',nombreMax);
    Writeln('Europeos aprobados: ',eu.euAp, ' Europeos promocionados: ', eu.euPr);
    Writeln('Asiaticos aprobados: ',as.asAp, ' Asiaticos promocionados: ', as.asPr);
    Writeln('Americanos aprobados: ',am.amAp, ' Americanos promocionados: ', am.amPr);
    Write('Puntaje promedio de los europeos :', puntEu/cantEu);
end.