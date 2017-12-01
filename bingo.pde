IntList B = new IntList(5);
IntList I = new IntList(5);
IntList N = new IntList(5);
IntList G = new IntList(5);
IntList O = new IntList(5);
void settings () {
  size(600, 600);
}
void setup () {
  for (int x = 0; x != 11; B.append(++x)) {
    B.shuffle();
  }
  for (int x = 10; x != 21; I.append(++x)) {
    I.shuffle();
  }
  for (int x = 20; x != 31; N.append(++x)) {
    N.shuffle();
  }
  for (int x = 30; x != 41; G.append(++x)) {
    G.shuffle();
  }
  for (int x = 40; x != 51; O.append(++x)) {
    O.shuffle();
  }
}
void debug() {
  textSize(12);
  text("X, Y: " + mouseX + " " + mouseY, 40, 12);
}
void draw () {
  background(255);
  debug();
  int grid_x = 100;
  while (grid_x < 580) {
    line(grid_x, 100, grid_x, 500);
    grid_x = grid_x + 80;
  }
  int grid_y = 100;
  while (grid_y < 580) {
    line(100, grid_y, 500, grid_y);
    grid_y = grid_y + 80;
    fill(0);
    textSize(32);
    textAlign(CENTER);
    text("Binary Bingo", width/2, 25);
  }
  int bingoOffset = 60;
  for (int i = 0; i < 5; i++) {
    bingoOffset += 80;
    text("B", bingoOffset, 85);
    bingoOffset += 80;
    text("I", bingoOffset, 85);
    bingoOffset += 80;
    text("N", bingoOffset, 85);
    bingoOffset += 80;
    text("G", bingoOffset, 85);
    bingoOffset += 80;
    text("O", bingoOffset, 85);
    bingoOffset += 80;
  }
  int textX = 140;
  int textY = 150;
  for (int i = 0; i < 5; i++) {
    int b = B.get(i);
    text(b, 140, textY);
    textY += 80;
  }
  textY = 150;
  for (int j = 0; j < 5; j++) {
    int i = I.get(j);
    text(i, 220, textY);
    textY += 80;
  }
  textY = 150;
  for (int j = 0; j < 5; j++) {
    int n = N.get(j);
    text(n, 300, textY);
    textY += 80;
  }
  textY = 150;
  for (int j = 0; j < 5; j++) {
    int g = G.get(j);
    text(g, 380, textY);
    textY += 80;
  }
  textY = 150;
  for (int j = 0; j < 5; j++) {
    int o = O.get(j);
    text(o, 460, textY);
    textY += 80;
  }
}
