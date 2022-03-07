def arregloNombres
	nombres=["Maria","Henry","Cinthia","Neisy","Ever"]
	puts "Ingrese nombre a buscar"
	nombre = gets.chomp
	i=0
	while i<nombres.size-1 and nombres[i]!=nombre
		i += 1
	end
	if (nombres[i]==nombre)
		puts "Nombre encontrado en indice "+i.to_s
	else
		puts "Nombre No encontrado"
	end
end

arregloNombres()
