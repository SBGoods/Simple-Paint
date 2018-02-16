public class reDrawer{
  
  public reDrawer(){}
  
  public void reDraw(ArrayList<PShape> shapeList, ArrayList<Text> textList, ArrayList<Group> groupList){
    background(204);
    if(shapeList.size() != 0){
      for(PShape x: shapeList){
        shape(x, 50, 50);
      }
    }
    
    if(textList.size() != 0){
      for(Text x: textList){
        x.writeText();  
      }
    }
      
    if(groupList.size() != 0){
      for(Group x: groupList){
        //x.drawGroup();  
      }
    }
  }
  
}
    
  
  