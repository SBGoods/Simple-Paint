import controlP5.*;
import java.util.*;

Grid guide = new Grid(10);
int zoom = 100;
ArrayList<PShape> list = new ArrayList<PShape>();
ArrayList<Text> textList = new ArrayList<Text>();
PShape square;
int xy = 0;

void setup(){
size(1000,1000);
surface.setResizable(true);
ArrayList<Integer> colors = new ArrayList<Integer>();
colors.add(255);
colors.add(0);
colors.add(0);
Pair<Integer,Integer> coor = new Pair<Integer,Integer>(50, 50);
ArrayList<Integer> colors2 = new ArrayList<Integer>();
Pair<Integer,Integer> coor3 = new Pair<Integer,Integer>(200, 500);
ArrayList<Integer> colors3 = new ArrayList<Integer>();
colors3.add(10);
colors3.add(100);  
colors3.add(200);
colors2.add(0);
colors2.add(255);
colors2.add(255);
Shape sample2 = new Shape(colors2, 50, 50, coor);
Shape sample3 = new Shape(colors3, 200, coor3);
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

//poly test
//Pair<Integer,Integer> coor5a = new Pair<Integer, Integer>(500,500);
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
list.add(tri.getPShape());

Text testWrite = new Text("Testing Testing", 350, 150);
textList.add(testWrite);
} //<>//

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
    
  fill(0,0,0);
  if(textList.size() != 0){
    for(int x = 0; x < textList.size(); x++){
       textList.get(x).writeText();
       if(xy == 10){
           textList.get(x).toggle();
       }
    }
   xy++;
  }
  //guide.drawGrid();
  //shape(square, 20, 20);
}