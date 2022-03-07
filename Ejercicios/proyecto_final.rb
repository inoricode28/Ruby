require 'date'

def inserta_por_inicio(date_value,value)
	nuevo = []
	nuevo = [date_value,value,nil]
	if @listaMediciones == nil
	    @listaMediciones = nuevo
	else
	nuevo[2] = @listaMediciones
	@listaMediciones = nuevo
	end
end

def inserta_por_final(date_value,value)
	nuevo = []
	nuevo = [date_value,value,nil]
	if @listaMediciones == nil
	    @listaMediciones = nuevo
	else
	    p = @listaMediciones
	    while p[2] != nil
	    	p = p[2]
	    end
	    p[2] = nuevo
	end
end

def formatYear(date_value)
	return date_value.year.to_s
end
def formatMonth(date_value)
	return date_value.year.to_s + "/" + format2Char(date_value.mon).to_s
end
def formatDate(date_value)
	return date_value.year.to_s + "/" + format2Char(date_value.mon).to_s + "/" + format2Char(date_value.mday).to_s
end
def formatDateTime(date_value)
	return date_value.year.to_s + "/" + format2Char(date_value.mon).to_s + "/" + format2Char(date_value.mday).to_s + " " + format2Char(date_value.hour).to_s + ":" + format2Char(date_value.min).to_s
end
def format2Char(value)
	if value.to_s.size==1 then
		return ("0" + value.to_s)
	else
		return value.to_s
	end
end
def hoursBetweenDates(date1,date2)
	return ((date1.to_time-date2.to_time)/3600).round(2).to_f
end
def nextDate(date_value)
	return (date_value.to_time+(86400)).to_datetime
end
def nextHour(date_value)
	return (date_value.to_time+(3600)).to_datetime
end
def auxValueMes(date_value)
	return date_value.year.to_i*100 + date_value.mon.to_i
end
def metodoPromedioDiario(componente, ubigeo, fechaInicio, fechaFin, arrayMediciones,arrayComponente,arrayFecha,arrayUbigeo)
	@listaMediciones = nil
	acumulador = 0
	contador = 0
	while ( fechaInicio <= fechaFin )
		for i in 0..arrayMediciones.size - 1
			if( hoursBetweenDates(arrayFecha[i],fechaInicio)>0.0 and hoursBetweenDates(arrayFecha[i],fechaInicio)<24.0 and arrayComponente[i] == componente and arrayUbigeo[i] == ubigeo )
				acumulador = acumulador + arrayMediciones[i]
				contador += 1
			end
		end
		if contador>0 then
			inserta_por_final(formatDate(fechaInicio),(acumulador/contador).round(2))
		else
			inserta_por_final(formatDate(fechaInicio),0)
		end
		
		acumulador = 0
		contador = 0
		fechaInicio = nextDate(fechaInicio)
	end
end
def metodoPromedio8Movil(componente, ubigeo, fechaInicio, fechaFin, arrayMediciones,arrayComponente,arrayFecha,arrayUbigeo)
	@listaMediciones = nil
	acumulador = 0
	contador = 0
	fechaFin = nextDate(fechaFin)
	while ( fechaInicio < fechaFin )
		for i in 0..arrayMediciones.size - 1
			if( hoursBetweenDates(fechaInicio,arrayFecha[i])>0.0 and hoursBetweenDates(arrayFecha[i],fechaInicio)<=8.0 and arrayComponente[i] == componente and arrayUbigeo[i] == ubigeo )
				acumulador = acumulador + arrayMediciones[i]
				contador += 1
			end
		end
		if contador>0 then
			inserta_por_final(formatDateTime(fechaInicio),(acumulador/contador).round(2))
		else
			inserta_por_final(formatDateTime(fechaInicio),0)
		end
		
		acumulador = 0
		contador = 0
		fechaInicio = nextHour(fechaInicio)
	end
end
def metodoPromedio3Movil(componente, ubigeo, fechaInicio, fechaFin, arrayMediciones,arrayComponente,arrayFecha,arrayUbigeo)
	@listaMediciones = nil
	acumulador = 0
	contador = 0
	fechaFin = nextDate(fechaFin)
	while ( fechaInicio < fechaFin )
		for i in 0..arrayMediciones.size - 1
			if( hoursBetweenDates(fechaInicio,arrayFecha[i])>0.0 and hoursBetweenDates(arrayFecha[i],fechaInicio)<=3.0 and arrayComponente[i] == componente and arrayUbigeo[i] == ubigeo )
				acumulador = acumulador + arrayMediciones[i]
				contador += 1
			end
		end
		if contador>0 then
			inserta_por_final(formatDateTime(fechaInicio),(acumulador/contador).round(2))
		else
			inserta_por_final(formatDateTime(fechaInicio),0)
		end
		
		acumulador = 0
		contador = 0
		fechaInicio = nextHour(fechaInicio)
	end
