public class Text{
  String contents;
  int x;
  int y;
  boolean show;
  
  public Text(String contents, int xcoord, int ycoord){
    this.contents = contents;
    this.x = xcoord;
    this.y = ycoord;
    this.show = true;
  }
  
  public void addText(String newText){
    this.contents = contents + " " + newText;  
  }
  
  public void move(int newX, int newY){
    this.x = newX;
    this.y = newY;
    this.toggle();
    this.writeText();
  }
  
  public void writeText(){
    if(this.show == true)
    text(contents, this.x, this.y);
  }
  
  public void toggle(){
    if(this.show == true){
      this.show = false;  
    }
    else if(this.show == false){
      this.show = true;  
    }
  }

}