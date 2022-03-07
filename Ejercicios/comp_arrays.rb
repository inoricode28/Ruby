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
info2 = [12, 25, 35, 45, 85, 12, 5]
#info2 = [300, 400, 500, 600]

puts arreglos(info, info2)

