class Dealer
{
  Dealer()
  {
  }
  void update()
  {
    if(round > 0)
    {
      for(int i = 1; i < drawNum; ++i)
      {
        cards[i].update(); 
      }
    }
  }
  
  void pDraw(boolean faceUp) { cards[drawNum] = new Card(drawRandomId(), true, faceUp); }
  
  void dDraw(boolean faceUp){ cards[drawNum] = new Card(drawRandomId(), false, faceUp); }
  
  void round1()
  {
    round = 1;
    drawNum = 1;
    cash -= bet;
    pCardCount = 0;
    dCardCount = 0;
    shuffled();
    pDraw(true);
    pDraw(true);
    dDraw(false);
    dDraw(true);
    points();
    println(dPoints);
  }
  
  void shuffled()
  {
    for(int i = 1; i <= 52; ++i)
    {
      shuffled.append(i);
    }
    shuffled.shuffle();
    //println(deck);
  }
  
  int drawRandomId()
  {
    return shuffled.get(drawNum);
  }
}
