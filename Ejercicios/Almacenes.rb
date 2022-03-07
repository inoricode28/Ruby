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

almacenes()
