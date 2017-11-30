int[] b = new int[5];
int[] i = new int[5];
int[] n = new int[5];
int[] g = new int[5];
int[] o = new int[5];
void settings () {
  size(600, 600);
}
void setup () {
  for (int x = 0; x < 5; x++) {
    b[x] = (int) random(1, 10);
    i[x] = (int) random(11, 20);
    n[x] = (int) random(21, 30);
    g[x] = (int) random(31, 40);
    o[x] = (int) random(41, 50);
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
    text("Binary Bingo", width/2, 75);
  }
  int textX = 140;
  int textY = 150;
  for (int i = 0; i < 5; i++) {
    text(b[i], 140, textY);
    textY += 80;
  }
  textY = 150;
    for (int j = 0; j < 5; j++) {
    text(i[j], 220, textY);
    textY += 80;
  }
  textY = 150;
    for (int i = 0; i < 5; i++) {
    text(n[i], 300, textY);
    textY += 80;
  }
  textY = 150;
    for (int i = 0; i < 5; i++) {
    text(g[i], 380, textY);
    textY += 80;
  }
}
