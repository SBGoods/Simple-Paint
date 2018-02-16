public class Text{
  String contents;
  Pair<Integer, Integer> coordinates;
  boolean show;
  
  public Text(String contents, int xcoord, int ycoord){
    this.contents = contents;
    this.coordinates = new Pair<Integer, Integer>(xcoord, ycoord);
    this.show = true;
  }
  
  public void addText(String newText){
    this.contents = contents + " " + newText;  
  }
  
  public void move(int newX, int newY){
    this.coordinates = new Pair<Integer,Integer>(newX, newY);
    this.toggle();
    this.writeText();
  }
  
  public void writeText(){
    if(this.show == true)
    text(contents, this.coordinates.getElement0(), this.coordinates.getElement1());
    else{
      fill(204);
      text(contents, this.coordinates.getElement0(), this.coordinates.getElement1());
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