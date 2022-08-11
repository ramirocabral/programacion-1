




{program practica3ej1;

function digitoMayor (numero:integer):integer;
var digito,digitoMax : integer;
begin
    digitoMax := 1;
    while numero <> 0 do
    begin
        digito := numero MOD 10;
        if digito > digitoMax then
            digitoMax := digito;
        numero := numero DIV 10;
    end;
    digitoMayor := digitoMax;
end;

var num :integer;

begin
    Readln(num);
    Writeln('El digito mayor es: ', digitoMayor(num))
end.


program practica3ej2;

function module (numero,divisor :  integer) : integer;
var resto,cociente : integer;
begin
    cociente := numero div divisor;
    resto := numero -(cociente*divisor);
    module := resto;
end;

var num,divisor,modulo: integer;
begin
    Readln(num,divisor);
    modulo := module(num,divisor);
    Writeln('El modulo del numero es de : ',modulo);
end.

program practica3ej2B;

function module (numero,divisor :  integer) : integer;
var resto,cociente : integer;
begin
    cociente := numero div divisor;
    resto := numero -(cociente*divisor);
    module := resto;
end;

function par(numero:integer) : boolean;
begin
    if (module(numero,2)= 0) then
        par := true
    else 
        par := false;
end;

var  num:integer;

begin
    Readln(num);
    if par(num) then
        Writeln('El numero es par.')
    else Writeln('El numero es impar');
end.

program practica3ej3;

function Maximo(num1,num2:integer): integer;
begin
    if (num1>num2) then
        Maximo := num1
    else
        Maximo := num2;
end;

var a,b,c,d,numMax:integer;
begin
    Readln(a,b,c,d);
    numMax := Maximo(Maximo(a,b),Maximo(c,d));
    Write('El numero mas grande es: ',numMax);
end.

Program practica3ej4;

Function Capicua(numero:integer) : boolean;

Var cifra,numInvertido,numero2 : integer;
Begin
  numInvertido := 0;
  numero2 := numero;
  While numero2 <> 0 Do
    Begin
      cifra := numero2 Mod 10;
      numInvertido := numInvertido * 10 + cifra;
      numero2 := numero2 Div 10;
    End;
  Capicua := (numInvertido=numero);
  Writeln(numInvertido);
End;

Var num: integer;

Begin
  Readln(num);
  If Capicua(num) Then
    Writeln('El numero es capicua.')
  Else
    Writeln('El numero no es capicua.';
End.


program practica3ej5;

function Inverso (numero,digitos:integer) : integer;

begin
    Inverso := 0;
    while (digitos > 0) and (numero > 0) do
    begin
        Inverso := Inverso * 10 + (numero mod  10);
        numero := numero div 10;
        digitos := digitos - 1;
    end;
end;

var num : integer;

begin
    Readln(num);
    while num <> 0 do
    begin
        Writeln(Inverso(num,3));
        Writeln(Inverso(num,5));
        Readln(num);
    end;
end.


program practica3ej6;

var palabras5 : integer;

procedure procesar(var car : char);
var cantCar : integer;

begin
    cantCar := 0;
    while (car <> ' ') and (car <> '*') do
    Begin
        cantCar := cantCar + 1;
        Readln(car);
    end;
    if (cantCar = 5) then
        palabras5 := palabras5 + 1;
end;

var caracter:char;

begin
    palabras5 := 0;
    repeat
        Readln(caracter);
        while (caracter = ' ') do
            Readln(caracter);
        procesar(caracter);
    until(caracter = '*');
    Writeln('La cantidad de palabras con 5 digitos es de: ', palabras5);
end.


program practica3ej7;

function pesoPromedio (personas : integer) : real;
var peso:real ; i:integer;
begin
    pesoPromedio := 0;
    for i := 1 to personas do
    begin
        Readln(peso);
        pesoPromedio := pesoPromedio + peso;
    end;
    pesoPromedio := pesoPromedio / personas
end;

var cantPersonas : integer;

begin
    Readln(cantPersonas);
    Writeln('El peso promedio de las personas es de: ',pesoPromedio(cantPersonas));
end.


program practica3ej8;

function resultado(operador:char ; num1,num2:integer) : integer;
begin
    case operador of
        '+' : resultado := num1 + num2;
        '-' : resultado := num1 - num2;
        '*' : resultado := num1 * num2;
        '/' : resultado := num1 div num2;
    else
        resultado := -1;
end;

var a,b:integer; op:char;
Begin
    Readln(a,b); Readln(op);
    Writeln('El resultado de la operacion es : ',resultado(op,a,b));
end.


program practica3ej9;

var palabrasPA : integer;

procedure procesar(var car:char);
var carAnt:char; conPA:boolean;

begin
    carAnt :=' '  ; conPA := false;
    while (car <> '.') and (car <> ' ') do
    begin
        carAnt := car;
        Readln(car);
        if (car = 'a') and (carAnt = 'p') and (conPA = false) then uso un booleano para contar solo una vez en cada palabra
            conPA := true;
    end;
    if (conPA = true) then
        palabrasPA := palabrasPA + 1;
end;

var caracter : char;
begin
    palabrasPA := 0;
    repeat
        Readln(caracter);
        while (caracter = ' ')  do
            Readln(caracter);
        procesar(caracter);
    until(caracter = '.');
    Writeln('La cantidad de palabras con A seguida de P es de : ', palabrasPA);
end.


program practica3Bej1;

function potencia(i,n:integer) : integer;
var k:integer;

begin
    potencia := i;
    for k := 1 to (n-1) do
        potencia := potencia * i;
end;

begin
    Write(potencia(2,3));
end.

program practica3ej2;

function factorial(n:integer): integer;
var i:integer;
begin
    factorial := 1;
    for i := 1 to n do
        factorial := factorial * i;
end;

function combinatorio(m,n:integer) : integer;
begin
    combinatorio := (factorial(m)) div (factorial(m-n)*factorial(n));
end;

begin
    Write(combinatorio(,));
end.


program practica3Bej4;

type
    letras =set of char;

procedure Imprimir(letrasIn:letras);
var i:char;

begin
    for i := 'a' to 'z' do
    begin
        if (i in :=falseletrasIn) then
            Writeln(i,' no esta ingresada.');
    end;
end;

procedure contabilizar(var car:char);
var letrasIn:letras;
begin
    letrasIn := [];
    while (car <> ' ') and (car <> '#') do
    begin
        letrasIn := letrasIn + [car];
        Readln(car);
    end;
    Imprimir(letrasIn);
end;

var caracter:char;

begin
    repeat
        Readln(caracter);
        while (caracter = ' ') do
            Readln(caracter);
        contabilizar(caracter);
    until(caracter = '#');
end.

program practica3Bej5;  

type letras = set of char;
var consonantes,vocales:letras;

procedure procesar(var caracter:char;var cantVoc,cantCon:integer);

begin
    cantVoc:=0;cantCon:=0;
    while (caracter <> ' ') and (caracter <> '*') do
    begin
        if caracter in vocales then
            cantVoc := cantVoc + 1
        else if caracter in consonantes then
            cantCon := cantCon + 1;
        Readln(caracter);
    end; 
    Writeln('La cantidad de vocales es de: ',cantVoc);
    Writeln('La cantidad de consonantes es de: ',cantCon);
end;

var cantVoc,cantCon,posPalabra,vocMax,conMax,posVoc,posCon:integer; car:char;

begin
    consonantes := ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z'];
    vocales := ['a','e','i','o','u'];
    posPalabra:=0;vocMax:=0;conMax:=0;cantVoc:=0;cantCon:=0;posVoc:=0;posCon:=0;
    repeat
        Readln(car);
        while (car=' ') do
            Readln(car);
        procesar(car,cantVoc,cantCon);
        posPalabra := posPalabra + 1;
        if cantVoc > vocMax then
        begin
            vocMax:=cantVoc; posVoc:=posPalabra;
        end;
        if cantCon > conMax then
        begin
            conMax:=cantCon; posCon:=posPalabra;
        end;
    until(car = '*');
    Writeln('La posicion de la palabra con mas vocales es: ', posVoc,', La posicion de la palabra con mas consonantes es: ',posCon);
end.
}
program practica3Bej6;

type letras = set of char;
var conjA,conjB,conjC,mayus,minus:letras; car:char; condA,condB,condC:boolean;

begin
    mayus:=['A'..'Z']; minus:=['a'..'z']; conjA:=[]; conjB:=[];
    condA:=false; condB:=false; condC:=false;
    Readln(car);
    while (car = ' ') do
        Readln(car);
    while (car in mayus) and (car <> '.') and (car <> ' ') do
    begin
        conjA := conjA + [car];
        Readln(car);
    end;
    if (conjA <> []) and (conjA <= mayus) then
        condA := true;
    if car = '@' then
        condB := true;
    Readln(car);
    conjC := (mayus + minus) - conjA;
    while (car in conjC) and (car <> '.') and (car <> ' ') do
    begin
        conjB := conjB + [car];
        Readln(car);
    end;
    if conjB <= conjC then  
        condC := true;
    if condA and condB and condC then
        Writeln('La condicion se cumple.')
    else
    begin
        if  condA=false then Writeln('La condicion A no se cumple');
        if  condB=false then Writeln('La condicion B no se cumple');
        if  condC=false then Writeln('La condicion C no se cumple');
    end;
end.

}