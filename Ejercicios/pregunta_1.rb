def venta_rollos(longitud)
	rollo_500 = longitud / 500
	rollo_1 = longitud % 500

	rollo_300 = rollo_1 / 300
	rollo_2 = rollo_1 % 300

	rollo_75 = rollo_2 / 75
	rollo_3 = rollo_2 % 75

	rollo_faltante = 75 - rollo_3

	puts "Longitud total de alambres de " + longitud.to_s + " pies se divide en: "
	puts "La cantidad de alambres de 500 pies es: " + rollo_500.to_s
	puts "La cantidad de alambres de 300 pies es: " + rollo_300.to_s
	puts "La cantidad de alambres de 75 pies es: " + rollo_75.to_s
	puts "La cantidad para completar el rollo de 75 es: " + rollo_faltante.to_s + " pies"
end

#Ingresar la longitud de rollos en pies
venta_rollos(5334)