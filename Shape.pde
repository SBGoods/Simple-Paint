public class Shape{
     //new file
    PShape shape;
    Pair beginCoordinates;
    Pair endCoordinates;
    ArrayList<Integer> colors;
    int radius;
    int swidth;
    int sheight;
    ArrayList<Integer> coordinates = new ArrayList<Integer>();
    int x1, x2, y1, y2;
  
    public Shape(float widths, float heights, Pair coordinates){
       //circle
       this.beginCoordinates = coordinates;
       this.swidth = (int) widths;
       this.sheight = (int) heights;
       shape = createShape(ELLIPSE, (int) coordinates.getElement0(), (int) coordinates.getElement1(), this.swidth, this.sheight);
       //shape.setFill(color(this.colors.get(0), this.colors.get(1), this.colors.get(2)));
       list.add(this);
       x1 = (int) coordinates.getElement0() - swidth;
       y1 = (int) coordinates.getElement1() - sheight;
       x2 = (int) coordinates.getElement0() + swidth;
       y2 = (int) coordinates.getElement1() + sheight;
       this.coordinates.add(x1);
       this.coordinates.add(x2);
       this.coordinates.add(y1);
       this.coordinates.add(y2);
    }
    
    public Shape(int wide, int high, Pair coordinates){
       //square + rectangle
       this.beginCoordinates = coordinates;
       this.swidth = wide;
       this.sheight = high;
       shape = createShape(RECT, (int) coordinates.getElement0(), (int) coordinates.getElement1(), wide, high);
       //shape.setFill(color(this.colors.get(0), this.colors.get(1), this.colors.get(2)));
       list.add(this);
       x1 = (int) coordinates.getElement0();
       y1 = (int) coordinates.getElement1();
       x2 = (int) coordinates.getElement0() + wide;
       y2 = (int) coordinates.getElement1() + high;
       this.coordinates.add(x1);
       this.coordinates.add(x2);
       this.coordinates.add(y1);
       this.coordinates.add(y2);
    }
    
    public Shape(Pair start, Pair end){
      //line
      this.beginCoordinates = start;
      this.endCoordinates = end;
      shape = createShape(LINE, (int) start.getElement0(), (int) start.getElement1(), (int) end.getElement0(), (int) end.getElement1());
      //shape.setFill(color(this.colors.get(0), this.colors.get(1), this.colors.get(2)));
      list.add(this);
      int midX = (((int) start.getElement0() + (int) end.getElement0())/2);
      int midY = (((int) start.getElement1() + (int) end.getElement1())/2);
      x1 = midX + 10;
      x2 = midX - 10;
      y1 = midY + 10;
      y2 = midY - 10;
      this.coordinates.add(x2);
      this.coordinates.add(x1);
      this.coordinates.add(y2);
      this.coordinates.add(y1);
    }
    
    public Shape(ArrayList<Pair> points){
      //polygon
      int minX = 100000;
      int maxX = 0; 
      int minY = 100000;
      int maxY = 0; 
      this.shape = createShape();
      this.shape.beginShape();
      for(Pair x: points){
        this.shape.vertex((int)x.getElement0(), (int)x.getElement1());
        println("points");
        if((int)x.getElement0() > maxX){
          maxX = (int)x.getElement0();
        }
        if((int)x.getElement0() < minX){
          minX = (int)x.getElement0();
        }
        if((int)x.getElement0() > maxY){
          maxY = (int)x.getElement1();
        }
        if((int)x.getElement0() < minY){
          minY = (int)x.getElement1();
        }
      }
      this.shape.endShape(CLOSE);
      //shape.fill(color(this.colors.get(0), this.colors.get(1), this.colors.get(2)));
      list.add(this);
      
      this.coordinates.add(minX);
      this.coordinates.add(maxX);
      this.coordinates.add(minY);
      this.coordinates.add(maxY);
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
    
    public ArrayList<Integer> getCoordinates(){
      return this.coordinates;
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