def suma(dato)
	sumar = 0
	for i in 0 .. dato.size - 1
		sumar = sumar + dato[i]
	end
	return sumar
end

info = [12, 25, 35, 45, 85, 12, 5]
info2 = [300, 400, 500, 600]

puts suma(info)
puts suma(info2)

def num_mayor(datos)
	num = 0
	pos = 0
	for i in 0 .. datos.size - 1
		if datos[i] > num
			num = datos[i]	
			pos = i		
		end
	end	
	return num, pos
end

info = [12, 10, 35, 45, 85, 12, 5]

puts num_mayor(info)

def arreglos(dato1, dato2)
	return dato1 === dato2
=begin
	array1 = dato1.size - 1
	array2 = dato2.size - 1
	entre = true
	resultado = ""

	if array1 == array2
		for i in 0 .. array1.size - 1
			if array1[i] == array2[i] and entre
				resultado = "igual"
			else
				resultado = "no es igual"
				entre = false
			end
		end
	else
		resultado = "no es igual"	
	end
	return resultado
=end
end

info = [12, 25, 35, 45, 85, 12, 5]
info2 = [300, 400, 500, 600]

puts arreglos(info, info2)

def buscar_alumno(nombre, arreglos)
	posicion = 0
	for i in 0 .. arreglos.size - 1
		if nombre.to_s == arreglos[i]
			posicion = i
		else
			posicion = "No existe"
		end
	end
	return posicion
end

info = ["Ana", "Pedro", "Carlos", "Alejandro", "Geraldine"]
puts buscar_alumno("Geraldine", info)

def almacenes()
	total = 0
	media = 0
	almacen = ["Almacen1","Almacen2","Almacen3","Almacen4","Almacen5","Almacen6","Almacen7","Almacen8","Almacen9","Almacen10"]
	ventas = [100, 152, 654, 74, 654, 780, 325, 983, 417, 210]

	for i in 0 .. ventas.size - 1
		total = total + ventas[i]
	end
	media = total / ventas.size

	for i in 0 .. ventas.size - 1
		if media < ventas[i]
			puts almacen[i]
		end
	end
end

almacenes

def mayor_venta(datos)
	mayor = 0
	dia = 0
	for i in 0 .. datos.size - 1
		if datos[i] > mayor
			mayor = datos[i]
			dia = i + 1
		end
	end
	return dia
end

info = [200, 451, 1351, 784, 300, 1722, 120]

puts mayor_venta(info)

