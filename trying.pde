import controlP5.*;
import java.util.*;

Grid guide = new Grid(10);
int zoom = 200;
LinkedList<PShape> list = new LinkedList<PShape>();

PShape square;

void setup(){
  size(600, 600);
}


void draw(){
  square = createShape(RECT, 10, 10, 80, 80);
  list.add(square);
  if(zoom != 100){
    guide.changeLines(zoom/10);
    for(int i = 0; i < list.size(); i++){
      list.get(i).scale(zoom/100);
    }
  }
  guide.drawGrid();
  shape(square, 20, 20);
}