end
def metodoPromedioHorario(componente, ubigeo, fechaInicio, fechaFin, arrayMediciones,arrayComponente,arrayFecha,arrayUbigeo)
	@listaMediciones = nil
	acumulador = 0
	contador = 0
	fechaFin = nextDate(fechaFin)
	while ( fechaInicio < fechaFin )
		for i in 0..arrayMediciones.size - 1
			if( hoursBetweenDates(arrayFecha[i],fechaInicio)>0.0 and hoursBetweenDates(arrayFecha[i],fechaInicio)<=1.0 and arrayComponente[i] == componente and arrayUbigeo[i] == ubigeo )
				acumulador = acumulador + arrayMediciones[i]
				contador += 1
			end
		end
		if contador>0 then
			inserta_por_final(formatDateTime(fechaInicio),(acumulador/contador).round(2))
		else
			inserta_por_final(formatDateTime(fechaInicio),0)
		end
		
		acumulador = 0
		contador = 0
		fechaInicio = nextHour(fechaInicio)
	end
end
def metodoPromedioMes(componente, ubigeo, fechaInicio, fechaFin, arrayMediciones,arrayComponente,arrayFecha,arrayUbigeo)
	@listaMediciones = nil
	acumulador = 0
	contador = 0
	auxValue = auxValueMes(fechaInicio)
	auxMonthValue = ""
	while ( auxValue <= auxValueMes(fechaFin) )
		for i in 0..arrayMediciones.size - 1
			if( auxValue == auxValueMes(arrayFecha[i]) and arrayComponente[i] == componente and arrayUbigeo[i] == ubigeo )
				acumulador = acumulador + arrayMediciones[i]
				contador += 1
			end
		end

		auxMonthValue = (auxValue/100).to_s + "/" + format2Char(auxValue%100).to_s

		if contador>0 then
			inserta_por_final(auxMonthValue,(acumulador/contador).round(2))
		else
			inserta_por_final(auxMonthValue,0)
		end
		
		acumulador = 0
		contador = 0
		if( auxValue%100 == 12 )
			auxValue = ( ( ( auxValue/100 )+1 )*100 )+1
		else
			auxValue = auxValue + 1
		end
		
	end
end
def metodoPromedioAnual(componente, ubigeo, fechaInicio, fechaFin, arrayMediciones,arrayComponente,arrayFecha,arrayUbigeo)
	@listaMediciones = nil
	acumulador = 0
	contador = 0
	auxValue = fechaInicio.year
	while ( auxValue <= fechaFin.year )
		for i in 0..arrayMediciones.size - 1
			if( auxValue == arrayFecha[i].year and arrayComponente[i] == componente and arrayUbigeo[i] == ubigeo )
				acumulador = acumulador + arrayMediciones[i]
				contador += 1
			end
		end

		if contador>0 then
			inserta_por_final(auxValue.to_s,(acumulador/contador).round(2))
		else
			inserta_por_final(auxValue.to_s,0)
		end
		
		acumulador = 0
		contador = 0
		auxValue = auxValue + 1
		
	end
end
def imprimirLista(space_Inicial,space_Secundario)
	p = @listaMediciones
	puts ""
	maxValue = obtenerMaxValue
	puts space_Inicial.to_s + imprimirMedicionY(maxValue,1,"")
	puts space_Secundario.to_s + imprimirMedicionYAux(maxValue,1,"")
	while p[2] != nil
		puts p[0].to_s + " |" + imprimirMedicionYGeneral(p[1].to_i,1,"")
		p = p[2]
	end
	puts p[0].to_s + " |" + imprimirMedicionYGeneral(p[1].to_i,1,"")
end
def obtenerMaxValue()
	p = @listaMediciones
	maxValue = 0.0
	while p[2] != nil
		if (p[1]>maxValue) then
			maxValue = p[1]
		end
		p = p[2]
	end
	if (p[1]>maxValue) then
		maxValue = p[1]
	end
	return maxValue.to_i
end
def imprimirMedicionY(value,contador,cadena)
	if contador < 10 then
		cadena = cadena + "  " + contador.to_s
	else
		cadena = cadena + " " + contador.to_s
	end
	if contador==value then
		return cadena
	else
		return imprimirMedicionY(value,contador+1,cadena)
	end
end
def imprimirMedicionYAux(value,contador,cadena)
	cadena = cadena + "---"
	if contador==value then
		return cadena + "-->"
	else
		return imprimirMedicionYAux(value,contador+1,cadena)
	end
end
def imprimirMedicionYGeneral(value,contador,cadena)
	if value==0 then
		return cadena
	else
		if contador==value then
			cadena = cadena + "  x"
			return cadena
		else
			cadena = cadena + "   "
			return imprimirMedicionYGeneral(value,contador+1,cadena)
		end
	end
end

