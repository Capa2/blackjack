void setup()
{
  println("Setup in progress...\n");
  size(420, 640);
  frameRate(30);
  shuffled = new IntList();
  pCardCount = 0;
  dCardCount = 0;
  drawNum = 1;
  shuffled();
  pDraw();
  pDraw();
  dHand();
  cardUrl = new StringList("red_back.png", "AC.png", "AD.png", "AH.png", "AS.png", "2C.png", "2D.png", "2H.png", "2S.png", "3C.png","3D.png", "3H.png", "3S.png", "4C.png", "4D.png", "4H.png", "4S.png", "5C.png", "5D.png", "5H.png", "5S.png", "6C.png", "6D.png", "6H.png", "6S.png", "7C.png", "7D.png", "7H.png", "7S.png", "8C.png", "8D.png", "8H.png", "8S.png", "9C.png", "9D.png", "9H.png", "9S.png", "10C.png", "10D.png", "10H.png", "10S.png", "JC.png", "JD.png", "JH.png", "JS.png", "QC.png", "QD.png", "QH.png", "QS.png", "KC.png", "KD.png", "KH.png", "KS.png");
  // cardUrl.get(n)  LIST:  C>D>H>S  CARDBACK-A-2-3-4-5-6-7-8-9-10-J-Q-K
  println("\nSetup complete.\n");
  println(points());
}

void draw()
{
  background(pokerGreen[0],pokerGreen[1],pokerGreen[2]);
  for(int i = 1; i < drawNum; i++)
  {
    cards[i].update(); 
  }
  ui();
}

void ui() 
{
  rectMode(CENTER);
  strokeWeight(1);
  textSize(18);
  textAlign(CENTER);
  text("(x) Hit  (c) Stand  (d) Double Down", width/2,height-225+12);
  text("(s) Split  (e) Insurance  (q) Restart", width/2,height-200+12);
  text("Hand: " + points(), width/2,height-250+12);
}
