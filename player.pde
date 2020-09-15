class Player
{
  int handSize, points, bet, splitBet, betAmount, money;
  boolean bust, betting, canBet, canHit, canStand, canSplit, canDouble, canIns;
  Player(int _money)
  {
    handSize = 0;
    points = 0;
    bet = 0;
    betAmount = 10;
    money = _money;
  }

  void getCard()
  { 
    int x, y;
    boolean faceUp = true;
    ++handSize;
    y = height-75;
    x = 75*handSize;
    
    newCard(x, y, faceUp);
    
    if(cards[drawNum-1].value == 11 && points + cards[drawNum-1].value > 21) points += 1;
    else points += cards[drawNum-1].value;
    
    bust();
  }

  void bust()
  {
    if (points > 21)
    {
      bust = true;
    }
  }

  void hit()
  {
    if (canHit && !bust)
    {
      getCard();
      advance = true;
      round = 2;
    }
  }

  void stand()
  {
    if (canStand && !bust)
    {
      advance = true;
      round = 3;
    }
  }

  void doubleBet()
  {
    if (canDouble && bet < money && !bust)
    {
      money -= bet;
      bet   += bet;
      getCard();
      advance = true;
      round = 3;
    }
  }

  void splitBet() // INCOMPLETE - MISSING DUAL POINT SETUP
  {
    if (canSplit && !bust)
    {
      getCard();
      getCard();
      splitBet = bet/2;
      bet = splitBet;
      advance = true;
      round = 3;
    }
  }

  void bet()
  {
    if (canBet && !bust)
    {
      if (key == '.')
      {
        bet += betAmount;
      }
      if (key == ',')
      {
        bet += betAmount;
      }
      if (key == 'b')
      {
        money -= bet;
        advance = true;
        round = 1;
      }
    }
  }
}
