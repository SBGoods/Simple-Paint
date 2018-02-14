import java.util.ArrayList;

public class shapeFactory{
  
  public shapeFactory(){}
  
  public Shape factoryMethod(ArrayList<Integer> colors, int size, Pair coordinates){
    return new Shape(colors, size, coordinates);;
  }
  
  public Shape factoryMethod(ArrayList<Integer> colors, int wide, int high, Pair coordinates){
    return new Shape(colors, wide, high, coordinates);  
  }
  
  public Shape factoryMethod(ArrayList<Integer> colors, Pair start, Pair end){
    return new Shape(colors, start, end);
  }
  
  public Shape factoryMethod(ArrayList<Integer> colors, int sides, Pair coordinates, ArrayList<Pair> points){
    return new Shape(colors, sides, coordinates, points);
  }
  
  
}