import java.util.ArrayList;

public class shapeFactory{
  
  public shapeFactory(){}
  
  public protoShape factoryMethod(ArrayList<Integer> colors, int size, Pair coordinates){
    return new protoShape(colors, size, coordinates);;
  }
  
  public protoShape factoryMethod(ArrayList<Integer> colors, int wide, int high, Pair coordinates){
    return new protoShape(colors, wide, high, coordinates);  
  }
  
  public protoShape factoryMethod(ArrayList<Integer> colors, Pair start, Pair end){
    return new protoShape(colors, start, end);
  }
  
  public protoShape factoryMethod(ArrayList<Integer> colors, int sides, Pair coordinates, ArrayList<Pair> points){
    return new protoShape(colors, sides, coordinates, points);
  }
  
  
}