IntList B = new IntList(5);
IntList I = new IntList(5);
IntList N = new IntList(5);
IntList G = new IntList(5);
IntList O = new IntList(5);
String[] Bbinary = new String[5];
String[] Ibinary = new String[5];
String[] Nbinary = new String[5];
String[] Gbinary = new String[5];
String[] Obinary = new String[5];
boolean middle = true;
boolean binaryConverted = false;
void settings () {
  size(600, 600);
}
void setup () {
  surface.setResizable(true);
  //Create Settings window
  String[] args = {"Settings"};
  Settings sa = new Settings();
  PApplet.runSketch(args, sa);

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
  fill(0);
  textSize(12);
  text("X, Y: " + mouseX + " " + mouseY, 40, 12);
}
void free() {
  if (middle) {
    fill(255);
    rect(260, 260, 80, 80);
    fill(0);
    textAlign(CENTER);
    textSize(25);
    text("FREE", 300, 310);
  }
}
void regen() {
  //clear the IntLists to avoid duplicates
  B.clear();
  I.clear();
  N.clear();
  G.clear();
  O.clear();
  //shuffle the IntLists
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
void binaryConvert() {
  for (int i = 0; i < 5; i++) {
    Bbinary[i] = binary((byte) B.get(i), 5);
    Ibinary[i] = binary((byte) I.get(i), 5);
    Nbinary[i] = binary((byte) N.get(i), 5);
    Gbinary[i] = binary((byte) G.get(i), 5);
    Obinary[i] = binary((byte) O.get(i), 5);
  }
  if (binaryConverted) {
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
    textSize(24);
    for (int i = 0; i < 5; i++) {
      text(Bbinary[i], 140, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Ibinary[j], 220, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Nbinary[j], 300, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Gbinary[j], 380, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Obinary[j], 460, textY);
      textY += 80;
    }

    free(); //Add "FREE" tile in the centre.
  }
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
  binaryConvert();
  free(); //Add "FREE" tile in the centre.
}
public class Settings extends PApplet {

  public void settings() {
    size(300, 400);
  }
  public void draw() {
    background(255);
    fill(255);
    rect(10, 175, 100, 20);//"REGENERATE"
    fill(0);
    textSize(20);
    text("Bingo Options", 90, 20);
    textSize(16);
    text("Free in middle?", 10, 70);
    rect(10, 80, 50, 20);
    rect(90, 80, 50, 20);
    rect(10, 140, 50, 20);
    rect(90, 140, 50, 20);
    fill(255);
    text("Yes", 20, 95);
    text("No", 105, 95);
    text("Yes", 20, 155);
    text("No", 105, 155);
    fill(0);
    text("Binary", 10, 130);
    text("Regenerate", 15, 190);
    fill(255);
    rect(10, 320, 100, 30);
    fill(0);
    textSize(16);
    text("Create PDF", 15, 340);
    if (mousePressed && mouseButton == LEFT && mouseX >= 90 && mouseX <= 140 && mouseY >= 80 && mouseY <= 100) {
      fill(0);
      rect(90, 80, 50, 20);
      middle = false;
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 10 && mouseX <= 60 && mouseY >= 80 && mouseY <= 100) {
      fill(0);
      rect(10, 80, 50, 20);
      middle = true;
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 10 && mouseX <= 180 && mouseY >= 320 && mouseY <= 350) {
      rect(10, 320, 100, 30);
      endRecord();
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 10 && mouseX <= 110 && mouseY >= 175 && mouseY <= 195) {
      regen();
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 10 && mouseX <= 60 && mouseY >= 140 && mouseY <= 160) {
      binaryConverted = true;
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 90 && mouseX <= 140 && mouseY >= 140 && mouseY <= 160) {
      binaryConverted = false;
    }
    fill(0);
    textSize(12);
    text("X, Y: " + mouseX + " " + mouseY, 10, 12);
  }
}
