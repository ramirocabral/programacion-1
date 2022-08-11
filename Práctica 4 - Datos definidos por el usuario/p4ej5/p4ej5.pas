program practica4ej5;

type dias=1..31; meses=1..12; horas=0..23; minutos=0..59; cadena30=string[30];
    tiempo=record
    hora:horas;min:minutos; end;
    pacientes=record
    nombre:cadena30;medico:cadena30;anio:integer;mes:meses;dia:dias;
    end;

procedure leerHorario (var hIn,hOut:tiempo);
begin
    with hIn do
    begin
        Readln(hora);Readln(min);
    end;
    with hOut do
    begin
        Readln(hora);Readln(min);
    end;
end; 

procedure leerPaciente (var paciente:pacientes);
begin
    with paciente do
    begin
        Writeln('Ingrese el año de atención: ');Readln(anio);
        if (anio <> 0) then
        begin
            Readln(mes);Readln(dia);Readln(nombre);Readln(medico);
        end;
    end;
end;

procedure tiempoAtencion(hIn,hOut:tiempo; nombre:cadena30; var nombreMax :cadena30; var difMax:integer);
var h1,h2:integer;
begin
    h1:=(hIn.hora*60)+hIn.min;
    h2:=(hOut.hora*60)+hOut.min;
    if (h2-h2) > difMax then
    begin
        difMax:= h2 - h1; nombreMax:= nombre;
    end;
end;

procedure procesarAgosto (mes:meses; var cantAgosto:integer);
begin
    if(mes=8) then
        cantAgosto := cantAgosto + 1;
end;

var paciente:pacientes; entrada,salida:tiempo; nombreMax:cadena30; difMax,cantAgosto:integer;

begin
    difMax:=-1;cantAgosto:=0;
    leerPaciente(paciente);
    while(paciente.anio <> 0) do
    begin
        leerHorario(entrada,salida);
        tiempoAtencion(entrada,salida,paciente.nombre,nombreMax,difMax);
        procesarAgosto(paciente.mes,cantAgosto);
        leerPaciente(paciente);
    end;
    Writeln('El paciente que mas tardó en ser atendido es : ', nombreMax);
    Writeln('La cantidad de pacientes atendidos en agosto es : ', cantAgosto);
end.