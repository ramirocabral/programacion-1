
{Program prac1Ej2;

Var promHabitantes,porcentajePartidos,habitantesMax,habitantesMin : real;
habitantesCiudad,habitantesPartido,cantCiudades,i,j : integer;

Begin
  habitantesMax := -9999;
  habitantesMin := 9999;
  habitantesPartido := 0;
  promHabitantes := 0;
  porcentajePartidos := 0;
  For i :=1 To 3 Do
    Begin
      Write('Ingrese la cantidad de ciudades:');
      Readln(cantCiudades);
      For j := 1 To cantCiudades Do
        Begin
          Write('Ingrese la cantidad de habitantes de la ciudad');
          Readln(habitantesCiudad);
          habitantesPartido := habitantesPartido + habitantesCiudad;
        End;
      promHabitantes := habitantesPartido / cantCiudades;
      Writeln(promHabitantes);
      If promHabitantes < habitantesMin Then
        habitantesMin := promHabitantes;
      If promHabitantes > habitantesMax Then
        habitantesMax  := promHabitantes;
      If promHabitantes > 10.000 Then
        porcentajePartidos := porcentajePartidos +1;
      habitantesPartido := 0;
      promHabitantes := 0;
    End;
  Writeln (habitantesMax,habitantesMin,porcentajePartidos*100/135);
End.

program prac1ej4;

var promNieve,porcentajeLocal: real; localMenor,localMenor2,cantNieve,nieveTotal,localMayor,localMayor2,i : integer;

begin
  porcentajeLocal:=0;localMenor:=9999;localMenor2:=9999;localMayor:=-9999;localMayor2:=9999;nieveTotal:=0;
  for i:= 1 to 10 Do
    begin
      Write('Ingrese la cantidad de nieve caida');
      Readln(cantNieve);
      nieveTotal := nieveTotal + cantNieve;
      if cantNieve < localMenor then
        localMenor := cantNieve
      else if cantNieve < localMenor2 Then
        localMenor2 := cantNieve;
      if cantNieve > localMayor then
        localMayor := cantNieve
      else if cantNieve > localMayor2 then
        localMayor2 := cantNieve;
      if cantNieve > 100 then
        porcentajeLocal := porcentajeLocal + 1;
    end;
  Writeln('El promedio de nieve caida es de:',nieveTotal/10);
  Writeln('El porcentaje de localidades cuyo valor supera los 100ml es de:',porcentajeLocal*10);
end.

program prac1Ej5;

var pesosFit,pesosFat,pesoOso,pesoMax,pesoMin:real; edadOso,ososFit,ososFat:integer;

begin
  pesoMax:=-9999;pesoMin:=-9999;ososFit:=0;ososFat:=0;pesosFit:=0;pesosFat:=0;
  repeat
    Write('Ingrese la edad del oso:');
    Readln(edadOso);
    Write('Ingrese el peso del oso:');
    Readln(pesoOso);
    if edadOso > 0 then
    begin
    if pesoOso < 3.0 then
      begin
        ososFit := ososFit + 1;
        pesosFit := pesosFit + pesoOso;
        if pesoOso < pesoMin then
          pesoMin := pesoOso;
      end
      else
        ososFat := ososFat + 1;
        pesosFat := pesosFat + pesoOso;
        if pesoOso > pesoMax then
          pesoMax := pesoOso;
    end;
  until(edadOso < 0);
  if ososFit > 0 then
    Writeln('El peso minimo de los osos Fit es de:', pesoMin ,', y el peso promedio es de:',pesosFit/ososFit);
  if ososFat > 0 then
    Write('El peso maximo de los osos Fat es de:', pesoMax ,', y el peso promedio es de:',pesosFat/ososFat);
end.

program prac1ej6;

var codigoProducto,cantVendida,productoMasVendido,codProductoMax,codProductoMasRec:integer; precioProducto,productoMasRecaudado:real;

Begin
  productoMasRecaudado:=-9999;productoMasVendido:=-9999;
  repeat
    Write('Ingrese el codigo del producto:');
    Readln(codigoProducto);
    if codigoProducto <> 0 then
      begin
        Write('Ingrese el precio del producto:');
        Readln(precioProducto);
        Write('Ingrese la cantidad vendida:');
        Readln(cantVendida);
        if cantVendida > productoMasVendido then
          begin
          productoMasVendido := cantVendida;
          codProductoMax := codigoProducto;
          end;
        if cantVendida * precioProducto > productoMasRecaudado then
          begin
          productoMasRecaudado := cantVendida * precioProducto;
          codProductoMasRec := codigoProducto;
          end;
      end;
  until(codigoProducto=0);
  Writeln('El producto que se vendio mas veces es:', codProductoMax);
  Writeln('El producto que mas recaudo es:', codProductoMasRec);
end.

program prac1;

var i,codLibro,codLibroMenor,codLibroMenor2,cantPaginas,cantPaginasMax,menorPaginas,menorPaginas2,codLibroMayor:integer;

begin
  cantPaginasMax:=-9999;menorPaginas:=9999;menorPaginas2:=9999;codLibroMenor:=0;
  for i := 1 to 3 do
    begin
      Write('Ingrese el codigo del libro:');
      Readln(codLibro);
      Write('Ingrese la cantidad de paginas:');
      Readln(cantPaginas);
      if cantPaginas > cantPaginasMax then
        begin
        cantPaginasMax := cantPaginas;
        codLibroMayor := codLibro;
        end;
      if cantPaginas < menorPaginas then
        begin
        menorPaginas2 := menorPaginas;
        codLibroMenor2 := codLibroMenor;
        menorPaginas := cantPaginas;
        codLibroMenor := codLibro;
        end
        else if cantPaginas < menorPaginas2 then 
          begin
          menorPaginas2 := cantPaginas;
          codLibroMenor2 := codLibro;
          end;
    end;  
  Writeln('El libro con menor numero de paginas es:', codLibroMenor, ' ,y el segundo es:', codLibroMenor2);
  Writeln('El libro con mayor cantidad de paginas es:',codLibroMayor, ', y su numero de paginas es:',cantPaginasMax);
end.}

program prac1ej7;

var i,numeroAlumno,numAlumnoMax,cantMaterias:integer; notaMateria,notaTotal,notaMax,promedioAlumno,promedioMax:real;

begin
  promedioMax:=-1;
  repeat
    notaTotal:=0;notaMax:=-1;
    Write('Ingrese el numero de alumno:');
    Readln(numeroAlumno);
    Write('Ingrese el numero de materias aprobadas:');
    Readln(cantMaterias);
    Writeln('Ingrese las notas de cada materia');
    for i := 1 to cantMaterias do
    begin
      Write('Ingrese la nota de la materia ', i,':');
      Readln(notaMateria);
      notaTotal := notaTotal + notaMateria;
      if notaMateria > notaMax then
      begin
        notaMax := notaMateria;
      end;
    end;
    Writeln('La nota maxima obtenida por al alumno es: ',notaMax);
    promedioAlumno := notaTotal / cantMaterias;
    if promedioAlumno > promedioMax then
    begin
      promedioMax := promedioAlumno;
      numAlumnoMax := numeroAlumno;
    end;
  until(numeroAlumno=756);
  Writeln('El numero del alumno con mayor promedio es: ',numAlumnoMax);
end.