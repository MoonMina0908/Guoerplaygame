import ddf.minim.*;
Minim minim;

AudioPlayer game_bg,welldone1,welldone2,welldone3,welldone4;
AudioSample all_button;
//level1
AudioPlayer L1_bg;
AudioSample rightcatch,wrongcatch;
//level2
AudioPlayer L2_bg,right_drag,clickWrong;
AudioSample nextTest;
//level3
AudioPlayer L3_bg,frozen;
AudioSample foundbug;
//level4
AudioPlayer L4_bg,thunder, wrong, correct;

PImage startbg, failbg, successbg;
PImage startgame, start, starthover, next, nexthover, again, againhover, backstart, backstarthover, staff, staffhover, back, backhover; 
PImage headerstart, headerfail, headersuccess;
PImage feces, clock;
//level1 img
PImage l1eyecatch, l1instruction, level1bg, l1lead,level1item;
PImage chargerC, driveC, mouseC, notebookC, noteC;
PImage brush, charger, drive, eraser, flower, highspeed, mouse, note, notebook, pen, shark, sock, spanner, sword;
//level2 img
PImage l2eyecatch, l2instruction, level2bg, l2lead,level2item;
PImage elseifImg, falseImg, fillImg, forImg, ifImg, PImageImg, printlnImg, trueImg;
//level3 img
PImage l3eyecatch1, l3eyecatch2, l3instruction, level3bg1, level3bg2, net, level3item, xlight;
PImage bug0, bug1, bug2, bug3, bug4, bug5;
//level4 img
PImage l4eyecatch, l4instruction, level4bg, followmouse;
PImage folder1, folder2, folder3, folder4;
PImage chu, code, frog1, frog2, teacher1, teacher2, teacher3, window1, window2,window3,window4, teacherWin;
PImage window[];

//State
final int GAME_START = 0, GAME_L1 = 1, GAME_L2 = 2, GAME_L3 = 3, GAME_L4 = 4, GAME_FAIL = 5, GAME_SUCCESS = 6, GAME_STAFF = 7;
int gameState =0;

int l1State = 0;
int l2State = 0;
int l2Exam;
int l3State = 0;
int l4State = 0;
int a=0;//level3
int b=0;//level3

//level1
float collectGap=95,dropthing=0;
float fecenum=0,fece1=100,fece2=100,fece3=100;
float collect1=100,collect2=100,collect3=100,collect4=100,collect5=100;
float dropx1,dropx2,dropx3,dropx4,dropx5,dropx6,dropx7,dropx8,dropx9,dropx10,dropx11,dropx12,dropx13,dropx14;
float dropy1,dropy2,dropy3,dropy4,dropy5,dropy6,dropy7,dropy8,dropy9,dropy10,dropy11,dropy12,dropy13,dropy14;
float dropspeed1,dropspeed2,dropspeed3,dropspeed4,dropspeed5,dropspeed6,dropspeed7,dropspeed8,dropspeed9,dropspeed10,dropspeed11,dropspeed12,dropspeed13,dropspeed14;

//level2
PFont f ;
float code1X,code2X,code3X,code4X,code5X,code6X,code7X,code8X;
float code1Y=800,code2Y=750,code3Y=700,code4Y=650,code5Y=750,code6Y=650,code7Y=700,code8Y=800;
float codeSpeed1=-2,codeSpeed2=-3,codeSpeed3=-5;

//level3
int bugsX, bugsY;
int bugsH, bugsW = 50;
int netH, netW = 100;
boolean [] pressed={false,false,false,false,false,false};
int bugsCount = 0;

//level4
int windowArray[];
IntList numberwindow;
int teacherWinY;

//time
final int TIMER_L3 = 3600;
final int TIMER_L4 = 360;
final int TIMER_X=360;
int XTimer = TIMER_X;
int gameTimer = TIMER_L4;
PFont font;

//extra
PImage L1success,L2success,L3success,L4success;
PImage staffbg;

