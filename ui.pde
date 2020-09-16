void ui() 
{
  int[] whitish      = {166, 255, 214};
  int[] lighterGreen = {126, 242, 184};
  int[] lightGreen   = {93, 179, 136};
  int[] pokerGreen   = {53, 101, 77};
  int[] green        = {60, 115, 87};
  int[] darkGreen    = {40, 77, 58};
  String scoreString, betString;
  PImage wood = loadImage("woodx640.jpg");
  int textX = width/2; //80 - 35;
  initUI = true;
  background(pokerGreen[0], pokerGreen[1], pokerGreen[2]);
  background(loadImage("bg.jpg"));
  
  textSize(28);
  textAlign(CENTER);
  text(screen, width/2, height/2);
  textSize(17);
  textAlign(CENTER);
  text("x Hit | c Stand | v Split | z Double Down | q New Round", textX, height-30);
  text("SHIFT ++ | CTRL -- | b Bet", textX, height-60);
  if(player.splitPoints > 0) scoreString = str(player.points) + " / " + str(player.splitPoints);
  else scoreString = str(player.points);
  if(player.splitBet > 0) betString = str(player.bet) + " / " + str(player.splitBet);
  else if(player.bet > 0) betString = str(player.bet);
  else                    betString = "00";
  text("$" + player.money + " |  Bet: $" + betString + " |  Hand: " + scoreString, textX, height-90);
  
  //textSize(38);
  //text("$" + player.money, 84, height-65);
}
