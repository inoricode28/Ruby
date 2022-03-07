require "rubygems"
require "arduino_firmata"
#iniciamos la conexión a Arduino
arduino = ArduinoFirmata.connect
#imprimimos la versión de Firmata como éxito en la conexión
puts "firmata version #{arduino.version}"
#luego hacemos un ciclo infinito que nos permite cada 0.5 segundos
#prender y apagar el led que está en el puerto 13
#e imprimimos en consola el estado del led
loop do
	arduino.digital_write 13, true
	sleep 0.5
	puts "Prende"
	arduino.digital_write 13, false
	sleep 0.5
	puts "Apaga"
end