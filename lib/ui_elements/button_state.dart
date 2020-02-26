class ButtonState {

  ButtonState(buttonState){this.buttonState  = buttonState;}
  bool buttonState = false;


  void changeBtnState(){
    if (!getButtonState()){
    buttonState = !buttonState;
    }
  }

  bool getButtonState(){
    return buttonState;
  }


}