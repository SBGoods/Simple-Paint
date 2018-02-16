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
Pair<Integer,Integer> coor3 = new Pair<Integer,Integer>(20, 75);
ArrayList<Integer> colors3 = new ArrayList<Integer>();
colors3.add(10);
colors3.add(100);
colors3.add(200);
colors2.add(0);
colors2.add(0);
colors2.add(0);
Shape sample2 = new Shape(colors2, 5, 5, coor);
Shape sample3 = new Shape(colors3, 20, coor3);
//list.add(sample.getPShape());
list.add(sample2.getPShape());
list.add(sample3.getPShape());

//line test
Pair<Integer,Integer> coor4a = new Pair<Integer,Integer>(40,40);
Pair<Integer,Integer> coor4b = new Pair<Integer,Integer>(70,40);
ArrayList<Integer> colors4 = new ArrayList();
colors4.add(0);
colors4.add(0);
colors4.add(0);
Shape line = new Shape(colors4, coor4a, coor4b);
list.add(line.getPShape());


}

void draw(){
 //square = createShape(RECT, 10, 10, 1000, 1000);
  //list.add(square);
  if(zoom != 100){
    guide.changeLines(zoom/10);
  }
    if(list.size() != 0){
      for(int i = 0; i < list.size(); i++){
        list.get(i).scale(zoom/100);
        shape(list.get(i), 50, 50);
      }
    }
    
  
  guide.drawGrid();
  //shape(square, 20, 20);
}