require 'bundler/setup'
require 'dino'
#hacemos una conexión serial con el Arduino
board = Dino::Board.new(Dino::TxRx::Serial.new)
#configuramos el led
led = Dino::Components::Led.new(pin: 13, board: board)
#le decimos que prenda y apague cada 0.5 segundos
[:on, :off].cycle do |switch|
	led.send(switch)
	puts "Ciclo"
	sleep 0.5
end
