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
void draw () {
  background(255);
  int grid_x = 130;
  while (grid_x < 590) {
    line(grid_x, 130, grid_x, 530);
    grid_x = grid_x + 80;
  }
  int grid_y = 130;
  while (grid_y < 590) {
    line(130, grid_y, 530, grid_y);
    grid_y = grid_y + 80;
    fill(0);
    textSize(16);
    text("Bingo", width/2, 50);
  }
  
}
