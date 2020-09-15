class Dealer
{
  int points, handSize, round;
  Dealer()
  {
    round = 0;
    handSize = 0;
  }

  void getCard()
  { 
    int x, y;
    boolean faceUp;
    ++handSize;
    y = 75;
    x = 75*handSize;
    if (handSize == 1) faceUp = false;
    else faceUp = true;
    newCard(x, y, faceUp);
  }
}
