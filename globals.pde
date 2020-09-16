IntList shuffled;
int drawNum;
int round;
boolean advance, initUI;

Card[] cards = new Card[52]; // array of card objects. [0] not in use.
Dealer dealer = new Dealer();
Player player = new Player(200);
