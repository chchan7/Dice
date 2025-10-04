int total = 0; 
int dsize = 60;

void setup() {
  size(2000, 2000);
  noLoop(); 
}

void draw() {
  background((int)(Math.random() * 256),(int)(Math.random() * 256),(int)(Math.random() * 256));


  for (int a = 0; a < 20; a++) {
    for (int b = 0; b < 20; b++) {
      int x = 50 + b * 100;
      int y = 50 + a * 100;

     
      Die bob = new Die(x, y);
      bob.roll();
      bob.show();

      total += bob.score;
    }
  }


  fill(0);
  textSize(24);
  text("Sum: " + total, 50, height - 30);
  text("get 1 mil if ur cool, width - 1000, height - 30)
}

void mousePressed() {
  redraw();
}


class Die {
  int myX, myY;  
  int score;  

  Die(int x, int y) {
    myX = x;
    myY = y;
    roll();  
  }

  void roll() {
    score = (int)(Math.random() * 6) + 1; // random 1–6
  }

  void show() {
   
    fill((int)(Math.random() * 256),(int)(Math.random() * 256),(int)(Math.random() * 256));
    rect(myX, myY, dsize, dsize);
    fill(0);

    int radius = dsize / 8;   // dot radius
    int offset = dsize / 4;

  
    int centerX = myX + dsize / 2;
    int centerY = myY + dsize / 2;
    int left = myX + offset;
    int right = myX + dsize - offset;
    int top = myY + offset;
    int bottom = myY + dsize - offset;

    // draw dots based on value
    if (score == 1 || score == 3 || score == 5) {
      ellipse(centerX, centerY, radius, radius);
    }
    if (score >= 2) {
      ellipse(left, top, radius, radius);
      ellipse(right, bottom, radius, radius);
    }
    if (score >= 4) {
      ellipse(right, top, radius, radius);
      ellipse(left, bottom, radius, radius);
    }
    if (score == 6) {
      ellipse(left, centerY, radius, radius);
      ellipse(right, centerY, radius, radius);
    }
  }
}




