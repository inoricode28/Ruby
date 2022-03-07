def sumaArreglo
   numeros=[10,15,8,6,20,3,9,12]
   suma = 0
   for i in 0..numeros.size-1
   	   suma=suma +numeros[i]
   end	
   puts suma
   mayor = numeros[0]
   posmay=0
   for i in 0..numeros.size-1
   		if numeros[i]>mayor
   			mayor= numeros[i]
   			posmay=i
   		end
    end
    puts "El numero mayor es "+mayor.to_s
    puts "Y se encuentra en el indice "+posmay.to_s
end
def arregloNombres
	nombres=["Maria","Henry","Cinthia","Neisy","Ever"]
	puts "Ingrese nombre a buscar"
	nombre = gets.chomp
	i=0
	while i<nombres.size-1 and nombres[i]!=nombre
		i=i+1
	end
	if (nombres[i]==nombre)
		puts "Nombre encontrado en indice "+i.to_s
	else
		puts "Nombre No encontrado"
	end
end	
def almacenes
	almacen=[20,40,60,80,30,15,50,10,5,35]
	promedio=0.0
	suma=0
	for i in 0..almacen.size-1
        suma=suma+almacen[i]
    end
    promedio=(suma*1.0/almacen.size)
    puts promedio
    for i in 0..almacen.size-1
    	if almacen[i] > promedio
    		puts "indice: "+i.to_s+" valor: "+almacen[i].to_s
    	end
    end
end
def descompone numero
	#numero=12345
	inverso=0
	while numero >0
		resto=numero % 10
		numero = numero/10
		inverso=inverso*10+resto
    end
    puts inverso
end
#num=gets.chomp.to_i
#descompone num
#sumaArreglo
#arregloNombres
almacenes
