import processing.pdf.*;

IntList B = new IntList();
IntList I = new IntList();
IntList N = new IntList();
IntList G = new IntList();
IntList O = new IntList();
IntList Bhex = new IntList();
IntList Ihex = new IntList();
IntList Nhex = new IntList();
IntList Ghex = new IntList();
IntList Ohex = new IntList();
IntList Boct = new IntList();
IntList Ioct = new IntList();
IntList Noct = new IntList();
IntList Goct = new IntList();
IntList Ooct = new IntList();
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
  SettingsWindow sa = new SettingsWindow();
  PApplet.runSketch(args, sa);
  surface.setTitle("Number Systems Bingo");
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
  delay(75);
  //shuffle the IntLists
  B.shuffle();
  I.shuffle();
  N.shuffle();
  G.shuffle();
  O.shuffle();
  //shuffle the IntLists
  Boct.shuffle();
  Ioct.shuffle();
  Noct.shuffle();
  Goct.shuffle();
  Ooct.shuffle();
  //shuffle the IntLists
  Bhex.shuffle();
  Ihex.shuffle();
  Nhex.shuffle();
  Ghex.shuffle();
  Ohex.shuffle();
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
    text(B.get(i), 140, textY);
    textY += 80;
  }
  textY = 150;
  for (int j = 0; j < 5; j++) {
    text(I.get(j), 220, textY);
    textY += 80;
  }
  textY = 150;
  for (int j = 0; j < 5; j++) {
    text(N.get(j), 300, textY);
    textY += 80;
  }
  textY = 150;
  for (int j = 0; j < 5; j++) {
    text(G.get(j), 380, textY);
    textY += 80;
  }
  textY = 150;
  for (int j = 0; j < 5; j++) {
    text(O.get(j), 460, textY);
    textY += 80;
  }
  octalConvert(); //Add octal conversions.
  hexaConvert(); //Add hexadecimal conversions.
  binaryConvert(); //Add binary conversions.
  free(); //Add "FREE" tile in the centre.
  //Add option to output to .PNG
  if (pdfRecord && binaryConverted && !middle) {
    noLoop();
    save("Saved Images/bingoCard_binary.png");
    loop();
  }
  if (pdfRecord && binaryConverted && middle) {
    noLoop();
    save("Saved Images/bingoCard_binaryFree.png");
    loop();
  }
  if (pdfRecord && hexaConverted && !middle) {
    noLoop();
    save("Saved Images/bingoCard_hexadecimal.png");
    loop();
  }
  if (pdfRecord && hexaConverted && middle) {
    noLoop();
    save("Saved Images/bingoCard_hexadecimalFree.png");
    loop();
  }
  if (pdfRecord && octalConverted && !middle) {
    noLoop();
    save("Saved Images/bingoCard_octal.png");
    loop();
  }
  if (pdfRecord && octalConverted && middle) {
    noLoop();
    save("Saved Images/bingoCard_octalFree.png");
    loop();
  }
  if (pdfRecord && !binaryConverted && !middle) {
    noLoop();
    save("Saved Images/bingoCard_decimal.png");
    loop();
  }
  if (pdfRecord && !binaryConverted && middle) {
    noLoop();
    save("Saved Images/bingoCard_decimalFree.png");
    loop();
  }
}
