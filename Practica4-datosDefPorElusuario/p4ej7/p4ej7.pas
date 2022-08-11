program practica4ej7;

const paises=20; rep=7;

type cadena20=string[20];
    edades=1..120;
    participante=record
    nombre:cadena20;apellido:cadena20;pais:cadena20;sexo:char;edad:edades;
    end;
    platos=record
    nom:cadena20;tipo:char;ing:cadena20;
    end;

procedure leerParticipante(var part:participante);
begin
    with part do
    begin
        Readln(nombre);Readln(apellido);Readln(pais);Readln(edad);
        Write('Ingrese F para femenino o M para masculino: '); Readln(sexo);
    end;
end;

procedure procesarFem(sexo,tipo:char; var cantA:integer);
begin
    if (sexo = 'F') and (tipo = 'F') then
        cantA := cantA + 1;
end;

procedure puntoA(pais:cadena20;var paisA:cadena20;cantA:integer;var cantMaxA:integer);
begin
    if (cantA > cantMaxA) then
    begin
        paisA := pais; cantMaxA := cantA;
    end;
end;

procedure leerPlato(var plato:platos);
begin
    with plato do
    begin
        Write('Para plato frio ingrese F, para plato caliente ingrese C: '); Readln(tipo);
        Readln(nom);Readln(ing);
    end;
end;

procedure puntoC(nombre,apellido,pais,ing:cadena20; tipo:char);
begin
    if (tipo='C') and (ing='Pollo') then
    begin
        Writeln(nombre,' ', apellido);
        Writeln(pais);
    end;
end;

var part:participante; sumaEdad,cantA,cantMaxA,i,j:integer; paisA:cadena20; plato:platos;

begin
    sumaEdad:=0;cantMaxA:=0;
    for i := 1 to paises do
    begin
        for j:= 1 to rep do
        begin
            leerParticipante(part);leerPlato(plato);
            procesarFem(part.sexo,plato.tipo,cantA);
            puntoC(part.nombre,part.apellido,part.pais,plato.ing,plato.tipo);
            sumaEdad:=sumaEdad + part.edad;
        end;
        puntoA(part.pais,paisA,cantA,cantMaxA);
    end;
    Write('La edad promedio es de : ',sumaEdad/140);
end.
