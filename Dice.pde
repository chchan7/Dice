int total; 
int size;

void setup() {
  size(600, 600);
  noLoop(); 
}

void draw() {
  background((int)(Math.random() * 256),(int)(Math.random() * 256),(int)(Math.random() * 256));
  total = 0;
  size = 60;


  for (int a = 0; a < 5; a++) {
    for (int b = 0; b < 5; b++) {
      int x = 50 + b * 100;
      int y = 50 + a * 100;

      // die instances
      Die bob = new Die(x, y);
      bob.roll();
      bob.show();

      total += bob.score;
    }
  }

  // display total
  fill(0);
  textSize(24);
  text("Total: " + total, 50, height - 30);
}

void mousePressed() {
  redraw();
}


class Die {
  int myX, myY;   // position
  int score;  // number rolled

  Die(int x, int y) {
    myX = x;
    myY = y;
    roll();  // initial roll
  }

  void roll() {
    score = (int)(Math.random() * 6) + 1; // random 1–6
  }

  void show() {
    // draw die face
    fill((int)(Math.random() * 256),(int)(Math.random() * 256),(int)(Math.random() * 256));
    rect(myX, myY, size, size);
    fill(0);

    int radius = size / 8;   // dot radius
    int offset = size / 4;

    // dot positions
    int centerX = myX + size / 2;
    int centerY = myY + size / 2;
    int left = myX + offset;
    int right = myX + size - offset;
    int top = myY + offset;
    int bottom = myY + size - offset;

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






