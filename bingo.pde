import processing.pdf.*;

IntList B = new IntList(5);
IntList I = new IntList(5);
IntList N = new IntList(5);
IntList G = new IntList(5);
IntList O = new IntList(5);
IntList Bhex = new IntList(5);
IntList Ihex = new IntList(5);
IntList Nhex = new IntList(5);
IntList Ghex = new IntList(5);
IntList Ohex = new IntList(5);
IntList Boct = new IntList(5);
IntList Ioct = new IntList(5);
IntList Noct = new IntList(5);
IntList Goct = new IntList(5);
IntList Ooct = new IntList(5);
String[] Bbinary = new String[5];
String[] Ibinary = new String[5];
String[] Nbinary = new String[5];
String[] Gbinary = new String[5];
String[] Obinary = new String[5];
String[] Bhexa = new String[5];
String[] Ihexa = new String[5];
String[] Nhexa = new String[5];
String[] Ghexa = new String[5];
String[] Ohexa = new String[5];
String[] Bocta = new String[5];
String[] Iocta = new String[5];
String[] Nocta = new String[5];
String[] Gocta = new String[5];
String[] Oocta = new String[5];

boolean middle = true;
boolean binaryConverted = false;
boolean hexaConverted = false;
boolean octalConverted = false;
boolean pdfRecord = false;

