/*
Assignment 3, created by Kevin Lu and Aaron Liu
Program name: Number Systems (N.S. Bingo)
Description: A processing program to create PDF of multiple bingo cards for printing in different number systems.
Features:
         -5x5 grid for numbers.
         -Random number generator.
         -Basic interface.
         -Button for regenerating numbers.
         -Outputs to PDF.
         -"FREE" option in the center.
         -Buttons to toggle between various number systems.
         -Outputs the cards in a visually pleasing manner.
         -Can, if requested, generate more than one bingo card as required.
         -Can, if requested, generate more than one file's worth of cards.
Required software: Processing 3.1.1 or above.
Website: https://github.com/KevinLu/bingo
*/

/*
Import processing.pdf package and declare variables for each number system.
*/
import processing.pdf.*;
PFont font; //the font for the title of the card
PFont def; //def = default font
PGraphicsPDF pdf;
IntList B = new IntList(); //B, I, N, G, O IntLists for Decimal values.
IntList I = new IntList();
IntList N = new IntList();
IntList G = new IntList();
IntList O = new IntList();
//Binary values
IntList Bbin = new IntList();
IntList Ibin = new IntList();
IntList Nbin = new IntList();
IntList Gbin = new IntList();
IntList Obin = new IntList();
//Hexadecimal values
IntList Bhex = new IntList();
IntList Ihex = new IntList();
IntList Nhex = new IntList();
IntList Ghex = new IntList();
IntList Ohex = new IntList();
//Octal values
IntList Boct = new IntList();
IntList Ioct = new IntList();
IntList Noct = new IntList();
IntList Goct = new IntList();
IntList Ooct = new IntList();

boolean middle = true;
boolean binaryConverted = false;
boolean hexaConverted = false;
boolean octalConverted = false;
boolean pdfRecord = false;
boolean pdfCollate = false;

int cards = 1;

/*
Setup the main window to be 600 by 600 pixels.
*/
void settings () {
  size(600, 600);
}
/*
Create a new window for Settings.
Populate the data structures with random numbers.
*/