@ArrayFecha=[DateTime.new(2017,11,1,6,10),	DateTime.new(2017,11,1,12,15),	DateTime.new(2017,11,1,18,20),	DateTime.new(2017,11,1,23,25),	DateTime.new(2017,11,2,6,30),	DateTime.new(2017,11,2,12,35),	DateTime.new(2017,11,2,18,40),	DateTime.new(2017,11,2,23,45),	DateTime.new(2017,11,3,6,50),	DateTime.new(2017,11,3,12,10),	DateTime.new(2017,11,3,18,15),	DateTime.new(2017,11,3,23,20),	DateTime.new(2017,11,4,6,25),	DateTime.new(2017,11,4,12,30),	DateTime.new(2017,11,4,18,35),	DateTime.new(2017,11,4,23,40),	DateTime.new(2017,11,5,6,45),	DateTime.new(2017,11,5,12,50),	DateTime.new(2017,11,5,18,10),	DateTime.new(2017,11,5,23,15),	DateTime.new(2017,11,6,6,20),	DateTime.new(2017,11,6,12,25),	DateTime.new(2017,11,6,18,30),	DateTime.new(2017,11,6,23,35),	DateTime.new(2017,11,7,4,40),	DateTime.new(2017,11,7,8,45),	DateTime.new(2017,11,7,12,50),	DateTime.new(2017,11,7,16,10),	DateTime.new(2017,11,7,20,15),	DateTime.new(2017,11,7,23,20),	DateTime.new(2018,1,2,8,55),	DateTime.new(2018,2,6,8,10),	DateTime.new(2018,3,10,8,15),	DateTime.new(2018,4,14,8,20),	DateTime.new(2018,5,18,8,25),	DateTime.new(2018,6,22,8,30),	DateTime.new(2018,7,26,8,35),	DateTime.new(2018,8,30,8,40),	DateTime.new(2018,9,2,8,45),	DateTime.new(2018,10,6,8,50),	DateTime.new(2018,11,10,8,55),	DateTime.new(2018,12,14,8,10),	DateTime.new(2019,1,18,8,15),	DateTime.new(2019,2,22,8,20),	DateTime.new(2019,3,26,8,25),	DateTime.new(2019,4,30,8,30),	DateTime.new(2019,5,2,8,35),	DateTime.new(2019,6,6,8,40),	DateTime.new(2019,7,10,8,45),	DateTime.new(2019,8,14,8,50)]
@ArrayMedicion=[3.9,2.10,4.6,2.3,4.4,4.0,2.5,5.6,2.10,3.2,4.5,2.6,5.4,5.7,5.8,3.9,2.10,4.8,4.7,3.0,2.2,2.9,4.5,3.1,3.10,5.5,2.7,2.2,5.7,3.0,4.7,3.8,5.3,4.10,4.2,4.10,3.8,2.1,5.3,2.0,2.4,4.4,5.9,2.10,5.9,3.6,3.9,3.8,5.7,3.2]
@ArrayComponente=["CO","NO","CO","PM25","CO","NO","CO","PM25","CO","NO","CO","PM25","CO","NO","CO","PM25","CO","NO","CO","PM25","CO","NO","CO","PM25","CO","NO","CO","PM25","CO","NO","CO","PM25","CO","NO","CO","PM26","CO","NO","CO","PM27","CO","NO","CO","PM28","CO","NO","CO","PM29","CO","NO"]
@ArrayUbigeo=["Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa","Arequipa"]

metodoPromedioDiario("CO", "Arequipa", DateTime.new(2017,11,1), DateTime.new(2017,11,7), @ArrayMedicion,@ArrayComponente,@ArrayFecha,@ArrayUbigeo)
#metodoPromedio8Movil("CO", "Arequipa", DateTime.new(2017,11,1), DateTime.new(2017,11,4), @ArrayMedicion,@ArrayComponente,@ArrayFecha,@ArrayUbigeo)
#metodoPromedio3Movil("CO", "Arequipa", DateTime.new(2017,11,1), DateTime.new(2017,11,4), @ArrayMedicion,@ArrayComponente,@ArrayFecha,@ArrayUbigeo)
#metodoPromedioHorario("CO", "Arequipa", DateTime.new(2017,11,1), DateTime.new(2017,11,4), @ArrayMedicion,@ArrayComponente,@ArrayFecha,@ArrayUbigeo)
#metodoPromedioMes("CO", "Arequipa", DateTime.new(2017,01), DateTime.new(2019,01), @ArrayMedicion,@ArrayComponente,@ArrayFecha,@ArrayUbigeo)
#metodoPromedioAnual("CO", "Arequipa", DateTime.new(2017), DateTime.new(2019), @ArrayMedicion,@ArrayComponente,@ArrayFecha,@ArrayUbigeo)
print @listaMediciones
#imprimirLista("     |","-----|") #anual
#imprimirLista("        |","--------|") #mensual
#imprimirLista("                 |","-----------------|") # dias con horas
imprimirLista("           |","-----------|") # dias sin horas
