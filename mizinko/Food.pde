class Food {

  PVector foodPos;

  Food(float _x, float _y) {
    foodPos = new PVector(_x, _y);
  }

  public void activity() {
    image(f.foodImg, this.foodPos.x, this.foodPos.y, 40, 40);
    foodHitTest(f.heroPos.x, f.heroPos.y, f.backPos.x, f.backPos.y);
  }

  public void foodHitTest(float _heroPos_x, float _heroPos_y, float _backPos_x, float _backPos_y) {
    if (abs(_heroPos_x-this.foodPos.x) < 40 && abs(_heroPos_y-this.foodPos.y) < 40) {
      fd.remove(this);
      fd.add(new Food(random(-800+_backPos_x, _backPos_x+800), random(-800+_backPos_y, _backPos_y+800)));
      f.food_eat_count++;
    }
  }
}