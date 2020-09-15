void keyPressed()
{
  if(key == 'q') setup();
  if(key == 'x' && round > 0)
  {
    dealer.pDraw(true);
    points();
  }
  if(key == '.' && bet < cash) bet += 10;
  if(key == ',' && bet > 0) bet -= 10;
  if(key == 'b' && round == 0) dealer.round1();
}

void points()
{
  int pP = 0;
  int dP = 0;
  for(int i = 1; i < drawNum; ++i)
  {
    if(cards[i].pHand)
    {
      pP += cards[i].getValue();
      //println("ID " + cards[i].id + ". Value: " + cards[i].getValue() + " URL: " + cardUrl.get(cards[i].id));
    }
    else
    {
      dP += cards[i].getValue();
    }
  }
  for(int i = 1; i < drawNum; ++i)
  {
    if(cards[i].pHand && cards[i].id > 0 && cards[i].id <= 4 && pP > 21)
    {
      pP -= 10;
    }
    else if(!cards[i].pHand && cards[i].id > 0 && cards[i].id <= 4 && dP > 21)
    {
      dP -= 10;
    }
  }
  pPoints = pP;
  dPoints = dP;
}

void createLists()
{
  shuffled = new IntList();
  cardUrl = new StringList("red_back.png", "AC.png", "AD.png", "AH.png", "AS.png", "2C.png", "2D.png", "2H.png", "2S.png", "3C.png","3D.png", "3H.png", "3S.png", "4C.png", "4D.png", "4H.png", "4S.png", "5C.png", "5D.png", "5H.png", "5S.png", "6C.png", "6D.png", "6H.png", "6S.png", "7C.png", "7D.png", "7H.png", "7S.png", "8C.png", "8D.png", "8H.png", "8S.png", "9C.png", "9D.png", "9H.png", "9S.png", "10C.png", "10D.png", "10H.png", "10S.png", "JC.png", "JD.png", "JH.png", "JS.png", "QC.png", "QD.png", "QH.png", "QS.png", "KC.png", "KD.png", "KH.png", "KS.png");
  // cardUrl.get(n)  LIST:  C>D>H>S  CARDBACK-A-2-3-4-5-6-7-8-9-10-J-Q-K
}

void ui() 
{
  rectMode(CENTER);
  strokeWeight(1);
  textSize(18);
  textAlign(CENTER);
  text("(x) Hit  (c) Stand  (d) Double Down", width/2,height-225+12);
  text("+(.) -(,) (b) bet  (q) Restart", width/2,height-200+12);
  text("$: " + cash + "  Bet: " + bet + "  Hand: " + pPoints, width/2,height-250+12);
}
