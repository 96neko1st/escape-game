class Field {

  PVector heroPos = new PVector(width/2, height/2); // hero of position
  PVector backPos = new PVector(width/2, height/2); // back of position
  PVector screen_dv = new PVector(0, 0);
  PImage heroImg, foodImg, enemyImg, oceanImg, esaImg;
  int food_eat_count,esa_eat_count;

  Field() {
    heroImg = loadImage("./data/hero.png");
    foodImg = loadImage("./data/food.png");
    oceanImg = loadImage("./data/ocean.jpg");
    enemyImg = loadImage("./data/same.png");
    esaImg = loadImage("./data/esa.png");

    for (int i=0; i<40; i++) {
      fd.add(new Food(random(-400, 1200), random(-400, 1200)));
      esa.add(new Esa(random(-400, 1200), random(-400, 1200)));
    }

    e.add(new Enemy(-400, -400));
    e.add(new Enemy(1200, 1200));
    e.add(new Enemy(-400, 1200));
    e.add(new Enemy(1200, -400));
  }


  void display() {
    background(255, 255, 255);
    image(oceanImg, backPos.x, backPos.y, 2400, 2400);
    drawImg(screen_dv.x);
    for (int i=0; i<e.size(); i++) {
      e.get(i).activity();
    }

    for (int i = 0; i < fd.size(); i++) {
      fd.get(i).activity();
    }

    for (int i =0; i< esa.size(); i++) {
      esa.get(i).activity();
    }
  }

  public void drawImg(float vx) {
    if (vx < 0) {
      scale(-1, 1);
      image(heroImg, -heroPos.x, heroPos.y, 100+food_eat_count, 100+food_eat_count);
      scale(-1, 1);
    } else {
      image(heroImg, heroPos.x, heroPos.y, 100+food_eat_count, 100+food_eat_count);
    }
  }

  public void screenMove() {
    screen_dv = new PVector(mouseX-f.heroPos.x, mouseY-f.heroPos.y);
    screen_dv.normalize();
    screen_dv.x *= 6;
    screen_dv.y *= 6;
    backPos.x -=screen_dv.x;
    backPos.y -=screen_dv.y;

    if (backPos.x < -400) {
      backPos.x = -400;
      screen_dv.x *= 0;
    } else if (backPos.x > width+400) {
      backPos.x = width+400;
      screen_dv.x *= 0;
    }

    if (backPos.y < -400) {
      backPos.y = -400;
      screen_dv.y *= 0;
    } else if (backPos.y > height+400) {
      backPos.y = height+400;
      screen_dv.y *= 0;
    }

    for (int i=0; i<fd.size(); i++) {
      fd.get(i).foodPos.x -=screen_dv.x;
      fd.get(i).foodPos.y -=screen_dv.y;
    }

    for (int i=0; i<esa.size(); i++) {
      esa.get(i).esaPos.x -=screen_dv.x;
      esa.get(i).esaPos.y -=screen_dv.y;
    }
  }
}