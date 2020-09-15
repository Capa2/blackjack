int points()
{
  int points = 0;
  for(int i = 1; i < drawNum; ++i)
  {
    if(cards[i].pHand)
    {
      points += cards[i].getValue();
      println("ID " + cards[i].id + ". Value: " + cards[i].getValue() + " URL: " + cardUrl.get(cards[i].id));
    }
  }
  for(int i = 1; i < drawNum; ++i)
  {
    if(cards[i].pHand && cards[i].id > 0 && cards[i].id <= 4 && points > 21)
    {
      points -= 10;
    }
  }
  return points;
}

void pDraw()
{
  cards[drawNum] = new Card(ranDrawId(), true, true);
}

void dHand()
{
  cards[drawNum] = new Card(ranDrawId(), false, false);
  cards[drawNum] = new Card(ranDrawId(), false, true);
}

void shuffled()
{
  for(int i = 1; i <= 52; ++i)
  {
    shuffled.append(i);
  }
  shuffled.shuffle();
  println(shuffled);
}

int ranDrawId()
{
  return shuffled.get(drawNum);
}

void keyPressed()
{
  if(key == 'q') setup();
  if(key == 'x')
  {
    pDraw();
    points();
  }
}