void setup(){
  size(960,640);
  
  gameTimer = TIMER_L4;
  minim = new Minim(this);
  
  game_bg = minim.loadFile("audio/game_bg.mp3",1024);
  welldone1 = minim.loadFile("audio/welldone1.mp3",512);
  welldone2 = minim.loadFile("audio/welldone2.mp3",512);
  welldone3 = minim.loadFile("audio/welldone3.mp3",512);
  welldone4 = minim.loadFile("audio/welldone4.mp3",512);
  all_button = minim.loadSample("audio/button.mp3",512);
  
  L1_bg = minim.loadFile("audio/level1/L1_bg.mp3",1024);
  rightcatch = minim.loadSample("audio/level1/rightcatch.mp3",512);
  wrongcatch = minim.loadSample("audio/level2/clickWrong.mp3",512);
  
  L2_bg = minim.loadFile("audio/level2/L2_bg.mp3",1024);
  clickWrong = minim.loadFile("audio/level2/clickWrong.mp3",512);
  nextTest = minim.loadSample("audio/level2/nextTest.mp3",512);
  right_drag = minim.loadFile("audio/level2/right_drag.mp3",512);
  
  L3_bg = minim.loadFile("audio/level3/L3_bg.mp3",1024);
  frozen = minim.loadFile("audio/level3/frozen.mp3",1024);
  foundbug = minim.loadSample("audio/level3/foundbug.mp3",512);
  
  L4_bg = minim.loadFile("audio/level4/bgMusic.mp3",1024);
  thunder = minim.loadFile("audio/level4/thunder.mp3",512);
  correct =minim.loadFile("audio/level4/correct.mp3",512);
  wrong = minim.loadFile("audio/level4/wrong.mp3",512);
  
  font = createFont("Arial", 45);
  textFont(font);
  f = createFont ( "Gen Jyuu Gothic Regular" , 54 ) ;
  
  startbg = loadImage("img/start success fail/bg/startbg.jpg");
  failbg = loadImage("img/start success fail/bg/failbg.jpg");
  successbg = loadImage("img/start success fail/bg/successbg.jpg");
  startgame = loadImage("img/start success fail/button/startgame.png");
  start= loadImage("img/start success fail/button/start.png");
  starthover= loadImage("img/start success fail/button/starthover.png");
  next = loadImage("img/start success fail/button/next.png");
  nexthover = loadImage("img/start success fail/button/nexthover.png");
  again = loadImage("img/start success fail/button/again.png");
  againhover = loadImage("img/start success fail/button/againhover.png");
  backstart = loadImage("img/start success fail/button/backstart.png");
  backstarthover = loadImage("img/start success fail/button/backstarthover.png");
  staff = loadImage("img/start success fail/button/staff.png");
  staffhover = loadImage("img/start success fail/button/staffhover.png");
  back = loadImage("img/start success fail/button/back.png");
  backhover = loadImage("img/start success fail/button/backhover.png");
  headerstart = loadImage("img/start success fail/header/headerstart.jpg");
  headerfail = loadImage("img/start success fail/header/headerfail.jpg");
  headersuccess = loadImage("img/start success fail/header/headersuccess.jpg");
  feces = loadImage("img/level1/collect/feces.png");
  clock = loadImage("img/level3/object/clock.png");
  xlight = loadImage("img/level3/object/xlight.png");
  
  level1item = loadImage("img/level1/level1item.jpg");
  level2item = loadImage("img/level2/level2item.png");
  level3item = loadImage("img/level3/level3item.jpg");
  
  l1eyecatch = loadImage("img/level1/eyecatch.jpg");
  l2eyecatch = loadImage("img/level2/eyecatch.jpg");
  l3eyecatch1 = loadImage("img/level3/eyecatch1.jpg");
  l3eyecatch2 = loadImage("img/level3/eyecatch2.jpg");
  l4eyecatch = loadImage("img/level4/eyecatch.jpg");
  
  l1instruction = loadImage("img/level1/instruction.jpg");
  l2instruction = loadImage("img/level2/instruction.jpg");
  l3instruction = loadImage("img/level3/instruction.jpg");
  l4instruction = loadImage("img/level4/instruction.jpg");
  
  level1bg = loadImage("img/level1/level1bg.jpg");
  level2bg = loadImage("img/level2/level2bg.jpg");
  level3bg1 = loadImage("img/level3/level3bg1.jpg");
  level3bg2 = loadImage("img/level3/level3bg2.jpg");
  level4bg = loadImage("img/level4/level4bg.jpg");
  
  l1lead = loadImage("img/level1/lead.png");
  l2lead = loadImage("img/level2/lead.png");
  
  chargerC = loadImage("img/level1/collect/chargerC.png");
  driveC = loadImage("img/level1/collect/driveC.png");
  mouseC = loadImage("img/level1/collect/mouseC.png");
  notebookC = loadImage("img/level1/collect/notebookC.png");
  noteC = loadImage("img/level1/collect/noteC.png");
  
  brush = loadImage("img/level1/drop/brush.png");
  charger = loadImage("img/level1/drop/charger.png");
  drive = loadImage("img/level1/drop/drive.png");
  eraser = loadImage("img/level1/drop/eraser.png");
  flower = loadImage("img/level1/drop/flower.png");
  highspeed = loadImage("img/level1/drop/highspeed.png");
  mouse = loadImage("img/level1/drop/mouse.png");
  note = loadImage("img/level1/drop/note.png");
  notebook = loadImage("img/level1/drop/notebook.png");
  pen = loadImage("img/level1/drop/pen.png");
  shark = loadImage("img/level1/drop/shark.png");
  sock = loadImage("img/level1/drop/sock.png");
  spanner = loadImage("img/level1/drop/spanner.png");
  sword = loadImage("img/level1/drop/sword.png");
  
  elseifImg = loadImage("img/level2/object/elseifImg.png");
  falseImg = loadImage("img/level2/object/falseImg.png");
  fillImg = loadImage("img/level2/object/fillImg.png");
  forImg = loadImage("img/level2/object/forImg.png");
  ifImg = loadImage("img/level2/object/ifImg.png");
  PImageImg = loadImage("img/level2/object/PImageImg.png");
  printlnImg = loadImage("img/level2/object/printlnImg.png");
  trueImg = loadImage("img/level2/object/trueImg.png");
  
  net = loadImage("img/level3/object/net.png");
  bug0 = loadImage("img/level3/object/bug0.png");
  bug1 = loadImage("img/level3/object/bug1.png");
  bug2 = loadImage("img/level3/object/bug2.png");
  bug3 = loadImage("img/level3/object/bug3.png");
  bug4 = loadImage("img/level3/object/bug4.png");
  bug5 = loadImage("img/level3/object/bug5.png");
  
  folder1 = loadImage("img/level4/folder/folder1.png");
  folder2 = loadImage("img/level4/folder/folder2.png");
  folder3 = loadImage("img/level4/folder/folder3.png");
  folder4 = loadImage("img/level4/folder/folder4.png");
  followmouse = loadImage("img/level4/mouse.png");
  
  chu = loadImage("img/level4/object/chu.png");
  code = loadImage("img/level4/object/code.png");
  frog1 = loadImage("img/level4/object/frog1.png");
  frog2 = loadImage("img/level4/object/frog2.png");
  teacher1 = loadImage("img/level4/object/teacher1.png");
  teacher2 = loadImage("img/level4/object/teacher2.png");
  teacher3 = loadImage("img/level4/object/teacher3.png");
  window = new PImage[4];
  window[0]= loadImage("img/level4/object/window1.png");
  window[1] = loadImage("img/level4/object/window2.png");
  window[2] = loadImage("img/level4/object/window3.png");
  window[3] = loadImage("img/level4/object/window4.png");
  teacherWin = loadImage("img/level4/object/success.png");
  
  //extra
  L1success = loadImage("img/start success fail/level1success.jpg");
  L2success = loadImage("img/start success fail/level2success.jpg");
  L3success = loadImage("img/start success fail/level3success.jpg");
  L4success = loadImage("img/start success fail/level4success.jpg");
  staffbg = loadImage("img/start success fail/staffbg.jpg");
  //level
  dropy1=0;
  
  //level4
  numberwindow = new IntList();
  numberwindow.append(0);
  numberwindow.append(1);
  numberwindow.append(2);
  numberwindow.append(3);
  numberwindow.shuffle();
  

}
void draw(){
  switch (gameState) {

    case GAME_START:
    welldone1.rewind();welldone2.rewind();welldone3.rewind();welldone4.rewind();
    if ( !game_bg.isPlaying() ){
    game_bg.play();
    game_bg.loop();}
    image(startbg,0,0,960,640);
    l1State=0;
    l2State=0;
    l3State=0;
    l4State=0;
    initL1();initL2();initL3();initL4();

    if(mouseX>=56 && mouseX<=56+startgame.width && mouseY>=204 && mouseY<=204+startgame.height){
      image(headerstart,56,240);
      if(mousePressed){gameState=1;all_button.trigger();mousePressed=false;}
    }else{image(startgame,56,240);}
    
    if(mouseX>=837 && mouseX<=837+staff.width && mouseY>=63 && mouseY<=63+staff.height){
      image(staffhover,837,63);
      if(mousePressed){gameState=GAME_STAFF;all_button.trigger();mousePressed=false;}
    }else{
      image(staff,837,63);
     }
    //init
    break;
    case GAME_STAFF:
      image(staffbg,0,0);
      if(mouseX>=15 && mouseX<=15+next.width && mouseY>=8 && mouseY<=8+next.height){
          image(backhover,15,8);
          if(mousePressed){gameState=GAME_START;all_button.trigger();mousePressed=false;}
      }else{image(back,15,8);}
    break;
    case GAME_L1:
    if(game_bg.isPlaying()){game_bg.pause();}
     if ( !L1_bg.isPlaying() ){
       
    L1_bg.play();
    L1_bg.loop();}
    switch (l1State) {
      case 0:
      initL1();
      image(l1eyecatch,0,0,960,640);
      if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
          image(nexthover,775,550);
          if(mousePressed){l1State=1;all_button.trigger();mousePressed=false;}
      }else{image(next,775,550);}
      break;
      case 1:
        image(l1instruction,0,0,960,640);
        if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
          image(starthover,775,550);
          if(mousePressed){l1State=2;all_button.trigger();mousePressed=false;}
          
        }else{image(start,775,550);}
      break;
      case 2:
        image(level1bg,0,0,960,640);
        //if(mouseX<960&&mouseX>0&&mouseY<640&&mouseY>0){noCursor();}else{cursor(HAND);}
        
        //drop1
        if(dropthing<=8){
          image(brush,dropx1,dropy1);
          dropy1 += dropspeed1;
          if(dropy1<10){dropx1=floor(random(0,880)); dropspeed1=floor(random(3,15));}
          if(dropy1>=640){dropy1=0;dropx1=floor(random(0,880)); dropspeed1=floor(random(3,10));}
          if(dropx1+5>=mouseX-l1lead.width/2 && dropx1+65<=mouseX && dropy1>455+120){
            dropy1=0;dropx1=floor(random(0,880)); dropspeed1=floor(random(3,10));
            fecenum+=1;
            wrongcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(charger,dropx2,dropy2);
          dropy2 += dropspeed2;
          if(dropy2<10){dropx2=floor(random(0,880)); dropspeed2=floor(random(3,15));}
          if(dropy2>=640){dropy2=0;dropx2=floor(random(0,880)); dropspeed2=floor(random(3,7));}
          if(dropx2+5>=mouseX-l1lead.width/2 && dropx2+65<=mouseX && dropy2>455+120){
            dropy2=0;dropx2=floor(random(0,880)); dropspeed2=floor(random(3,7));
            collect3=255;
            rightcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(drive,dropx3,dropy3);
          dropy3 += dropspeed3;
          if(dropy3<10){dropx3=floor(random(0,880)); dropspeed3=floor(random(2,6));}
          if(dropy3>=640){dropy3=0;dropx3=floor(random(0,880)); dropspeed3=floor(random(3,7));}
          if(dropx3+5>=mouseX-l1lead.width/2 && dropx3+65<=mouseX && dropy3>455+120){
            dropy3=0;dropx3=floor(random(0,880)); dropspeed3=floor(random(3,7));
            collect4=255;
            rightcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(eraser,dropx4,dropy4);
          dropy4 += dropspeed4;
          if(dropy4<10){dropx4=floor(random(0,880)); dropspeed4=floor(random(3,15));}
          if(dropy4>=640){dropy4=0;dropx4=floor(random(0,880)); dropspeed4=floor(random(3,15));}
          if(dropx4+5>=mouseX-l1lead.width/2 && dropx4+65<=mouseX && dropy4>455+120){
            dropy4=0;dropx4=floor(random(0,880)); dropspeed4=floor(random(3,15));
            fecenum+=1;
            wrongcatch.trigger();
          }
        }
         if(dropthing<=8){
          image(eraser,dropx4,dropy4);
          dropy4 += dropspeed4;
          if(dropy4<10){dropx4=floor(random(0,880)); dropspeed4=floor(random(3,7));}
          if(dropy4>=640){dropy4=0;dropx4=floor(random(0,880)); dropspeed4=floor(random(3,10));}
          if(dropx4+5>=mouseX-l1lead.width/2 && dropx4+65<=mouseX && dropy4>455+120){
            dropy4=0;dropx4=floor(random(0,880)); dropspeed4=floor(random(3,10));
            fecenum+=1;
            wrongcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(flower,dropx5,dropy5);
          dropy5 += dropspeed5;
          if(dropy5<10){dropx5=floor(random(0,880)); dropspeed5=floor(random(3,15));}
          if(dropy5>=640){dropy5=0;dropx5=floor(random(0,880)); dropspeed5=floor(random(3,10));}
          if(dropx5+5>=mouseX-l1lead.width/2 && dropx5+65<=mouseX && dropy5>455+120){
            dropy5=0;dropx5=floor(random(0,880)); dropspeed5=floor(random(3,10));
            fecenum+=1;
            wrongcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(highspeed,dropx6,dropy6);
          dropy6 += dropspeed6;
          if(dropy6<10){dropx6=floor(random(0,880)); dropspeed6=floor(random(8,10));}
          if(dropy6>=640){dropy6=0;dropx6=floor(random(0,880)); dropspeed6=floor(random(8,10));}
          if(dropx6+5>=mouseX-l1lead.width/2 && dropx6+65<=mouseX && dropy6>455+120){
            dropy6=0;dropx6=floor(random(0,880)); dropspeed6=floor(random(8,10));
            fecenum+=1;
            wrongcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(mouse,dropx7,dropy7);
          dropy7 += dropspeed7;
          if(dropy7<10){dropx7=floor(random(0,880)); dropspeed7=floor(random(3,10));}
          if(dropy7>=640){dropy7=0;dropx7=floor(random(0,880)); dropspeed7=floor(random(3,10));}
          if(dropx7+5>=mouseX-l1lead.width/2 && dropx7+65<=mouseX && dropy7>455+120){
            dropy7=0;dropx7=floor(random(0,880)); dropspeed7=floor(random(3,10));
            collect2=255;
            rightcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(note,dropx8,dropy8);
          dropy8 += dropspeed8;
          if(dropy8<10){dropx8=floor(random(0,880)); dropspeed8=floor(random(2,3));}
          if(dropy8>=640){dropy8=0;dropx8=floor(random(0,880)); dropspeed8=floor(random(2,3));}
          if(dropx8+5>=mouseX-l1lead.width/2 && dropx8+65<=mouseX && dropy8>455+120){
            dropy8=0;dropx8=floor(random(0,880)); dropspeed8=floor(random(2,3));
            collect5=255;
            rightcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(notebook,dropx9,dropy9);
          dropy9 += dropspeed9;
          if(dropy9<10){dropx9=floor(random(0,880)); dropspeed9=floor(random(3,15));}
          if(dropy9>=640){dropy9=0;dropx9=floor(random(0,880)); dropspeed9=floor(random(3,15));}
          if(dropx9+5>=mouseX-l1lead.width/2 && dropx9+65<=mouseX && dropy9>455+120){
            dropy9=0;dropx9=floor(random(0,880)); dropspeed9=floor(random(3,15));
            collect1=255;
            rightcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(pen,dropx10,dropy10);
          dropy10 += dropspeed10;
          if(dropy10<10){dropx10=floor(random(0,880)); dropspeed10=floor(random(3,15));}
          if(dropy10>=640){dropy10=0;dropx10=floor(random(0,880)); dropspeed10=floor(random(3,15));}
          if(dropx10+5>=mouseX-l1lead.width/2 && dropx10+65<=mouseX && dropy10>455+120){
            dropy10=0;dropx10=floor(random(0,880)); dropspeed10=floor(random(3,15));
            collect1=255;
            rightcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(shark,dropx11,dropy11);
          dropy11 += dropspeed11;
          if(dropy11<10){dropx11=floor(random(0,880)); dropspeed11=floor(random(3,15));}
          if(dropy11>=640){dropy11=0;dropx11=floor(random(0,880)); dropspeed11=floor(random(3,15));}
          if(dropx11+5>=mouseX-l1lead.width/2 && dropx11+65<=mouseX && dropy11>455+120){
            dropy11=0;dropx11=floor(random(0,880)); dropspeed11=floor(random(3,15));
            fecenum+=1;
            wrongcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(sock,dropx12,dropy12);
          dropy12 += dropspeed12;
          if(dropy12<10){dropx12=floor(random(0,880)); dropspeed12=floor(random(3,15));}
          if(dropy12>=640){dropy12=0;dropx12=floor(random(0,880)); dropspeed12=floor(random(3,15));}
          if(dropx12+5>=mouseX-l1lead.width/2 && dropx12+65<=mouseX && dropy12>455+120){
            dropy12=0;dropx12=floor(random(0,880)); dropspeed12=floor(random(3,15));
            fecenum+=1;
            wrongcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(spanner,dropx13,dropy13);
          dropy13 += dropspeed13;
          if(dropy13<10){dropx13=floor(random(0,880)); dropspeed13=floor(random(3,15));}
          if(dropy13>=640){dropy13=0;dropx13=floor(random(0,880)); dropspeed13=floor(random(3,15));}
          if(dropx13+5>=mouseX-l1lead.width/2 && dropx13+65<=mouseX && dropy13>455+120){
            dropy13=0;dropx13=floor(random(0,880)); dropspeed13=floor(random(3,15));
            fecenum+=1;
            wrongcatch.trigger();
          }
        }
        if(dropthing<=8){
          image(sword,dropx14,dropy14);
          dropy14 += dropspeed14;
          if(dropy14<10){dropx14=floor(random(0,880)); dropspeed14=floor(random(3,15));}
          if(dropy14>=640){dropy14=0;dropx14=floor(random(0,880)); dropspeed14=floor(random(3,15));}
          if(dropx14+5>=mouseX-l1lead.width/2 && dropx14+65<=mouseX && dropy14>455+120){
            dropy14=0;dropx14=floor(random(0,880)); dropspeed14=floor(random(3,15));
            fecenum+=1;
            wrongcatch.trigger();
          }
        }
        
        image(level1item,0,0);
        //feces
        if(fecenum==1){fece1=255;}
        else if(fecenum==2){fece1=255;fece2=255;}
        else if(fecenum==3){fece1=255;fece2=255;fece3=255;l1State=GAME_FAIL;}
        else{fece1=fece2=fece3=100;}
        tint(255,fece1);image(feces,27,10);
        tint(255,fece2);image(feces,27+collectGap,10);
        tint(255,fece3);image(feces,27+collectGap*2,10);
        
        //line
        strokeWeight(4);stroke(255);line(340,12,340,88);
        
        //timer
        
        
        //collect
        tint(255,collect1);image(notebookC,377,10);
        tint(255,collect2);image(mouseC,377+collectGap,10);
        tint(255,collect3);image(chargerC,377+collectGap*2,10);
        tint(255,collect4);image(driveC,377+collectGap*3,10);
        tint(255,collect5);image(noteC,377+collectGap*4,10);
        
        tint(255,255);
        image(l1lead,mouseX-l1lead.width/2,455);
        if(collect1==255&&collect2==255&&collect3==255&&collect4==255&&collect5==255){
          l1State=3;
        }
        break;
        case 3:
         welldone1.play();
        image(L1success,0,0,960,640);
        if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
          image(nexthover,775,550);
          if(mousePressed){gameState=GAME_L2;all_button.trigger();mousePressed=false;}
        }else{image(next,775,550);}
        break;
     case GAME_FAIL:
      image(failbg,0,0,960,640);
      image(headerfail,56,240);
      
      if(mouseX>=578 && mouseX<=578+again.width && mouseY>=500 && mouseY<=500+again.height){
        image(againhover,578,500);
        if(mousePressed){l1State=1;all_button.trigger();mousePressed=false;}
      }else{image(again,578,500);}
      if(mouseX>=578+160+20 && mouseX<=578+160+20+again.width && mouseY>=500 && mouseY<=500+again.height){
        image(backstarthover,578+160+20,500);
        if(mousePressed){gameState=GAME_START;all_button.trigger();mousePressed=false;initL1();}
      }else{image(backstart,578+160+20,500);}
      initL1();   
      break;
    }
    break;
    case GAME_L2:
    if(welldone1.isPlaying()){welldone1.pause();}
    if(L1_bg.isPlaying()){L1_bg.pause();}
    switch (l2State) {
      
      case 0:
      if ( !L2_bg.isPlaying() ){
         
      L2_bg.play();
      L2_bg.loop();}
      image(l2eyecatch,0,0,960,640);
      if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
          image(nexthover,775,550);
          if(mousePressed){l2State=1;all_button.trigger();mousePressed=false;}
      }else{image(next,775,550);}
      initL2();
      break;
      
      case 1:
        image(l2instruction,0,0,960,640);
        if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
          image(starthover,775,550);
          if(mousePressed){l2State=2;all_button.trigger();mousePressed=false;}
          
        }else{image(start,775,550);}
      break;
      
      case 2://Game_RUN
      image(level2bg,0,0,960,640);
      noStroke();
      fill(floor(random(200,255)),0,0);
      rect(480,100,960,640);      
      if(fecenum==3){
      l2State = GAME_FAIL;
      }
      
      //code1
      image(elseifImg,code1X,code1Y);
      
      if(code1Y>640){
        code1X=floor(random(480,840)); 
      }
      if(code1Y>0){
        code1Y+=codeSpeed3;
      }else{
        code1Y=700;}
      
      //code2
      image(falseImg,code2X,code2Y);
      if(code2Y>640){
        code2X=floor(random(480,840)); 
      }
      if(code2Y>0){
        code2Y+=codeSpeed1;
      }else{
        code2Y=700;}
        
      //code3
      image(fillImg,code3X,code3Y);
      if(code3Y>640){
        code3X=floor(random(480,840)); 
      }
      if(code3Y>0){
        code3Y+=codeSpeed1;
      }else{
        code3Y=700;}
        
      //code4
      image(forImg,code4X,code4Y);
      if(code4Y>640){
        code4X=floor(random(480,840)); 
      }
      if(code4Y>0){
        code4Y+=codeSpeed1;
      }else{
        code4Y=700;}
        
      //code5
      image(ifImg,code5X,code5Y);
      if(code5Y>640){
        code5X=floor(random(480,840)); 
      }
      if(code5Y>0){
        code5Y+=codeSpeed3;
      }else{
        code5Y=700;}
        
      //code6
      image(PImageImg,code6X,code6Y);
      if(code6Y>640){
        code6X=floor(random(480,840)); 
      }
      if(code6Y>0){
        code6Y+=codeSpeed1;
      }else{
        code6Y=700;}
        
      //code7
      image(printlnImg,code7X,code7Y);
      if(code7Y>640){
        code7X=floor(random(480,840)); 
      }
      if(code7Y>0){
        code7Y+=codeSpeed2;
      }else{
        code7Y=700;}
        
      //code8
      image(trueImg,code8X,code8Y);
      if(code8Y>640){
        code8X=floor(random(480,840)); 
      }
      if(code8Y>0){
        code8Y+=codeSpeed1;
      }else{
        code8Y=700;}
        
      image(level2item,0,0);
      image(l2lead,480,340);
      if(mousePressed==false){right_drag.rewind();}
        switch (l2Exam) {
          case 0://false
          rect(164,396,18,18);
          noFill();
          stroke(0);
          
          textFont ( f , 16 ) ; 
          fill ( 0 ) ;
          text("void keyReleased(){\n  if(key==CODED){\n    switch(keyCode){\n    case LEFT:\n    leftState = ?  ;\n    break;} \n   }\n }\n",75,295);
     
          if(mouseX>=code2X && mouseX<=code2X+120 && mouseY>=code2Y && mouseY<=code2Y+50){
            tint(100);image(falseImg,code2X,code2Y);tint(255);
          if(mousePressed){if(!right_drag.isPlaying()){right_drag.play();}code2X=mouseX-falseImg.width/2;code2Y=mouseY-falseImg.height/2;mousePressed=true;}
        }
          if(mouseX>=code1X && mouseX<=code1X+120 && mouseY>=code1Y && mouseY<=code1Y+50){
            tint(100);image(elseifImg,code1X,code1Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code3X && mouseX<=code3X+120 && mouseY>=code3Y && mouseY<=code3Y+50){
            tint(100);image(fillImg,code3X,code3Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code4X && mouseX<=code4X+120 && mouseY>=code4Y && mouseY<=code4Y+50){
            tint(100);image(forImg,code4X,code4Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code5X && mouseX<=code5X+120 && mouseY>=code5Y && mouseY<=code5Y+50){
            tint(100);image(ifImg,code5X,code5Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code6X && mouseX<=code6X+120 && mouseY>=code6Y && mouseY<=code6Y+50){
            tint(100);image(PImageImg,code6X,code6Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code7X && mouseX<=code7X+120 && mouseY>=code7Y && mouseY<=code7Y+50){
            tint(100);image(printlnImg,code7X,code7Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code8X && mouseX<=code8X+120 && mouseY>=code8Y && mouseY<=code8Y+50){
            tint(100);image(trueImg,code8X,code8Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        
        if(code2X<=350 && code2X>=0 && code2Y<=640 && code2Y>=100){
          code2X=-200;
          l2Exam = 1;
          nextTest.trigger();
        }
        
          break;
        
          case 1://fill
          rect(75,366,20,20);
          textFont ( f , 16 ) ; 
          fill ( 0 ) ;
          text("for(float x=0 ; x < mouseX ; x+=spacing){\n float hue = x/width *255; \n noStroke();\n  ? (hue,255,255);\n rect(x,0,spacing,height);\n }\n ",75,295);
          
          if(mouseX>=code3X && mouseX<=code3X+120 && mouseY>=code3Y && mouseY<=code3Y+50){
            tint(100);image(fillImg,code3X,code3Y);tint(255);
          if(mousePressed){if(!right_drag.isPlaying()){right_drag.play();}code3X=mouseX-falseImg.width/2;code3Y=mouseY-falseImg.height/2;mousePressed=true;}
        }
          if(mouseX>=code1X && mouseX<=code1X+120 && mouseY>=code1Y && mouseY<=code1Y+50){
            tint(100);image(elseifImg,code1X,code1Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code2X && mouseX<=code2X+120 && mouseY>=code2Y && mouseY<=code2Y+50){
            tint(100);image(falseImg,code2X,code2Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code4X && mouseX<=code4X+120 && mouseY>=code4Y && mouseY<=code4Y+50){
            tint(100);image(forImg,code4X,code4Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code5X && mouseX<=code5X+120 && mouseY>=code5Y && mouseY<=code5Y+50){
            tint(100);image(ifImg,code5X,code5Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code6X && mouseX<=code6X+120 && mouseY>=code6Y && mouseY<=code6Y+50){
            tint(100);image(PImageImg,code6X,code6Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code7X && mouseX<=code7X+120 && mouseY>=code7Y && mouseY<=code7Y+50){
            tint(100);image(printlnImg,code7X,code7Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code8X && mouseX<=code8X+120 && mouseY>=code8Y && mouseY<=code8Y+50){
            tint(100);image(trueImg,code8X,code8Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        
        if(code3X<=350 && code3X>=0 && code3Y<=640 && code3Y>=100){
          code3X=-200;
          l2Exam = 2;
          nextTest.trigger();
         }
          break;
          
          case 2://for
          rect(68,279,18,18);
          textFont ( f , 16 ) ; 
          fill ( 0 ) ;
          text("? (int i = 0; i < cabbageX.length; i++){\n cabbageX[i] = SOIL_SIZE * \n    floor(random(SOIL_COL_COUNT));\n cabbageY[i] = SOIL_SIZE * \n    ( i * 4 + floor(random(4)));\n  }\n",75,295);
          
          if(mouseX>=code4X && mouseX<=code4X+120 && mouseY>=code4Y && mouseY<=code4Y+50){
            tint(100);image(forImg,code4X,code4Y);tint(255);
          if(mousePressed){if(!right_drag.isPlaying()){right_drag.play();}code4X=mouseX-falseImg.width/2;code4Y=mouseY-falseImg.height/2;mousePressed=true;}
        }
          if(mouseX>=code1X && mouseX<=code1X+120 && mouseY>=code1Y && mouseY<=code1Y+50){
            tint(100);image(elseifImg,code1X,code1Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code2X && mouseX<=code2X+120 && mouseY>=code2Y && mouseY<=code2Y+50){
            tint(100);image(falseImg,code2X,code2Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code3X && mouseX<=code3X+120 && mouseY>=code3Y && mouseY<=code3Y+50){
            tint(100);image(fillImg,code3X,code3Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code5X && mouseX<=code5X+120 && mouseY>=code5Y && mouseY<=code5Y+50){
            tint(100);image(ifImg,code5X,code5Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code6X && mouseX<=code6X+120 && mouseY>=code6Y && mouseY<=code6Y+50){
            tint(100);image(PImageImg,code6X,code6Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code7X && mouseX<=code7X+120 && mouseY>=code7Y && mouseY<=code7Y+50){
            tint(100);image(printlnImg,code7X,code7Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code8X && mouseX<=code8X+120 && mouseY>=code8Y && mouseY<=code8Y+50){
            tint(100);image(trueImg,code8X,code8Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        
        if(code4X<=350 && code4X>=0 && code4Y<=640 && code4Y>=100){
          code4X=-200;
          l2Exam = 3;
          nextTest.trigger();
        }
          break;
          
          case 3://PImage
          rect(68,280,18,18); 
          rect(72,308,18,18);
          
          textFont ( f , 16 ) ; 
          fill ( 0 ) ;
          text("? bg;\n ? jupiter;\n void setup(){\n  size(800,200);\n bg = loadImage(cosmos.png);\n  jupiter=loadImage(jupiter.png);\n  }\n" ,75,295);
         
          if(mouseX>=code6X && mouseX<=code6X+120 && mouseY>=code6Y && mouseY<=code6Y+50){
            tint(100);image(PImageImg,code6X,code6Y);tint(255);
          if(mousePressed){if(!right_drag.isPlaying()){right_drag.play();}code6X=mouseX-falseImg.width/2;code6Y=mouseY-falseImg.height/2;mousePressed=true;}
        }
          if(mouseX>=code1X && mouseX<=code1X+120 && mouseY>=code1Y && mouseY<=code1Y+50){
            tint(100);image(elseifImg,code1X,code1Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code2X && mouseX<=code2X+120 && mouseY>=code2Y && mouseY<=code2Y+50){
            tint(100);image(falseImg,code2X,code2Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code3X && mouseX<=code3X+120 && mouseY>=code3Y && mouseY<=code3Y+50){
            tint(100);image(fillImg,code3X,code3Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code4X && mouseX<=code4X+120 && mouseY>=code4Y && mouseY<=code4Y+50){
            tint(100);image(forImg,code4X,code4Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code5X && mouseX<=code5X+120 && mouseY>=code5Y && mouseY<=code5Y+50){
            tint(100);image(ifImg,code5X,code5Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code7X && mouseX<=code7X+120 && mouseY>=code7Y && mouseY<=code7Y+50){
            tint(100);image(printlnImg,code7X,code7Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code8X && mouseX<=code8X+120 && mouseY>=code8Y && mouseY<=code8Y+50){
            tint(100);image(trueImg,code8X,code8Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        
        if(code6X<=350 && code6X>=0 && code6Y<=640 && code6Y>=100){
          code6X=-200;
          l2Exam = 4;
          nextTest.trigger();
        }
          break;
          
          case 4://println
          rect(150,280,18,18);
          
          textFont ( f , 16 ) ; 
          fill ( 0 ) ;
          text("if(life<=0){  ? (Game Over);\n }else { println(life:+life) ;}\n  ",75,295);
          
          if(mouseX>=code7X && mouseX<=code7X+120 && mouseY>=code7Y && mouseY<=code7Y+50){
            tint(100);image(printlnImg,code7X,code7Y);tint(255);
          if(mousePressed){if(!right_drag.isPlaying()){right_drag.play();}code7X=mouseX-falseImg.width/2;code7Y=mouseY-falseImg.height/2;mousePressed=true;}
        }
          if(mouseX>=code1X && mouseX<=code1X+120 && mouseY>=code1Y && mouseY<=code1Y+50){
            tint(100);image(elseifImg,code1X,code1Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code2X && mouseX<=code2X+120 && mouseY>=code2Y && mouseY<=code2Y+50){
            tint(100);image(falseImg,code2X,code2Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code3X && mouseX<=code3X+120 && mouseY>=code3Y && mouseY<=code3Y+50){
            tint(100);image(fillImg,code3X,code3Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
          if(mouseX>=code4X && mouseX<=code4X+120 && mouseY>=code4Y && mouseY<=code4Y+50){
            tint(100);image(forImg,code4X,code4Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code5X && mouseX<=code5X+120 && mouseY>=code5Y && mouseY<=code5Y+50){
            tint(100);image(ifImg,code5X,code5Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code6X && mouseX<=code6X+120 && mouseY>=code6Y && mouseY<=code6Y+50){
            tint(100);image(PImageImg,code6X,code6Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        if(mouseX>=code8X && mouseX<=code8X+120 && mouseY>=code8Y && mouseY<=code8Y+50){
            tint(100);image(trueImg,code8X,code8Y);tint(255);
          if(mousePressed){fecenum+=1;wrongcatch.trigger();mousePressed=false;}
        }
        
        if(code7X<=350 && code7X>=0 && code7Y<=640 && code7Y>=100){
          code7X=-200;
          l2State = 6;
          nextTest.trigger();
        }
          break;

       }//l2Exam
       //feces
       pushStyle();     
       if(fecenum==1){fece1=255;}
        else if(fecenum==2){fece1=255;fece2=255;}
        else if(fecenum==3){fece1=255;fece2=255;fece3=255;l1State=GAME_FAIL;}
        else{fece1=fece2=fece3=100;}
        tint(255,fece1);image(feces,27,10);
        tint(255,fece2);image(feces,27+collectGap,10);
        tint(255,fece3);image(feces,27+collectGap*2,10);
        popStyle();
        break; 
      case 6:
        
      image(L2success,0,0);
      welldone2.play();
      if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
          image(nexthover,775,550);
          if(mousePressed){gameState = GAME_L3;all_button.trigger();mousePressed=false;}
      }else{image(next,775,550);}
      break;
      case GAME_FAIL:
      image(failbg,0,0,960,640);
      image(headerfail,56,240);
      
      if(mouseX>=578 && mouseX<=578+again.width && mouseY>=500 && mouseY<=500+again.height){
        image(againhover,578,500);
        if(mousePressed){l2State=1;all_button.trigger();mousePressed=false;}
      }else{image(again,578,500);}
      if(mouseX>=578+160+20 && mouseX<=578+160+20+again.width && mouseY>=500 && mouseY<=500+again.height){
        image(backstarthover,578+160+20,500);
        if(mousePressed){gameState=GAME_START;all_button.trigger();initL1();initL2();mousePressed=false;}
      }else{image(backstart,578+160+20,500);}
      initL2();   
      break;
        }
    break;
    case GAME_L3:
    initL1();initL2();
    if(welldone2.isPlaying()){welldone2.pause();}
    if(L2_bg.isPlaying()){L2_bg.pause();}
    if ( !L3_bg.isPlaying() ){
       
    L3_bg.play();
    L3_bg.loop();}
    switch (l3State) {
      case 0:
      if(L2_bg.isPlaying()){L2_bg.pause();}
        image(l3eyecatch1,0,0,960,640);
        if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
          image(nexthover,775,550);
          if(mousePressed){l3State=1;all_button.trigger();mousePressed=false;}
      }else{image(next,775,550);}
      break;
      case 1:
         image(l3eyecatch2,0,0,960,640);
         if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
            image(nexthover,775,550);
         if(mousePressed){l3State=2;all_button.trigger();mousePressed=false;}
         }else{image(next,775,550);}
      break;
      case 2:
        image(l3instruction,0,0,960,640);
        if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
          image(starthover,775,550);
          if(mousePressed){l3State=3;all_button.trigger();initL3();mousePressed=false;}
          
        }else{image(start,775,550);}
      break;
      case 3:
      if(frozen.isPlaying()){frozen.pause();frozen.rewind();}
        image(level3item,0,0);
      image(level3bg1,0,100);
      //bug5
      detect(290,420,bug5,5);
     
      //bug4
      detect(296,231,bug4,4);
     
      //bug3
      detect(950,530,bug3,3);
     
      //bug2
      detect(690,480,bug2,2);
     
      //bug1
      detect(250,595,bug1,1);
     
      //bug0
      detect(205,505,bug0,0);
     
      if(pressed[0]==true && pressed[1]==true && pressed[2]==true && pressed[3]==true && pressed[4]==true && pressed[5]==true){
        l3State =6; 
      }
      //timer
        L3timer1();
      break;
      case 4:
        image(xlight,0,0);
        image(level3bg2,0,100);
        /*image(level3bg1,0,100);
        PImage newlevel3bg1 = createImage(level3bg1.width,level3bg1.height, RGB);
        
        image(level3bg2,0,100);
        
        
        
         newlevel3bg1.loadPixels();
          for(int x=0 ; x<level3bg1.width ; x++){
          for(int y=0 ; y<level3bg1.height ; y++){
            
            int loc = x+y*level3bg1.width;
            
            float r = red (level3bg1.pixels[loc]);
            float g = green (level3bg1.pixels[loc]);
            float b = blue (level3bg1.pixels[loc]);
    
            float distance = dist(x,y,mouseX,mouseY-90);
            // cutout effect
            float a = constrain( map(distance, 0,100,0,255) ,0,255);
    
            color c = color(r,g,b,a);
            newlevel3bg1.pixels[loc] = c;
          } 
        }
        newlevel3bg1.updatePixels();
        
        image(newlevel3bg1,0,100);*/
        
        L3timer1();
        a+=1;
        //println(a);
        if(a==120){l3State=3;}
        
       
    break;
    case 6:
      
    image(L3success,0,0);
    welldone3.play();
    if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
            image(nexthover,775,550);
         if(mousePressed){gameState=GAME_L4;all_button.trigger();mousePressed=false;}
         }else{image(next,775,550);}
    break;
     case GAME_FAIL:
      image(failbg,0,0,960,640);
      image(headerfail,56,240);
      
      if(mouseX>=578 && mouseX<=578+again.width && mouseY>=500 && mouseY<=500+again.height){
        image(againhover,578,500);
        if(mousePressed){l3State=2;all_button.trigger();initL3();mousePressed=false;}
      }else{image(again,578,500);}
      if(mouseX>=578+160+20 && mouseX<=578+160+20+again.width && mouseY>=500 && mouseY<=500+again.height){
        image(backstarthover,578+160+20,500);
        if(mousePressed){gameState=GAME_START;all_button.trigger();initL1();initL2();initL3();mousePressed=false;}
      }else{image(backstart,578+160+20,500);}
      initL3();   
      break;
    }
    break;
    case GAME_L4:
    if(welldone3.isPlaying()){welldone3.pause();}
    if(L3_bg.isPlaying()){L3_bg.pause();}
    if ( !L4_bg.isPlaying() ){
         
      L4_bg.play();
      L4_bg.loop();}
      switch (l4State) {
      case 0:
      thunder.play();
      image(l4eyecatch,0,0,960,640);
      if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
          image(nexthover,775,550);
          if(mousePressed){l4State=1;all_button.trigger();mousePressed = false;}
      }else{image(next,775,550);}
   
      break;
      case 1:
      image(l4instruction,0,0,960,640);
        if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
          image(starthover,775,550);
          if(mousePressed){l4State=2;all_button.trigger();initL4();mousePressed=false;}
        }else{image(start,775,550);}
          break;
      
      case 2:
      wrong.pause();
      wrong.rewind();
      image(level4bg,0,0,960,640);
      
      image(folder1,242, 335);
      image(folder2,385, 202);
      image(folder3,608, 291);
      image(folder4,480, 435);
      
      //timer
      L3timer1();
      
      
      if(mouseX >= 242 && mouseX<= 242 + folder1.width && mouseY >= 335 
      && mouseY <= 335+folder1.height){
        if(mousePressed){
         
        if(numberwindow.get(0) == 1)
        {
          l4State=4;mousePressed = false;
        }
        else
        {
          l4State=3;mousePressed = false;
        }
        image(window[numberwindow.get(0)],230,200);
      }
        
     }
       if(mouseX >= 385 && mouseX<= 385 + folder2.width && mouseY >= 202 
      && mouseY <= 202+folder2.height){
        if(mousePressed){
        if(numberwindow.get(1) == 1)
        {
          l4State=4;mousePressed = false;
        }
        else
        {
          l4State=3;mousePressed = false;
        }
    image(window[numberwindow.get(1)],230,200);}
        // "click" teacher appears if code image is shown
       
     }
       if(mouseX >= 608 && mouseX<= 608 + folder3.width && mouseY >= 291 
      && mouseY <= 291+folder3.height){
        if(mousePressed){
          if(numberwindow.get(2) == 1)
        {
          l4State=4;mousePressed = false;
        }
        else
        {
          l4State=3;mousePressed = false;
        } 
      image(window[numberwindow.get(2)],230,200);}
       break;
     }
       if(mouseX >= 480 && mouseX<= 480 + folder4.width && mouseY >= 435 
      && mouseY <= 435+folder4.height){
        if(mousePressed){
          if(numberwindow.get(3) == 1)
        {
          l4State=4;mousePressed = false;
        }
        else
        {
          l4State=3;mousePressed = false;
        } 
      image(window[numberwindow.get(3)],230,200);}
       break;
     }
       break;
       case 3:
       wrong.play();
      if (mouseX >=699 && mouseX  <=699 
        && mouseY >=200 && mouseY <=200);
        {
        if(mousePressed){l4State=2; mousePressed = false; }
        }
      break;
      case 4:
      correct.play();
      if (mouseX >=699 && mouseX  <=699 
        && mouseY >=200 && mouseY <=200);
        {
        if(mousePressed)
            { l4State=4;mousePressed = false;
            pushStyle();
            teacherWin.resize(0,300);
            image(teacherWin,100,340);
            
            l4State=6;
            popStyle();
            }
        }
      break;
      case 6:
        
      image(L4success,0,0,960,640);
      welldone4.play();
         if(mouseX>=775 && mouseX<=775+again.width && mouseY>=550 && mouseY<=550+again.height){
            image(nexthover,775,550);
         if(mousePressed){gameState=GAME_SUCCESS;all_button.trigger();mousePressed=false;}
         }else{image(next,775,550);}
      break;
      case GAME_FAIL:
      image(failbg,0,0,960,640);
      image(headerfail,56,240);
      
      if(mouseX>=578 && mouseX<=578+again.width && mouseY>=500 && mouseY<=500+again.height){
        image(againhover,578,500);
        if(mousePressed){l4State=1;all_button.trigger();initL4();;mousePressed=false;}
      }else{image(again,578,500);}
      if(mouseX>=578+160+20 && mouseX<=578+160+20+again.width && mouseY>=500 && mouseY<=500+again.height){
        image(backstarthover,578+160+20,500);
        if(mousePressed){gameState=GAME_START;all_button.trigger();initL1();initL2();initL3();initL4();mousePressed=false;}
      }else{image(backstart,578+160+20,500);}
      initL2();   
      break;
      }
    break;
    
    case GAME_SUCCESS:
    if(welldone4.isPlaying()){welldone4.pause();}
    if(L4_bg.isPlaying()){L4_bg.pause();}
    if ( !game_bg.isPlaying() ){
       
    game_bg.play();
    game_bg.loop();}
      image(successbg,0,0,960,640);
      image(headersuccess,56,240);
      
      if(mouseX>=578+160+20 && mouseX<=578+160+20+again.width && mouseY>=500 && mouseY<=500+again.height){
        image(backstarthover,578+160+20,500);
        if(mousePressed){gameState=GAME_START;all_button.trigger();mousePressed=false;}
      }else{image(backstart,578+160+20,500);}
    break;
    
  }
}
void initL1(){
  fecenum=0;collect1=collect2=collect3=collect4=collect5=100;
  dropy1=dropy2=dropy3=dropy4=dropy5=dropy6=dropy7=dropy8=dropy9=dropy10=dropy11=dropy12=dropy13=dropy14=0;
}

void initL2(){
  fecenum=0; l2Exam=0;right_drag.rewind();clickWrong.rewind();
}

void initL3(){
  b=0;
  gameTimer = TIMER_L3;
  frozen.rewind();
  for(int i=0;i<6;i++){
    pressed[i]=false;
  }
}

void initL4(){
  gameTimer = TIMER_L4;
}

void L3timer1(){
 textFont ( f ,48 ) ; 
 image(clock,30,10);
 textAlign(LEFT);
 String timeString = convertFrameToTimeString(gameTimer);
 fill(getTimeTextColor(gameTimer));
 text(timeString,120, 65);
 
 gameTimer --;
  if(gameTimer <= 0) l3State = GAME_FAIL;
  if(gameTimer <= 0) l4State = GAME_FAIL;
}
void L3timer2(){
  image(xlight,30,10);
  fill(#ff0000);
  String timeString2=convertFrameToXTimeString(XTimer);
  text(timeString2,120, 65);
  XTimer --;
  if(XTimer <= 0) l3State = 3;
}    
      

color getTimeTextColor(int frames){
  if(frames >= 240){
    return #ffffff;
  }else if(frames >= 600){
    return #ff6600;
  }

  return #ff0000;
}

String convertFrameToTimeString(int frames){
  String result = "";
  float totalSeconds = float(frames) / 60;
  result += nf(floor(totalSeconds%60), 2);
  return result;
}

String convertFrameToXTimeString(int frames){
  String result = "";
  float totalSeconds = float(frames) / 60;
  result += nf(floor(totalSeconds%60), 2);
  return result;
}

void pressAction(int x ,int y){
   stroke(255,0,0);
   strokeWeight(3);
   noFill();
   ellipse(x,y,80,80);
   bugsCount ++;
}

void detect(int a , int b , PImage bugsNumber,int x){//296 231
  if(mouseX>=a-30 && mouseX<=a &&  mouseY>=b-15 && mouseY<=b+15){
      if(mousePressed){
        pressed[x] = true;
        foundbug.trigger();
      }
  }
  if(pressed[x]){
    imageMode(CENTER);
    image(bugsNumber,a,b);
    imageMode(CORNER);
    pressAction(a,b);
  }
}

void keyPressed(){
    if(key=='t'&& b<1){
     b+=1;
     l3State = 4;
     frozen.play();
     frozen.loop();
     
    }
    if(key=='r'){
      gameState = GAME_SUCCESS;
     
    }
    
    
}
