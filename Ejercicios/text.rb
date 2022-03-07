require 'fox16'
include Fox

class PasswordGenerator < FXMainWindow
  def initialize(app)
    super(app, "Password generator", :width => 400, :height => 200)
    hFrame1 = FXHorizontalFrame.new(self)
    chrLabel = FXLabel.new(hFrame1, "Number of characters in password:")
    chrTextField = FXTextField.new(hFrame1, 4)
    hFrame2 = FXHorizontalFrame.new(self)
    specialChrsCheck = FXCheckButton.new(hFrame2, "Include special characters in password")
    vFrame1 = FXVerticalFrame.new(self, :opts => LAYOUT_FILL)
    textArea = FXText.new(vFrame1, :opts => LAYOUT_FILL | TEXT_READONLY | TEXT_WORDWRAP)
    hFrame3 = FXHorizontalFrame.new(vFrame1)
    generateButton = FXButton.new(hFrame3, "Generate")
    copyButton = FXButton.new(hFrame3, "Copy to clipboard")
  end
  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

if __FILE__ == $0
  FXApp.new do |app|
    PasswordGenerator.new(app)
    app.create
    app.run
  end
end
