program practica10ej5;

type 
    cadena20=string[20];
    part = record   
        nombre : cadena20;
        apellido : cadena20;
        sexo : cadena20;
        area : cadena20;
        pais : cadena20;
    end;
    lista = ^nodo;
    nodo = record
        datos : part;
        sig : lista;
    end;

{------------------A------------------}

procedure puntoA(l:lista);

var cantMujeres:integer;

begin
    cantMujeres := 0;
    while (l <> nil) do 
    begin
        if (l^.datos.sexo = 'Mujer') then
        begin
            cantMujeres := cantMujeres + 1;
            if (l^.datos.area = 'Accesibilidad Web') then
                Writeln(l^.datos.nombre);
        end;
    end;
end;

{-------------------B------------------}

function puntoB(l:lista):real;

var parTotales : integer;

begin
    parTotales := 0; puntoB := 0;
    while (l <> nil) do
    begin
        parTotales := parTotales + 1;
        if (l^.datos.pais <> 'Argentina') then
            puntoB := puntoB + 1;
    end;
    puntoB := (puntoB*100) / parTotales;
end;

{-------------------C-----------------}

procedure insLista (var l2:lista; p:part);

var ant,act,nue:lista;

begin
    new(nue);
    nue^.datos := part;
    act := l;
    while (act <> nil) and (p.area > act^.datos.area) do
    begin
        ant := act;
        act := act^.sig;
    end;
    if (act <> nil) and then
        ant^.sig := nue
    else 
        l2 := nue;
    nue^.sig := act;
end;

procedure puntoC (l:lista, var l2:lista);

begin
    l2 := nil;
    while (l <> nil) do
    begin
        insLista (l2,l^.datos);
    end;
end;

var l,l2:lista; 

begin
    l := nil;
    {Se dispone:
    cargarLista(l:lista)
    }
    puntoA(l);
    Writeln('El porcentaje de participanes que no son de Argentina es de : ',puntoB(l));
    l2 := nil;
    puntoC(l,l2);
end;