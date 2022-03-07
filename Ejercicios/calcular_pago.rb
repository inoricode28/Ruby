def calcular_pago(horas, valor, tasa)
	bruto = horas * valor
	impuesto = bruto * (tasa / 100)
	neto = bruto - impuesto
	puts "Pago Bruto: " + bruto.round(2).to_s
	puts "Dscto " + tasa.to_s + "% es: " + impuesto.round(2).to_s
	puts "Pago Neto " + neto.round(2).to_s
end

puts calcular_pago(10,5,20)