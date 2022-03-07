def calcular_edad(anio)
	a_actual = 2019
	edad = a_actual - anio
	return "La edad es: " + edad.to_s
end

puts calcular_edad(1993)