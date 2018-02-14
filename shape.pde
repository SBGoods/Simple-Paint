public class Shape{
  
    String shapeType;
    Pair coordinates;
    Pair start;
    Pair end;
    ArrayList<Pair> points;
    ArrayList<Integer> colors; 
    int sides;
    int size;
    int wide;
    int high;
    //constructor is overloaded to handle creation of all three object types 
    //the first is for squares and circles
  
    public Shape(ArrayList<Integer> colors, int size, Pair coordinates){
      this.colors = colors;  
      this.size = size;
      this.coordinates = coordinates;
      this.shapeType = "shape";
    }
    
    //this one is for rectangles
    
    public Shape(ArrayList<Integer> colors, int wide, int high, Pair coordinates){
      this.colors = colors;
      this.wide = wide;
      this.high = high;
      this.coordinates = coordinates;
      this.shapeType = "rectangle";
    }
    
    //this next constructor is for lines
    
    public Shape(ArrayList<Integer> colors, Pair start, Pair end){
      this.colors = colors;
      this.start = start;  
      this.end = end;
      this.shapeType = "line";
    }
    
    //this concstructor is for polygons
    
    public Shape(ArrayList<Integer> colors, int size, Pair coordinates, ArrayList<Pair> points){
      this.colors = colors;  
      this.size = size;
      this.coordinates = coordinates;
      this.points = points;
      this.shapeType = "polygon";
    }
    
    public void MoveShape(Pair Coordinates){
      this.coordinates = Coordinates; 
    }
    
    public void moveLine(Pair start, Pair end){
      this.start = start;
      this.end = end;
    }
    
    public void movePoly(Pair coordinates, ArrayList<Pair> points){
      this.coordinates = coordinates;
      this.points = points;
    }
    
    public Pair getCoordinates(){
      return this.coordinates;
    }
    
    public void setColor(ArrayList<Integer> colors){
      this.colors = colors;
    }
    
    public ArrayList<Integer> getColor(){
      return this.colors;
    }
    
    public void setSize(int size){
      this.size = size;
    }
    
    public int getSize(){
      return this.size;
    }
    
    public void setSizeRect(int wide, int high){
      this.wide = wide;
      this.high = high;
    }
    
    public int getSizeRect(){
      return this.wide*this.high;  
    }
}