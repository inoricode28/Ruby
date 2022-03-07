def operador_matematico(num1, num2, operador)
	total = 0
	case 
	when operador == "suma"
		total = num1 + num2
	when operador == "resta"
		total = num2 - num1
	when operador == "multiplicar"
		total = num1 * num2
	when operador == "dividir"
		total = num2 / num1
	when operador == "modulo"
		total = num2 % num2
	end		
		
	return total

end

puts operador_matematico(4,16,"multiplicar")