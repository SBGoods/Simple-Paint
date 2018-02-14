import controlP5.*;
import java.util.*;

Grid guide = new Grid(10);
int zoom = 200;
ArrayList<PShape> list = new ArrayList<PShape>();
PShape square;

void setup(){
size(1000,1000);
surface.setResizable(true);
}

void draw(){
 //square = createShape(RECT, 10, 10, 1000, 1000);
  //list.add(square);
  if(zoom != 100){
    guide.changeLines(zoom/10);
    if(list.size() != 0){
      for(int i = 0; i < list.size(); i++){
        list.get(i).scale(zoom/100);
        shape(list.get(1), 50, 50);
      }
    }
    
  }
  guide.drawGrid();
  //shape(square, 20, 20);
}