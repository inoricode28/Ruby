def ventas_semanal(ventas)
	sueldo = 200.00
	porc_comision = 0.09

	comision = ventas * porc_comision
	total = sueldo + comision
	puts "Sueldo por semana es: S/ " + sueldo.to_s
	puts "La comisión por venta es: S/ " + comision.round(2).to_s
	puts "La ganancia total es: S/ " + total.round(2).to_s
end

#Ingresar el total de ventas por semana
ventas_semanal(5000)