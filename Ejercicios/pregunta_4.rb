def total_pago(pago, colegio, tipo)
	descuento = pago.to_i * tabla_dsctos(colegio, tipo)
	cuota = pago.to_i - descuento

	puts "Pago/cuota Instituto: S/ " + pago.to_s
	puts "Descuento: S/ " + descuento.to_s
	puts "Monto a pagar: S/ " + cuota.to_s
end

def tabla_dsctos(colegio, tipo)
	if colegio == "Nacional"
		if tipo == "A"
			return 0.50
		elsif tipo == "B"
			return 0.40
		elsif tipo == "C"
			return 0.30
		else
			return "Tipo no valido"			
		end
	elsif colegio == "Particular"
		if tipo == "A"
			return 0.25
		elsif tipo == "B"
			return 0.20
		elsif tipo == "C"
			return 0.15
		else
			return "Tipo no valido"			
		end
	else
		return "Colegio no valido"
	end
end

#Ingresar la cuota, procedencia del colegio y tipo
puts total_pago(1124,"Particular","A")