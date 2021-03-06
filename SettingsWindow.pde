/*
SettingsWindow Class
Description: to serve as a window for various settings options that change the
display of the main window.
*/
boolean mouseRel; //mouseReleased
boolean mouseClick; //mouseClicked
public class SettingsWindow extends PApplet {
  public void settings() {
    size(600, 600);
  }
  public void setup() {
    surface.setTitle("Bingo Options"); //Changes the name of the window.
    mouseRel = false; //set mouseReleased to false on setup.
  }
  public void mouseReleased() {
    mouseRel = true; //set mouseReleased to true when mouse is released.
  }
  public void mousePressed() {
    mouseClick = true; //set mouseClick to true when mouse is pressed.
  }
  public void draw() {
    background(255);
    fill(255);
    rect(10, 185, 170, 20);//"REGENERATE" button
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
    rect(10, 340, 100, 50);
    rect(110, 340, 100, 50);
    rect(10, 340, 100, 50);
    fill(0);
    text("Create PDF", 15, 370); //Click on this option to collate all .PNGs to a single PDF.
    text("Make more\ncards", 120, 357); //Click on this option to generate a random card!
    text("Hexadecimal", 10, 230);
    text("Octal", 10, 290);
    /*
    Various if statements for options.
    The first few are to enable middle free square and toggle between the number systems.
    */
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
    /*
    set the relevant booleans to true/false when clicked on the respective buttons.
    */
    if (mouseClick && mouseButton == LEFT && mouseX >= 10 && mouseX <= 110 && mouseY >= 340 && mouseY <= 390) {
      rect(10, 340, 100, 50);
      pdfCollate = true;
      mouseClick = false;
    } else {
      pdfRecord = false;
      pdfCollate = false;
    }
    //The add more cards button.
    if (mouseClick && mouseButton == LEFT && mouseX >= 110 && mouseX <= 210 && mouseY >= 340 && mouseY <= 390) {
      rect(110, 340, 100, 50);
      pdfRecord = true;
      mouseClick = false;
      cards++;
      regen();
    } else {
      pdfRecord = false;
      pdfRecord = true;
    }
    if (mouseClick && mouseButton == LEFT && mouseX >= 10 && mouseX <= 180 && mouseY >= 185 && mouseY <= 205) {
      fill(0);
      rect(10, 185, 170, 20);
      mouseClick = false;
      regen();
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 10 && mouseX <= 60 && mouseY >= 140 && mouseY <= 160) {
      fill(0);
      rect(10, 140, 50, 20);
      binaryConverted = true;
      hexaConverted = false;
      octalConverted = false;
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
      binaryConverted = false;
      octalConverted = false;
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
      hexaConverted = false;
      binaryConverted = false;
    }
    if (mousePressed && mouseButton == LEFT && mouseX >= 90 && mouseX <= 140 && mouseY >= 295 && mouseY <= 315) {
      fill(0);
      rect(90, 295, 50, 20);
      octalConverted = false;
    }
    /*
    Highlight the selected buttons to indicate selection.
    */
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
  }
}
