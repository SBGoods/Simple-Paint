import controlP5.*;

import processing.svg.*;


PShape fbLogo;
PShape legoMan;
PShape load;
PGraphics pgDrawing;

Canvas canvas;
ControlP5 cp5;
PImage rect;
PImage straight;
PImage curvy;
PImage elipse;
PImage poly;
PImage text;
PImage blueprint;
PImage select;
PImage move;
PImage group;
PImage ungroup;
PImage resize;
PImage rotate;
PImage copy;
PImage paste;
PImage delete;

boolean recording = true;
boolean toggled;

Grid guide = new Grid(10);
int zoom = 100;
ArrayList<Shape> list = new ArrayList<Shape>();
ArrayList<Text> textlist = new ArrayList<Text>();
Shape current;

class Paper extends Canvas {
  
   public void draw (PGraphics pg) {
     fill(60);
     if (recording) {
       beginRecord(SVG, "output.svg"); 
     }
    
     //shape(fbLogo,110,90,100,100);
     //shape(legoMan,200,40);
     
     if (recording) {
       endRecord();
       recording = false;
     }
   }
}

void mouseDragged () {
 if (mouseY > 170 && !toggled) {
   fill(0,0,0);
   rect(mouseX, mouseY, 10, 10); 
 }
}

void setup() {
  background(255);
  cp5 = new ControlP5(this);
  size(1000, 600);
  //canvas
  canvas = new Paper();
  canvas.pre();
  cp5.addCanvas(canvas);
  
  //svg files
  //fbLogo = loadShape("fb-art.svg");
  //legoMan = loadShape("legoMan.svg");
  
  //load button images
  rect = loadImage("rectangle.png");
  straight = loadImage("Straight.png");
  curvy = loadImage("curvy.png");
  elipse = loadImage("elipse.png");
  poly = loadImage("poly.png");
  text = loadImage("text3.png");
  blueprint = loadImage("blueprint1.png");
  select = loadImage("select1.png");
  move = loadImage("move.png");
  group = loadImage("group.png");
  ungroup = loadImage("ungroup.png");
  resize = loadImage("resize.png");
  rotate = loadImage("rotateright.png");
  copy = loadImage("copy.png");
  paste = loadImage("paste.png");
  delete = loadImage("delete.png");
  
  //First toolbar starts here
  ButtonBar b1 = cp5.addButtonBar("file")
    .setPosition(0,0)
    .setSize(1000,20)
    .addItems(split("Open Save Load Import Export Print", " "));
    
    //Highlight buttons when hover or click
    b1.onPress(new CallbackListener(){
    public void controlEvent(CallbackEvent ev) {
      ButtonBar file = (ButtonBar)ev.getController();
      
      switch (file.hover()){
       case 1:
         recording = true;
         println ("Sketch saved as .svg"); 
       
       case 2:
         
      }
    
     }
  });
  //Second toolbar starts here
  Group g2 = cp5.addGroup("    ")
                .setPosition(0,30)
                .setWidth(1000)
                .setBackgroundHeight(40)
                .setBackgroundColor(color(224,224,224))
                .activateEvent(true)
                ;
                
  cp5.addButton("straight")
     .setValue(128)
     .setPosition(0,0)
     .setImage(straight)
     .updateSize()
     .setGroup(g2)
     ; 
     
  cp5.addButton("curvy")
     .setValue(128)
     .setPosition(42,0)
     .setImage(curvy)
     .updateSize()
     .setGroup(g2)
     ;  
  cp5.addButton("rectangle")
     .setValue(128)
     .setPosition(84,0)
     .setImage(rect)
     .updateSize()
     .setGroup(g2)
     ;  
     
  cp5.addButton("elipse")
     .setValue(128)
     .setPosition(126,0)
     .setImage(elipse)
     .updateSize()
     .setGroup(g2)
     ; 
     
  cp5.addButton("polygon")
     .setValue(128)
     .setPosition(168,0)
     .setImage(poly)
     .updateSize()
     .setGroup(g2)
     ;
 cp5.addButton("text1")
   .setValue(128)
   .setPosition(850,0)
   .setImage(text)
   .updateSize()
   .setGroup(g2)
   ;
   
 /*
 cp5.addButton("blueprint")
   .setValue(128)
   .setPosition(252,0)
   .setImage(blueprint)
   .updateSize()
   .setGroup(g2)
   ;
   */
   
   cp5.addToggle("blueprint")
     .setPosition(252,0)
     .setImage(blueprint)
     .updateSize()
     .setValue(false)
     //.setMode(ControlP5.SWITCH)
     .setGroup(g2)
     .setCaptionLabel(" ")
     ;
 /*
 cp5.addToggle("select1")
     .setPosition(252,0)
     .setImage(blueprint)
     .updateSize()
     .setValue(false)
     //.setMode(ControlP5.SWITCH)
     .setGroup(g2)
     .setCaptionLabel(" ")
     ;
     */
 cp5.addButton("select1")
   .setValue(128)
   .setPosition(340,0)
   .setImage(select)
   .updateSize()
   .setGroup(g2)
   ;
  
 cp5.addButton("move1")
   .setValue(128)
   .setPosition(382,0)
   .setImage(move)
   .updateSize()
   .setGroup(g2)
   ;
   
  cp5.addButton("group")
   .setValue(128)
   .setPosition(424,0)
   .setImage(group)
   .updateSize()
   .setGroup(g2)
   ;
   
   cp5.addButton("ungroup")
   .setValue(128)
   .setPosition(466,0)
   .setImage(ungroup)
   .updateSize()
   .setGroup(g2)
   ;
   
   cp5.addButton("resize1")
   .setValue(128)
   .setPosition(508,0)
   .setImage(resize)
   .updateSize()
   .setGroup(g2)
   ;
   
   cp5.addButton("rotate1")
   .setValue(128)
   .setPosition(550,0)
   .setImage(rotate)
   .updateSize()
   .setGroup(g2)
   ;
   
  cp5.addButton("copy1")
   .setValue(128)
   .setPosition(592,0)
   .setImage(copy)
   .updateSize()
   .setGroup(g2)
   ;
   
   cp5.addButton("paste")
   .setValue(128)
   .setPosition(634,0)
   .setImage(paste)
   .updateSize()
   .setGroup(g2)
   ;
   
   cp5.addButton("delete")
   .setValue(128)
   .setPosition(676,0)
   .setImage(delete)
   .updateSize()
   .setGroup(g2)
   ;
   
   cp5.addButton("red1")
     .setPosition(750,0)
     .setSize(20,20)
     .setColorBackground(color(255,0,0))
     .setCaptionLabel(" ")
     .setGroup(g2)
     ;
     
     cp5.addButton("orange")
     .setPosition(770,0)
     .setSize(20,20)
     .setColorBackground(color(255,128,0))
     .setCaptionLabel(" ")
     .setGroup(g2)
     ;
     
     cp5.addButton("yellow")
     .setPosition(790,0)
     .setSize(20,20)
     .setColorBackground(color(255,255,0))
     .setCaptionLabel(" ")
     .setGroup(g2)
     ;
     
     cp5.addButton("green1")
     .setPosition(810,0)
     .setSize(20,20)
     .setColorBackground(color(0,255,0))
     .setCaptionLabel(" ")
     .setGroup(g2)
     ;
     
     cp5.addButton("blue1")
     .setPosition(750,20)
     .setSize(20,20)
     .setColorBackground(color(0,0,255))
     .setCaptionLabel(" ")
     .setGroup(g2)
     ;
     
     cp5.addButton("violet")
     .setPosition(770,20)
     .setSize(20,20)
     .setColorBackground(color(127,0,255))
     .setCaptionLabel(" ")
     .setGroup(g2)
     ;
     
     cp5.addButton("white")
     .setPosition(790,20)
     .setSize(20,20)
     .setColorBackground(color(255,255,255))
     .setCaptionLabel(" ")
     .setGroup(g2)
     ;
     
     cp5.addButton("black")
     .setPosition(810,20)
     .setSize(20,20)
     .setColorBackground(color(0,0,0))
     .setCaptionLabel(" ")
     .setGroup(g2)
     ;
   
   cp5.addToggle("toggle")
     .setPosition(900,10)
     .setSize(50,20)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     .setGroup(g2)
     .setCaptionLabel(" ")
     ;
     
     

  
  /*ButtonBar b2 = cp5.addButtonBar("shapeEdit")
    .setPosition(0,20)
    .setSize(1000,32)
    .addItems(split("1 2 3 4 5 6 7 8 9 10 11 12 13 14 16 17 18 19"," "));
    b2.changeItem("1","view", new CDrawable() {
        public void draw(PGraphics theGraphics) {
          image(photo,0,0);
        }
      });
  */
  //Third toolbar
  Group g3 = cp5.addGroup("")
                .setPosition(0,80)
                .setWidth(1000)
                .setBackgroundHeight(60)
                .setBackgroundColor(color(224,224,224))
                .activateEvent(false)
                ;
                
  PFont font = createFont("Serif SansSerif", 15);
  cp5.addTextfield("Size")
     .setPosition(20,10)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g3)
     ;
    
    cp5.addTextfield("Degrees")
     .setPosition(100,10)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g3)
     ;
    
    cp5.addTextfield("Width")
     .setPosition(180,10)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g3)
     ;
  
  cp5.addTextfield("Height")
     .setPosition(260,10)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g3)
     ;
    
  cp5.addTextfield("NumOfSides")
     .setPosition(320,10)
     .setSize(50,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     //.setColorBackground(color(255,255,255))
     //.setColorValue(color(0,0,0))
     .setGroup(g3)
     ;
     
     cp5.addTextfield("textbox")
     .setPosition(430,10)
     .setSize(200,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     //.setColorBackground(color(255,255,255))
     //.setColorValue(color(0,0,0))
     .setGroup(g3)
     ;
   
   
   Group g4 = cp5.addGroup("X and Y Coordinates")
                .setPosition(0,150)
                .setWidth(1000)
                .setBackgroundHeight(52)
                .setBackgroundColor(color(224,224,224))
                .activateEvent(false)
                ;
     
     
  
    cp5.addTextfield("x1")
     .setPosition(20,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("y1")
     .setPosition(50,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("x2")
     .setPosition(90,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("y2")
     .setPosition(120,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     
     cp5.addTextfield("x3")
     .setPosition(160,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("y3")
     .setPosition(190,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     
     cp5.addTextfield("x4")
     .setPosition(230,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("y4")
     .setPosition(260,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("x5")
     .setPosition(300,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("y5")
     .setPosition(330,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("x6")
     .setPosition(370,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("y6")
     .setPosition(400,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("x7")
     .setPosition(440,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("y7")
     .setPosition(470,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("x8")
     .setPosition(510,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("y8")
     .setPosition(540,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("x9")
     .setPosition(580,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("y9")
     .setPosition(610,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("x10")
     .setPosition(650,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
     cp5.addTextfield("y10")
     .setPosition(680,5)
     .setSize(25,25)
     .setFocus(false)
     .setFont(font)
     .setValue(0)
     .setColorCaptionLabel(color(0))
     .setColorBackground(color(255,255,255))
     .setColorValue(color(0,0,0))
     .setGroup(g4)
     ;
     
  
     
}

void draw() {
  //b////ackground(200);
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
  
  if(textlist.size() != 0){
      for(int i = 0; i < textlist.size(); i++){
          Text test = textlist.get(i);
          test.writeText();
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
//turn text on and off
void toggle(boolean theFlag) {
    if(theFlag==true) {
    } else {
    }
}

public void straight(int value) {
   int x1, x2, y1, y2;
   x1 = Integer.valueOf(cp5.get(Textfield.class, "x1").getText());
   x2 = Integer.valueOf(cp5.get(Textfield.class, "x2").getText());
   y1 = Integer.valueOf(cp5.get(Textfield.class, "y1").getText());
   y2 = Integer.valueOf(cp5.get(Textfield.class, "y2").getText());
   System.out.println(x1 + " " + y1 + " " + x2 + " " + y2);
   Pair<Integer, Integer> coor1 = new Pair<Integer, Integer>(x1, y1);
   Pair<Integer, Integer> coor2 = new Pair<Integer, Integer>(x2, y2);
   Shape shape1 = new Shape(coor1, coor2);
   
   
}
  //PShape shape = Create(LINE, 


public void curvy(int value) {
  //try again later
}
float heightv;
float controlEvent(ControlEvent event) {
  if (event.controller().getName() == "Height") {
    heightv = event.controller().getValue();
  
  }
  return heightv;
}

public void rectangle(int value) {
  int x1, x2, y1, y2;
  int up = 0;
  int down = 0;
   x1 = Integer.valueOf(cp5.get(Textfield.class, "x1").getText());
   y1 = Integer.valueOf(cp5.get(Textfield.class, "y1").getText());
   up = Integer.valueOf(cp5.get(Textfield.class, "Height").getText());
   down = Integer.valueOf(cp5.get(Textfield.class, "Width").getText());
   
   //System.out.println(x1 + " " + y1 + " " + x2 + " " + y2);
   
   Pair<Integer, Integer> coor1 = new Pair<Integer, Integer>(x1, y1);
   
   Shape live = new Shape(up, down, coor1);
   //Shape shape1 = new Shape(coor1, this.Width(), (float) this.controlEvent(ControlEvent event);
}

public void polygon(int value) {
 
  int x1, x2, y1, y2;
  int sides = 0;
  ArrayList<Pair> hug = new ArrayList<Pair>();
   sides = Integer.valueOf(cp5.get(Textfield.class, "NumOfSides").getText());
   String news = "x" + 1;
   for(int i = 0; i < sides; i ++){
     println(i);
     String val1 = "x" + (i + 1);
     String val2 = "y" + (i + 1);
     x1 = Integer.valueOf(cp5.get(Textfield.class, val1).getText());
     y1 = Integer.valueOf(cp5.get(Textfield.class, val2).getText());
     println(x1 + " " + y1);
     Pair<Integer, Integer> coor1 = new Pair<Integer, Integer>(x1, y1);
     hug.add(coor1);
   }
   
   //System.out.println(x1 + " " + y1 + " " + x2 + " " + y2);
   Shape shape1 = new Shape(hug);
}

public void elipse(int value) {
  int x1, x2, y1, y2;
  float up = 0;
  float down = 0;
   x1 = Integer.valueOf(cp5.get(Textfield.class, "x1").getText());
   y1 = Integer.valueOf(cp5.get(Textfield.class, "y1").getText());
   up = (float) Integer.valueOf(cp5.get(Textfield.class, "Height").getText());
   down = (float) Integer.valueOf(cp5.get(Textfield.class, "Width").getText());
   //System.out.println(x1 + " " + y1 + " " + x2 + " " + y2);
   
   Pair<Integer, Integer> coor1 = new Pair<Integer, Integer>(x1, y1);
   
   Shape live = new Shape(up, down, coor1);
}

public void text1(int value) {
  println("hi");
  int x1 = Integer.valueOf(cp5.get(Textfield.class, "x1").getText());
  int y1 = Integer.valueOf(cp5.get(Textfield.class, "y1").getText());
  println(cp5.get(Textfield.class, "textbox").getText());
  String textss = cp5.get(Textfield.class, "textbox").getText();
  println("coor " + x1 + " " + y1); 
  Text text1 = new Text(textss, x1, y1);
  text1.writeText();
}

void blueprint(boolean theFlag) {
    if(theFlag==false) {
      guide.changeGrid(false);
    } 
    else {
      guide.changeGrid(true);
    }
}
/*
public void blueprint(int value) {
  guide.changeGrid(true);
}*/
  
public void select1(int value) {
  int count = 2;
  println("select toggled");
} 
  
public void move1(int value) {
  println("button pressed");
}

public void group(int value) {
  println("button pressed");
}

public void ungroup(int value) {
  
}

public void resize1(int value) {
  
}

public void rotate1(int value) {
  
}

public void copy1(int value) {
  
}

public void paste(int value) {
  
}

public void delete(int value) {
  
}

public void red1(int value) {
  
}

public void yellow(int value) {
  
}

public void green1(int value) {
  
}

public void black(int value) {
  
}

public void white(int value) {
  
}

public void violet(int value) {
  
}

public void blue1(int value) {
  
}

public void orange(int value) {
  
}

public void Size(String strokeSize) {
  
}

public void Degrees(String degrees) {
  
}

public void x1(String x) {
  
}

public void x2(String x) {
  
}

public void x3(String x) {
  
}

public void x4(String x) {
  
}

public void x5(String x) {
  
}

public void x6(String x) {
  
}

public void x7(String x) {
  
}
public void x8(String x) {
  
}

public void x9(String x) {
  
}

public void x10(String x) {
  
}

public void y1(String y) {
  
}

public void y2(String y) {
  
}

public void y3(String y) {
  
}

public void y4(String y) {
  
}

public void y5(String y) {
  
}

public void y6(String y) {
  
}

public void y7(String y) {
  
}

public void y8(String y) {
  
}

public void y9(String y) {
  
}

public void y10(String y) {
  
}

public void Height(String x){


}

public void Width(String y){


}