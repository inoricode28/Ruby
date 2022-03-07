require 'fox16'
include Fox
class CajadeTexto < FXMainWindow
	def initialize(app)
		super(app, "Angelion", :width=>300, :height=>300)
		FXTextField.new (p self, ncols 50)
	
	end
def create
	super
	show(PLACEMENT_SCREEN)	
end
end
objeto=FXApp.new
CajadeTexto.new(objeto)
objeto.create
objeto.run