void setup () {
  //Create Settings window
  String[] args = {"Settings"};
  SettingsWindow sa = new SettingsWindow();
  PApplet.runSketch(args, sa);
  surface.setTitle("Number Systems Bingo");
  font = createFont("SansSerif.bold", 32);
  def = createFont("Tahoma", 32);
  //Decimals
  for (int x = 0; x != 15; B.append(++x)) {
    B.shuffle();
  }
  for (int x = 15; x != 30; I.append(++x)) {
    I.shuffle();
  }
  for (int x = 30; x != 45; N.append(++x)) {
    N.shuffle();
  }
  for (int x = 45; x != 60; G.append(++x)) {
    G.shuffle();
  }
  for (int x = 60; x != 75; O.append(++x)) {
    O.shuffle();
  }
  //Binary
    for (int x = 0; x != 10; Bbin.append(++x)) {
    Bbin.shuffle();
  }
  for (int x = 10; x != 20; Ibin.append(++x)) {
    Ibin.shuffle();
  }
  for (int x = 20; x != 30; Nbin.append(++x)) {
    Nbin.shuffle();
  }
  for (int x = 30; x != 40; Gbin.append(++x)) {
    Gbin.shuffle();
  }
  for (int x = 40; x != 50; Obin.append(++x)) {
    Obin.shuffle();
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
  for (int x = 120; x != 150; Ooct.append(++x)) {
    Ooct.shuffle();
  }
}
/*
Template for a blank bingo card.
*/
void bingoCard() {
  int grid_x = 100;
  while (grid_x < 580) {
    line(grid_x, 100, grid_x, 500);
    grid_x += 80;
  }
  int grid_y = 100;
  while (grid_y < 580) {
    line(100, grid_y, 500, grid_y);
    grid_y += 80;
  }
}
/*
(Only to be used by developers to check the X,Y coordinates of the mouse).
*/
void debug() {
  fill(0);
  textSize(12);
  text("X, Y: " + mouseX + " " + mouseY, 40, 12);
}
/*
Free square in the middle. Easy to enable/disable.
*/
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
/*
Randomize function to randomize (regenerate) the numbers.
Since we already populated the lists with the specified values, we can simply shuffle them
to get a random sequence every time.
*/
void regen() {
  //shuffle the IntLists
  B.shuffle();
  I.shuffle();
  N.shuffle();
  G.shuffle();
  O.shuffle();
  //shuffle the IntLists
  Bbin.shuffle();
  Ibin.shuffle();
  Nbin.shuffle();
  Gbin.shuffle();
  Obin.shuffle();
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
/*
if the octal function is selected, it will display octalConvert().
This is an almost identical copy of the draw() but it changes the decimal to octal.
*/
void octalConvert() {
  if (octalConverted) {
    background(255);
    bingoCard();
    textFont(font);
    text("Octal Bingo", 300, 25);
    textFont(def);
    int bingoOffset = 140;
    for (int i = 0; i < 5; i++) {
      textSize(32);
      textAlign(CENTER);
      text("B", bingoOffset, 85);
      bingoOffset += 80;
      text("I", bingoOffset, 85);
      bingoOffset += 80;
      text("N", bingoOffset, 85);
      bingoOffset += 80;
      text("G", bingoOffset, 85);
      bingoOffset += 80;
      text("O", bingoOffset, 85);
      bingoOffset += 150;
    }
    int textY = 150;
    textSize(32);
    for (int i = 0; i < 5; i++) {
      text(Integer.toOctalString(Boct.get(i)), 140, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Integer.toOctalString(Ioct.get(j)), 220, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Integer.toOctalString(Noct.get(j)), 300, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Integer.toOctalString(Goct.get(j)), 380, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(Integer.toOctalString(Ooct.get(j)), 460, textY);
      textY += 80;
    }
    free(); //Add "FREE" tile in the centre.
  }
}
/*
if the hexadecimal function is selected, it will display hexaConvert().
This is an almost identical copy of the draw() but it changes the decimal to hexadecimal.
*/
void hexaConvert() {
  if (hexaConverted) {
    background(255);
    bingoCard();
    textFont(font);
    text("Hexadecimal Bingo", width/2, 25);
    textFont(def);
    int bingoOffset = 140;
    for (int i = 0; i < 5; i++) {
      textSize(32);
      textAlign(CENTER);
      text("B", bingoOffset, 85);
      bingoOffset += 80;
      text("I", bingoOffset, 85);
      bingoOffset += 80;
      text("N", bingoOffset, 85);
      bingoOffset += 80;
      text("G", bingoOffset, 85);
      bingoOffset += 80;
      text("O", bingoOffset, 85);
      bingoOffset += 150;
    }
    int textY = 150;
    textSize(32);
    for (int i = 0; i < 5; i++) {
      text(hex((byte) Bhex.get(i)), 140, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(hex((byte) Ihex.get(j)), 220, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(hex((byte) Nhex.get(j)), 300, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(hex((byte) Ghex.get(j)), 380, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(hex((byte) Ohex.get(j)), 460, textY);
      textY += 80;
    }

    free(); //Add "FREE" tile in the centre.
  }
}
/*
if the binary function is selected, it will display binaryConvert().
This is an almost identical copy of the draw() but it changes the decimal to binary.
*/
void binaryConvert() {
  if (binaryConverted) {
    background(255);
    bingoCard();
    textFont(font);
    text("Binary Bingo", width/2, 25);
    textFont(def);
    int bingoOffset = 140;
    for (int i = 0; i < 5; i++) {
      textSize(32);
      textAlign(CENTER);
      text("B", bingoOffset, 85);
      bingoOffset += 80;
      text("I", bingoOffset, 85);
      bingoOffset += 80;
      text("N", bingoOffset, 85);
      bingoOffset += 80;
      text("G", bingoOffset, 85);
      bingoOffset += 80;
      text("O", bingoOffset, 85);
      bingoOffset += 150;
    }
    int textY = 150;
    textSize(24);
    for (int i = 0; i < 5; i++) {
      text(binary(Bbin.get(i), 6), 140, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(binary(Ibin.get(j), 6), 220, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(binary(Nbin.get(j), 6), 300, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(binary(Gbin.get(j), 6), 380, textY);
      textY += 80;
    }
    textY = 150;
    for (int j = 0; j < 5; j++) {
      text(binary(Obin.get(j), 6), 460, textY);
      textY += 80;
    }

    free(); //Add "FREE" tile in the centre.
  }
}
/*
The draw function. We initialize all of the functions above in here
and simply use booleans to toggle each one on/off.
*/
void draw () {
  background(255);
  bingoCard();
  //debug();
  textSize(32);
  textFont(font);
  fill(0);
  text("Decimal Bingo", width/2, 25);
  textFont(def);
  int bingoOffset = 140;
    for (int i = 0; i < 5; i++) {
      textSize(32);
      textAlign(CENTER);
      text("B", bingoOffset, 85);
      bingoOffset += 80;
      text("I", bingoOffset, 85);
      bingoOffset += 80;
      text("N", bingoOffset, 85);
      bingoOffset += 80;
      text("G", bingoOffset, 85);
      bingoOffset += 80;
      text("O", bingoOffset, 85);
      bingoOffset += 150;
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

  //Add option to output to .PDF
  if (pdfRecord) {
    save("G:/Documents/BingoCards/" + cards + ".png");
  }
  /*
  Allows to collate multiple .PNG files from pdfRecord
  to a single PDF file.
  */
  if (pdfCollate) {
    pdf = (PGraphicsPDF)beginRecord(PDF, "G:/Documents/BingoCards/cards.pdf");
    for (int i = 1; i <= cards; i++) {
      PImage recap = loadImage("G:/Documents/BingoCards/" + i + ".png");
      image(recap, 0, 0, 600, 600);
      if (i != cards) {
        pdf.nextPage();
      }
    }
    endRecord();
  }
}
