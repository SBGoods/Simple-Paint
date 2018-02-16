public class Shape{
     
    PShape shape;
    Pair beginCoordinates;
    Pair endCoordinates;
    ArrayList<Integer> colors;
    int radius;
    int swidth;
    int sheight;
  
    public Shape(ArrayList<Integer> colors, int size, Pair coordinates){
       //circle
       this.colors = colors;
       this.beginCoordinates = coordinates;
       this.radius = size;
       shape = createShape(ELLIPSE, (int) coordinates.getElement0(), (int) coordinates.getElement1(), size, size);
       shape.setFill(color(this.colors.get(0), this.colors.get(1), this.colors.get(2)));
       list.add(shape);
      
      
    }
    
    public Shape(ArrayList<Integer> colors, int wide, int high, Pair coordinates){
       //square + rectangle
       this.colors = colors;
       this.beginCoordinates = coordinates;
       this.swidth = wide;
       this.sheight = high;
       shape = createShape(RECT, (int) coordinates.getElement0(), (int) coordinates.getElement1(), wide, high);
       shape.setFill(color(this.colors.get(0), this.colors.get(1), this.colors.get(2)));
       list.add(shape);
    
    }
    
    public Shape(ArrayList<Integer> colors, Pair start, Pair end){
      //line
      this.colors = colors;
      this.beginCoordinates = start;
      this.endCoordinates = end;
      shape = createShape(LINE, (int) start.getElement0(), (int) start.getElement1(), (int) end.getElement0(), (int) end.getElement1());
      shape.setFill(color(this.colors.get(0), this.colors.get(1), this.colors.get(2)));
      list.add(shape);
    }
    
    public Shape(ArrayList<Integer> colors, ArrayList<Pair> points){
      //polygon
      this.colors = colors;
      shape.beginShape();
      for(Pair x: points){
        shape.vertex((float)x.getElement0(), (float)x.getElement1());
      }
      shape.fill(color(this.colors.get(0), this.colors.get(1), this.colors.get(2)));
      shape.endShape();
    
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

    public PShape getPShape(){
      return this.shape;
    }


}