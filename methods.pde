void keyPressed()
{
  player.bet();
  if (key == 'x') player.hit();
  if (key == 'c') player.stand();
  if (key == 'v') player.splitBet();
  if (key == 'z') player.doubleBet();
  if (key == 'q') setup();
  if (key == 'Q') player.money += 100;
}

void newCard(int x, int y, boolean faceUp)
{
  cards[drawNum] = new Card(x, y, shuffled.get(drawNum), faceUp);
}

void shuffleCards()
{
  shuffled = new IntList();
  for (int i = 1; i <= 52; ++i)
  {
    shuffled.append(i);
  }
  shuffled.shuffle();
}

void drawCardGraphics()
{
  for (int i = 0; i < drawNum; ++i)
  {
    cards[i].update();
  }
}

void getWinner()
{
  if(!player.bust)
  {
    if(dealer.points > 21 || player.points > dealer.points)
    {
      player.win(player.bet);
      println("You Won! ", player.points, " > ", dealer.points);
      screen = "You Won $ " + player.bet + "!";
    }
    else
    {
      screen = "You Lost. You have $" + player.money + " left.";
      println("You Lost! ", player.points, " < ", dealer.points);
    }
  }
  
  if(!player.bust && player.splitPoints != 0)
  {
    if(dealer.points > 21 || player.splitPoints > dealer.points)
    {
      player.win(player.splitBet);
      screen += " You Won $ " + player.bet + "!";
      println("You Won! ", player.splitPoints, " > ", dealer.points);
    }
    else
    {
      screen += " You lost your Split bet.";
      println("You Lost! ", player.splitPoints, " < ", dealer.points);
    }
  }
  
}

void gameStage()
{
  if (round == 0)
  {
    screen = "Make your bet.";
    println("Round 0");
    drawNum = 0;
    player.handSize = 0;
    dealer.handSize = 0;
    player.aces = 0;
    player.points = 0;
    dealer.points = 0;
    player.splitPoints = 0;
    player.bet = 0;
    player.splitBet = 0;
    player.canBet = true;
    player.canHit = false;
    player.bust = false;
  }
  if (round == 1)
  {
    screen = "Hit / Stand / Split / Double Down.";
    println("Round 1");
    player.getCard(false);
    player.getCard(false);
    dealer.getCard();
    dealer.getCard();
    
    if(dealer.points == 21 && player.points != 21) round = 3;
    else if(player.points == 21) getWinner();
    
    player.canBet = false;
    player.canHit = true;
    player.canStand = true;
    player.canSplit = true;
    player.canDouble = true;
    player.canIns = true;
  }
  if (round == 2)
  {
    screen = "Hit / Stand.";
    println("Round 2");
    player.canBet = false;
    player.canHit = true;
    player.canStand = true;
    player.canSplit = false;
    player.canDouble = false;
    player.canIns = false;
  }
  if (round == 3)
  {
    screen = "Dealer's Turn...";
    println("Round 3");
    dealer.revealCard();
    player.canBet = false;
    player.canHit = false;
    player.canStand = false;
    player.canSplit = false;
    player.canDouble = false;
    player.canIns = false;
    dealer.hitStand();
    getWinner();
  }
}
