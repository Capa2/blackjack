class Player
{
  int handSize, aces, points, splitPoints, bet, splitBet, betAmount, money;
  boolean bust, canBet, canHit, canStand, canSplit, canDouble, canIns;
  Player(int _money)
  {
    betAmount = 10;
    money = _money;
  }

  void getCard(boolean split)
  { 
    int x, y;
    boolean faceUp = true;
    ++handSize;
    y = height-190;
    x = 80*handSize;
    
    newCard(x, y, faceUp);
    
    if(cards[drawNum-1].value == 11) ++aces;
    
    if (!split) points += cards[drawNum-1].value;
    else   splitPoints += cards[drawNum-1].value;
    
    bust();
  }

  void bust()
  {
    if(points > 21 && aces > 0)
    {
      points -= 10;
      --aces;
      bust();
    }
    else if(points > 21)
    {
      bust = true;
      getWinner();
      screen = "BUST!";
      if(player.money > 0) screen += " press q to start a new round."
      else screen += " Get out of here!"
      println("BUST! press q to restart.");
    }
    else bust = false;
  }

  void hit()
  {
    if (canHit && !bust)
    {
      getCard(false);
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
    if (bet < money && canDouble && !bust)
    {
      money -= bet;
      bet   += bet;
      getCard(false);
      advance = true;
      round = 3;
    }
  }

  void splitBet()
  {
    if (canSplit && !bust && cards[0].value == cards[1].value)
    {
      cards[1].splitValue();
      getCard(false);
      getCard(true);
      splitBet = bet/2;
      bet = splitBet;
      advance = true;
      round = 3;
    }
  }
  
  void win(int pool)
  {
    money += pool*2;
  }

  void bet()
  {
    if (canBet && !bust)
    {
      if (keyCode == SHIFT && bet < money)
      {
        bet += betAmount;
      }
      if (keyCode == CONTROL && bet > 0)
      {
        bet -= betAmount;
      }
      if (key == 'b' && bet > 0)
      {
        money -= bet;
        advance = true;
        round = 1;
      }
    }
  }
}
