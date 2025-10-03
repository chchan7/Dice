int total; 
int size;

void setup() {
  size(600, 600);
  noLoop(); 
}

void draw() {
  background((int)(Math.random() * 256),(int)(Math.random() * 256),(int)(Math.random() * 256));
  total = 0;
  blockSize = 60;


  for (int a = 0; a < 5; a++) {
    for (int b = 0; b < 5; b++) {
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
  text("Total: " + total, 50, height - 30);
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
    score = (int)(Math.random() * 6) + 1; 
  }

  void show() {
    
    fill((int)(Math.random() * 256),(int)(Math.random() * 256),(int)(Math.random() * 256));
    rect(myX, myY, blockSize, blockSize);
    fill(0);

    int radius = blockSize / 8;   
    int offset = blockSize / 4;


    int centerX = myX + blockSize / 2;
    int centerY = myY + blockSize / 2;
    int left = myX + offset;
    int right = myX + blockSize - offset;
    int top = myY + offset;
    int bottom = myY + blockSize - offset;

  
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



