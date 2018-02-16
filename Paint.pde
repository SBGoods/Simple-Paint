import controlP5.*;
import java.util.*;

Grid guide = new Grid(10);
int zoom = 100;
ArrayList<Shape> list = new ArrayList<Shape>();
Shape current;


void setup(){
size(1000,1000);
surface.setResizable(true);
ArrayList<Integer> colors = new ArrayList<Integer>();
colors.add(255);
colors.add(0);
colors.add(0);
Pair<Integer,Integer> coor = new Pair<Integer,Integer>(50, 50);
Pair<Integer,Integer> coor2 = new Pair<Integer,Integer>(250, 250);
ArrayList<Integer> colors2 = new ArrayList<Integer>();
colors2.add(0);
colors2.add(0);
colors2.add(0);
Shape sample = new Shape(colors, 50, 50, coor);
Shape sample2 = new Shape(colors2, 25.0, 25.0, coor2);
list.add(sample);
list.add(sample2);


//poly
Pair<Integer,Integer> coor5b = new Pair<Integer, Integer>(550,500);
Pair<Integer,Integer> coor5c = new Pair<Integer, Integer>(600,600);
Pair<Integer, Integer> coor5d = new Pair<Integer, Integer>(450,450);
ArrayList<Integer> colors5 = new ArrayList<Integer>();
colors5.add(0);
colors5.add(0);
colors5.add(0);
ArrayList<Pair> points = new ArrayList();
points.add(coor5d);
points.add(coor5b);
points.add(coor5c);
Shape tri = new Shape(colors5, points);
list.add(tri);

}

void draw(){
  if(zoom != 100){
    guide.changeLines(zoom/10);
  }
  if(list.size() != 0){
      for(int i = 0; i < list.size(); i++){
        list.get(i).getPShape().scale(zoom/100);
        shape(list.get(i).getPShape(), 50, 50);
        //System.out.println(list.get(i).getCoordinates());
      } 
  }
  guide.drawGrid();
  //shape(square, 20, 20);
}

void mouseClicked() {
   System.out.println(mouseX + "  " + mouseY);
   for(int i = 0; i < list.size(); i++){
        if(mouseX > list.get(i).getCoordinates().get(0) + 50 && mouseX < list.get(i).getCoordinates().get(1) + 50 &&
          mouseY - 50 > list.get(i).getCoordinates().get(2) && mouseY - 50 < list.get(i).getCoordinates().get(3)){
            current = list.get(i);
            System.out.println("hello");
        }
   }
   
}