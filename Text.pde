public class Text{
  String contents;
  int x;
  int y;
  boolean show;
  
  public Text(String contents, int xcoord, int ycoord){
    println("hello2");
    this.contents = contents;
    this.x = xcoord;
    this.y = ycoord;
    this.show = true;
    textlist.add(this);
    println("size" + textlist.size());
  }
  
  public void addText(String newText){
    textlist.remove(this);
    this.contents = contents + " " + newText;  
    textlist.add(this);
  }
  
  public void move(int newX, int newY){
    textlist.remove(this);
    this.x = newX;
    this.y = newY;
    textlist.add(this);
    this.toggle();
    this.writeText();
  }
  
  public void writeText(){
    if(this.show == true){
    fill(0);
    text(contents, this.x, this.y);
    }
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