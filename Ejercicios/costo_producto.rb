def costo_venta(precio_venta)
	igv = 0.18
	valor_venta = precio_venta / (1+igv)
	puts "Valor Venta: " + valor_venta.round(2).to_s
	valor_igv = precio_venta - valor_venta
	puts "Valor IGV: " + valor_igv.round(2).to_s
	puts "Precio Venta: " + precio_venta.round(2).to_s
end
puts "---Calcular el Costo y el IGV---"
costo_venta(95.47)