void ui() 
{
  int[] whitish      = {166, 255, 214};
  int[] lighterGreen = {126, 242, 184};
  int[] lightGreen   = {93, 179, 136};
  int[] pokerGreen   = {53, 101, 77};
  int[] green        = {60, 115, 87};
  int[] darkGreen    = {40, 77, 58};
  String scoreString, betString;
  
  background(pokerGreen[0], pokerGreen[1], pokerGreen[2]);
  
  rectMode(CENTER);
  strokeWeight(1);
  textSize(18);
  textAlign(CENTER);
  text("(x) Hit  (c) Stand  (v) Split  (z) Double Down", width/2, height-225+12);
  text("(.) +bet (,) -bet  (q) Restart", width/2, height-200+12);
  if(player.splitPoints > 0) scoreString = str(player.points) + " / " + str(player.splitPoints);
  else scoreString = str(player.points);
  if(player.splitBet > 0) betString = str(player.bet) + " / " + str(player.splitBet);
  else betString = str(player.bet);
  text("$" + player.money + "  Bet: " + betString + "  Hand: " + scoreString, width/2, height-250+12);
}
