class Dealer
{
  int points, handSize, round, faceDownId;
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
    if (handSize == 1)
    {
      faceUp = false;
      faceDownId = drawNum;
    } else faceUp = true;
    
    newCard(x, y, faceUp);

    if (cards[drawNum-1].value == 11 && points + cards[drawNum-1].value > 21) points += 1;
    else points += cards[drawNum-1].value;
  }

  void revealCard()
  {
    cards[faceDownId].faceUp = true;
  }

  void hitStand()
  {
    if (points < 17)
    {
      println("Dealer drew a card.");
      getCard();
      hitStand();
    }
  }
}
