def venta_usb(cantidad, marca)
	pvp_usb = 30.00
	total_bruto = pvp_usb * cantidad.to_i
	total_neto = cantidad.to_i * (pvp_usb * (1 - marca_usb(marca)))
	descuento = total_bruto - total_neto

	puts "Importe bruto: S/ " + total_bruto.to_s
	puts "Descuento: S/ " + descuento.to_s
	puts "Importe a pagar: S/ " + total_neto.to_s
end

def marca_usb(marca)
	if marca == "3M"
		return 0.10
	elsif marca == "NCR"
		return 0.15
	elsif marca == "Sentinel"
		return 0.20
	elsif marca == "Burroughs"
		return 0.25
	elsif marca == "Goldstar"
		return 0.30
	else
		return 0.00																																		
	end
end

#Ingresar la cantidad y la marca del USB
venta_usb(20,"NCR")