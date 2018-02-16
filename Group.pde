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
  
  public void dissolveGroup(){
      
  }
  
}