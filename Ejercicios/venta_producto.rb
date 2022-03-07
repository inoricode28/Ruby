def producto_venta(valor_venta)
	igv = 0.18
	puts "Valor de Venta: " + valor_venta.to_s
	valor_igv = valor_venta * igv
	puts "IGV: " + valor_igv.to_s
	precio_venta = valor_venta + valor_igv
	puts "Precio Venta: " + precio_venta.to_s
end

producto_venta(100)