float c = 0;
void settings () {
  size(600, 600);
}
void setup () {
  //Create Settings window
  String[] args = {"Settings"};
  Settings sa = new Settings();
  PApplet.runSketch(args, sa);
  //Decimals
  for (int x = 0; x != 15; B.append(++x)) {
    B.shuffle();
  }
  for (int x = 15; x != 30; I.append(++x)) {
    I.shuffle();
  }
  for (int x = 30; x != 60; N.append(++x)) {
    N.shuffle();
  }
  for (int x = 60; x != 90; G.append(++x)) {
    G.shuffle();
  }
  for (int x = 90; x != 120; O.append(++x)) {
    O.shuffle();
  }
  //Hexadecimals
  for (int x = 0; x != 50; Bhex.append(++x)) {
    Bhex.shuffle();
  }
  for (int x = 50; x != 100; Ihex.append(++x)) {
    Ihex.shuffle();
  }
  for (int x = 100; x != 150; Nhex.append(++x)) {
    Nhex.shuffle();
  }
  for (int x = 150; x != 200; Ghex.append(++x)) {
    Ghex.shuffle();
  }
  for (int x = 200; x != 250; Ohex.append(++x)) {
    Ohex.shuffle();
  }
  //Octals
  for (int x = 0; x != 30; Boct.append(++x)) {
    Boct.shuffle();
  }
  for (int x = 30; x != 60; Ioct.append(++x)) {
    Ioct.shuffle();
  }
  for (int x = 60; x != 90; Noct.append(++x)) {
    Noct.shuffle();
  }
  for (int x = 90; x != 120; Goct.append(++x)) {
    Goct.shuffle();
  }
  for (int x = 120; x != 500; Ooct.append(++x)) {
    Ooct.shuffle();
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
  for (int x = 0; x != 15; B.append(++x)) {
    B.shuffle();
  }
  for (int x = 15; x != 30; I.append(++x)) {
    I.shuffle();
  }
  for (int x = 30; x != 60; N.append(++x)) {
    N.shuffle();
  }
  for (int x = 60; x != 90; G.append(++x)) {
    G.shuffle();
  }
  for (int x = 90; x != 120; O.append(++x)) {
    O.shuffle();
  }
  //clear the IntLists to avoid duplicates
  Bhex.clear();
  Ihex.clear();
  Nhex.clear();
  Ghex.clear();
  Ohex.clear();
  //shuffle the IntLists
  for (int x = 0; x != 50; Bhex.append(++x)) {
    Bhex.shuffle();
  }
  for (int x = 50; x != 100; Ihex.append(++x)) {
    Ihex.shuffle();
  }
  for (int x = 100; x != 150; Nhex.append(++x)) {
    Nhex.shuffle();
  }
  for (int x = 150; x != 200; Ghex.append(++x)) {
    Ghex.shuffle();
  }
  for (int x = 200; x != 250; Ohex.append(++x)) {
    Ohex.shuffle();
  }
  //clear the IntLists to avoid duplicates
  Boct.clear();
  Ioct.clear();
  Noct.clear();
  Goct.clear();
  Ooct.clear();
  //shuffle the IntLists
  for (int x = 0; x != 30; Boct.append(++x)) {
    Boct.shuffle();
  }
  for (int x = 30; x != 60; Ioct.append(++x)) {
    Ioct.shuffle();
  }
  for (int x = 60; x != 90; Noct.append(++x)) {
    Noct.shuffle();
  }
  for (int x = 90; x != 120; Goct.append(++x)) {
    Goct.shuffle();
  }
  for (int x = 120; x != 500; Ooct.append(++x)) {
    Ooct.shuffle();
  }
}
void octalConvert() {
  for (int i = 0; i < 5; i++) {
    Bocta[i] = Integer.toOctalString(Boct.get(i));
    Iocta[i] = Integer.toOctalString(Ioct.get(i));
    Nocta[i] = Integer.toOctalString(Noct.get(i));
    Gocta[i] = Integer.toOctalString(Goct.get(i));
    Oocta[i] = Integer.toOctalString(Ooct.get(i));
  }
  if (octalConverted) {
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
      text("Octal Bingo", width/2, 25);
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
    int textY = 150;
    textSize(24);
    for (int i = 0; i < 5; i++) {
      text(Bocta[i], 140, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Iocta[j], 220, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Nocta[j], 300, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Gocta[j], 380, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Oocta[j], 460, textY);
      textY += 80;
    }

    free(); //Add "FREE" tile in the centre.
  }
}
void hexaConvert() {
  for (int i = 0; i < 5; i++) {
    Bhexa[i] = hex((byte) Bhex.get(i));
    Ihexa[i] = hex((byte) Ihex.get(i));
    Nhexa[i] = hex((byte) Nhex.get(i));
    Ghexa[i] = hex((byte) Ghex.get(i));
    Ohexa[i] = hex((byte) Ohex.get(i));
  }
  if (hexaConverted) {
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
      text("Hexadecimal Bingo", width/2, 25);
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
    int textY = 150;
    textSize(24);
    for (int i = 0; i < 5; i++) {
      text(Bhexa[i], 140, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Ihexa[j], 220, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Nhexa[j], 300, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Ghexa[j], 380, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Ohexa[j], 460, textY);
      textY += 80;
    }

    free(); //Add "FREE" tile in the centre.
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
    text("Decimal Bingo", width/2, 25);
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
  octalConvert();
  hexaConvert();
  binaryConvert();
  free(); //Add "FREE" tile in the centre.
  if (pdfRecord) {
    save("bingoCard.png");
  }
}
public class Settings extends PApplet {

  public void settings() {
    size(300, 400);
  }
  public void draw() {
    background(255);
    fill(255);
    rect(10, 185, 170, 20);//"REGENERATE"
    fill(0);
    textSize(20);
    text("Bingo Options", 90, 20);
    textSize(16);
    text("Free in middle?", 10, 70);
    fill(255);
    rect(10, 80, 50, 20);// free button "yes" option
    rect(90, 80, 50, 20);//free button "no" option
    rect(10, 140, 50, 20);// binary "yes" button
    rect(90, 140, 50, 20);// binary "no" button
    rect(10, 235, 50, 20);//hexa "yes" button
    rect(90, 235, 50, 20);//hexa "no" button
    rect(10, 295, 50, 20);//octal "yes" button
    rect(90, 295, 50, 20);//octal "no" button
    fill(0);
    text("Yes", 20, 95);
    text("No", 105, 95);
    text("Yes", 20, 155);
    text("No", 105, 155);
    text("Yes", 20, 250);
    text("No", 105, 250);
    text("Yes", 20, 310);
    text("No", 105, 310);
    fill(0);
    text("Binary", 10, 130);
    text("Regenerate Numbers", 15, 200);
    fill(255);
    rect(10, 320, 100, 30);
    fill(0);
    text("Create PDF", 15, 340);
    text("Hexadecimal", 10, 230);
    text("Octal", 10, 290);
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
      pdfRecord = true;
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 10 && mouseX <= 180 && mouseY >= 185 && mouseY <= 205) {
      fill(0);
      rect(10, 185, 170, 20);
      regen();
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 10 && mouseX <= 60 && mouseY >= 140 && mouseY <= 160) {
      fill(0);
      rect(10, 140, 50, 20);
      binaryConverted = true;
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 90 && mouseX <= 140 && mouseY >= 140 && mouseY <= 160) {
      fill(0);
      rect(90, 140, 50, 20);
      binaryConverted = false;
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 10 && mouseX <= 60 && mouseY >= 235 && mouseY <= 255) {
      fill(0);
      rect(10, 235, 50, 20);
      hexaConverted = true;
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 90 && mouseX <= 140 && mouseY >= 235 && mouseY <= 255) {
      fill(0);
      rect(90, 235, 50, 20);
      hexaConverted = false;
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 10 && mouseX <= 60 && mouseY >= 295 && mouseY <= 315) {
      fill(0);
      rect(10, 295, 50, 20);
      octalConverted = true;
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 90 && mouseX <= 140 && mouseY >= 295 && mouseY <= 315) {
      fill(0);
      rect(90, 295, 50, 20);
      octalConverted = false;
    }
    if (middle) {
      fill(0);
      rect(10, 80, 50, 20);// free button "yes" option
      fill(255);
      text("Yes", 20, 95);
    } else if (!middle) {
      fill(0);
      rect(90, 80, 50, 20);//free button "no" option
      fill(255);
      text("No", 105, 95);
    }
    if (binaryConverted) {
      fill(0);
      rect(10, 140, 50, 20);// binary "yes" button
      fill(255);
      text("Yes", 20, 155);
    } else if (!binaryConverted) {
      fill(0);
      rect(90, 140, 50, 20);// binary "no" button
      fill(255);
      text("No", 105, 155);
    }
    if (hexaConverted) {
      fill(0);
      rect(10, 235, 50, 20);//hexa "yes" button
      fill(255);
      text("Yes", 20, 250);
    } else if (!hexaConverted) {
      fill(0);
      rect(90, 235, 50, 20);//hexa "no" button
      fill(255);
      text("No", 105, 250);
    }
    if (octalConverted) {
      fill(0);
      rect(10, 295, 50, 20);//octal "yes" button
      fill(255);
      text("Yes", 20, 310);
    } else if (!octalConverted) {
      fill(0);
      rect(90, 295, 50, 20);//octal "no" button
      fill(255);
      text("No", 105, 310);
    }
    fill(0);
    textSize(12);
    text("X, Y: " + mouseX + " " + mouseY, 10, 12);
  }
}
