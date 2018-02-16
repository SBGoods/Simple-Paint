public class Text{
  String contents;
  
  
  public Text(String input){
    this.contents = input;
  }
  
  public void addText(String input){
    this.contents = this.contents + " " + input;
  }
  
  public String getContents(){
    return this.contents;  
  }
  
}