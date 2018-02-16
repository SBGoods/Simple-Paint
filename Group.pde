public class Group{
  ArrayList<Shape> members;
  PShape group;
  
  public Group(Shape first){
    this.members = new ArrayList<Shape>();
    this.members.add(first);
    this.group = createShape(GROUP);
  }
  
  public void addToGroup(Shape newMember){
    this.members.add(newMember);
    this.group.addChild(newMember.getPShape());
  }
  
  public ArrayList<Shape> getMembers(){
    return this.members;  
  }
  
  public ArrayList<Shape> dissolveGroup(ArrayList<Shape> list){
    ArrayList<Shape> newList = list;
    for(Shape x: members){
        newList.add(x);
    }
    return newList;
  }
  
  public void drawGroup(){
    for(Shape x: members){
      shape(x.getPShape(), 50, 50);
    }
  }
  
}