public abstract class Shape{
     
    PShape shape;
    Pair beginCoordinates;
    Pair endCoordinates;
    ArrayList<Integer> colors;
    int radius;
    int swidth;
    int sheight;
  
    public Shape(ArrayList<Integer> colors, int size, Pair coordinates){
       shape = createShape(TRIANGLE, 30, 75, 58, 20, 86, 75);
       list.add(shape);
      
      
    }
    public void Move(Pair Coordinates){
      this.beginCoordinates = Coordinates;
      shape(shape, (float) Coordinates.getElement0(), (float) Coordinates.getElement1());
    
    }
    
    public void Move(Pair beginCoordinates, Pair endCoordinates){
      this.beginCoordinates = beginCoordinates;
      this.endCoordinates = endCoordinates;
    }
    
    public Pair getBeginCoordinates(){
      return this.beginCoordinates;
    }
    
    public Pair getEndCoordinates(){
      return this.endCoordinates;
    }
    
    public void setColor(ArrayList<Integer> colors){
      this.colors = colors;
      shape.setFill(color(this.colors.get(0), this.colors.get(1), this.colors.get(2)));
    
    }
    
    public ArrayList<Integer> getColor(){
      return this.colors;
    }
    
    public void setSize(int size){
      this.radius = size;
    
    }
    
    public void setSize(int swidth, int sheight){
      this.swidth = swidth;
      this.sheight = sheight;
    
    }
    
    public int getSize(){
    
      return 0;
    }

  


}