program practica11ej2;

uses sysutils;

type
    cadena15=string[15];

    vector = array[1..70] of char;

    d = record
        dimL:integer;
        direccion:vector;
    end;

    persona = record
        nom:cadena15;
        ap:cadena15;
        cat:integer;
        montoBasico:integer;
        dir:d;
    end;

    lista = ^nodo;

    nodo = record
        datos:persona;
        sig:lista;
    end;

    categoria = record;
        nombre:cadena15;
        monto:real;
    end;

    vCategorias = array[1..4] of categoria;

    vMontos = array[1..4] of real;

    conjunto = set of char;

procedure inicVectorMontos(var v:vMontos);

var i:integer;

begin
    for i:= 1 to 4 do
        v[i] := 0;
end;

function direccionValida(vA:vector; dimLA:integer; MAYUS,conjA,digitosA,digitos:conjunto):boolean;

var x,i,j;dimLB:integer; vB:vector; cumpleA,cumpleB,cumpleC:boolean; conjC:conjunto;

begin
    dimLB:=0; i:=1; j:=1;cumpleA:=false;cumpleB:=false;cumpleC:=false; conjC:=[];
    while (i <= dimLA) and (v[i] in conjA) do
    begin
        if (v[i] in MAYUS) then
        begin
            x:=ord(v[i]) + 32;
            vB[dimLB]:=Chr(x);
            dimLB := dimLB + 1;
        end
        else if (v[i] in pares) then
            digitosA := digitosA + [v[i]];
        i := i + 1;
    end;
    if  (i <= dimLA) and (i <> 1) and (v[i]=%) and (v[i - 1] in conjA) then
    begin   
        cumpleA := true;
        i := i+1;
        while (v[i] <= dimLA) and (v[i] <> '%') and (j <= dimLB) and (v[i] = vB[j]) do
        begin
            i:=i+1;
            j:=j+1;
        end;
    end;
    if (i <= dimLA) and (v[i] = %) (j > dimLB) and (v[i] = '%')then
    begin
        cumpleB := true;
        i := i + 1;
        conjC := digitos - digitosA;
        while (i <= dimLA) and (v[i] in conjC) then
        begin
            conjC := conjC - v[i];
            i := i+1;
        end;
    end;
    if (i > dimLA) and (conjC = []) then
        cumpleC := true;
    direccionValida := (cumpleA and cumpleB and cumpleC);
end;

procedure procesarLista(l:lista; var v:vMontos; vCat:vCategorias; MAYUS,digitos,pares,conjA,digitosA:conjunto);

var nombreMax:cadena15; montoActual,montoMax:real; 

begin
    montoMax:=-1;
    while (l <> nil) do
    begin
        montoActual := (l^.datos.montoBasico + (vCategorias[l^.datos.cat].monto));
        if (l^.datos.cat = 2) and (montoActual > montoMax) then
        begin
            montoMax := montoActual;
            nombreMax:=l^.datos.nom; 
        end;
        if (direccionValida(l^.datos.dir.direccion,l^.datos.dir.dimL,MAYUS,conjA,digitosA,digitos)) then
            Writeln('La direccion de la persona cumple con la condicion de mierda.');
        v[l^.datos.cat] := v[l^.datos.cat] + montoActual;
    end;
    if (montoMax = -1) then
        Writeln('Nadie pago el servicio de cable de categoria 2.')
    else 
        Writeln('El boludo que mas pago por el servicio de cable de categoria 2 es : ',nombreMax);
end;

procedure informarMontos (v:vMontos);

var i:integer;

begin
    for i:= 1 to 4 do
    begin
        Writeln('El monto recaudado por el servicio ',i,' es de: ',v[i]);
    end;
end;

var v:vMontos,vCat:vCategorias; l:lista; MAYUS,digitos,pares,conjA,digitosA:conjunto;

begin
    MAYUS := ['A'..'Z']; digitos:=['1'..'9']; pares:=['0','2','4','6';'8'];
    conjA := MAYUS + PARES;
    digitosA:=[];
    procesarLista(l,v,vCat,MAYUS,digitos,pares,conjA,digitosA);
    informarMontos(v);
end;