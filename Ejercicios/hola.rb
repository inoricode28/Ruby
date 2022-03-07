def holamundo(valor,nombre)
	print "Ingrese numero1: "
	n1 = gets.chomp.to_i
	print "Ingrese numero2: "
	n2 = gets.chomp.to_i
	resul= (n1+n2)*valor.to_i
	texto = "mi nombre es: " + nombre.to_s + " y mi edad es " + resul.to_s
	return texto
	
end

print holamundo(2,"Alfonzo")
