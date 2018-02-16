import controlP5.*;
import java.util.*;

Grid guide = new Grid(10);
int zoom = 200;
ArrayList<PShape> list = new ArrayList<PShape>();
PShape square;

void setup(){
size(1000,1000);
surface.setResizable(true);
ArrayList<Integer> colors = new ArrayList<Integer>();
colors.add(255);
colors.add(0);
colors.add(0);
Pair<Integer,Integer> coor = new Pair<Integer,Integer>(50, 50);
ArrayList<Integer> colors2 = new ArrayList<Integer>();
colors2.add(0);
colors2.add(0);
colors2.add(0);
Shape sample = new Shape(colors, 25, 25, coor);
Shape sample2 = new Shape(colors2, 25, 25, coor);
//list.add(sample.getPShape());
list.add(sample2.getPShape());

}

void draw(){
 //square = createShape(RECT, 10, 10, 1000, 1000);
  //list.add(square);
  if(zoom != 100){
    guide.changeLines(zoom/10);
    if(list.size() != 0){
      for(int i = 0; i < list.size(); i++){
        list.get(i).scale(zoom/100);
        shape(list.get(i), 50, 50);
      }
    }
    
  }
  guide.drawGrid();
  //shape(square, 20, 20);
}