program practica5ej3;

type cadena15=string[15];
    info = record
    pais:cadena15; prov:cadena15; ciudad:cadena15; dinero:integer; hab:integer; end;

procedure leerDatos(var datos:info);
begin
    with datos do
    begin
        Readln(pais);
        if (pais <> 'zzz') then
        begin
            Readln(prov); Readln(ciudad); Readln(dinero); Readln(hab);
        end;
    end;
end;

procedure procesarCiudad(monto,hab:integer; var habProv,montoProv:integer);
begin
    Writeln('El ingreso por habitantes de la ciudad es : ',monto/hab);
    habProv := habProv + hab;
    montoProv := montoProv + monto;
end;

var datos:info; habProv,habPais,montoProv,montoPais:integer; paisActual,provActual:cadena15;

begin
    leerDatos(datos);
    while (datos.pais <> 'zzz') do
    begin
        habPais:=0; montoPais:=0; paisActual:=datos.pais;
        while (datos.pais <> 'zzz') and (datos.pais = paisActual) do
        begin
            habProv:=0; montoProv:=0; provActual:=datos.prov;
            while (datos.pais <> 'zzz') and (datos.pais = paisActual) and (datos.prov = provActual) do
            begin
                procesarCiudad(datos.dinero,datos.hab,habProv,montoProv);
                leerDatos(datos);
            end;
            Writeln('El ingreso por habitante de la provincia es de :',montoProv/habProv);
            habPais := habPais + habProv; montoPais := montoPais + montoProv;
        end;
        Writeln('El ingreso por habitante del pais es de : ',montoPais/habPais);
    end;
end.
