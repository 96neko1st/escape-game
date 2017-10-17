class Enemy {

  PVector samePos;
  PVector v = new PVector();
  int sameWidth = 100;
  int sameHeight = 100;
  int action_pattern=1;
  int count=0;

  Enemy(int _x, int _y) {
    this.samePos = new PVector(_x, _y);
  }

  public void activity() {
    fill(255, 0, 0, 100);
    ellipse(this.samePos.x, this.samePos.y, 600, 600);
    changePattern(f.heroPos.x, f.heroPos.y);
    switch(action_pattern) {
    case 0:
      trackingMove(f.heroPos.x, f.heroPos.y, f.screen_dv.x, f.screen_dv.y);
      break;
    case 1:
      this.count++;
      randomMove(f.screen_dv.x, f.screen_dv.y, f.backPos.x, f.backPos.y);
      break;
    }
  }

  public void drawImg(float vx) {
    if (vx > 0) {
      scale(-1, 1);
      image(f.enemyImg, -this.samePos.x, this.samePos.y, sameWidth, sameHeight);
      scale(-1, 1);
    } else {
      image(f.enemyImg, this.samePos.x, this.samePos.y, sameWidth, sameHeight);
    }
  }

  public void trackingMove(float _hero_x, float _hero_y, float _screen_mv_x, float _screen_mv_y) {
    PVector v = new PVector((_hero_x - this.samePos.x), (_hero_y-this.samePos.y));
    v.normalize();
    v.x *=4;
    v.y *=4;
    drawImg(v.x);
    this.samePos.x += v.x - _screen_mv_x;
    this.samePos.y += v.y - _screen_mv_y;
  }

  public void randomMove(float _screen_mv_x, float _screen_mv_y, float _backPos_x, float _backPos_y) {
    if (this.count % 30 == 0) {
      this.v = new PVector(random(-100, 100)-random(-100, 100), random(-100, 100)-random(-100, 100));
      this.v.normalize();
      this.v.x *=4;
      this.v.y *=4;
    }

    if (this.samePos.x > 800+_backPos_x) {
      this.v.x = -5;
    } else if (this.samePos.x < -800+_backPos_x) {
      this.v.x = 5;
    }

    if (this.samePos.y > 800+_backPos_y) {
      this.v.y = -5;
    } else if (this.samePos.y < -800+_backPos_y) {
      this.v.y = 5;
    }

    this.samePos.x += this.v.x - _screen_mv_x;
    this.samePos.y += this.v.y - _screen_mv_y;
    drawImg(v.x);
  }

  public void changePattern(float _hero_x, float _hero_y) {
    if (abs(_hero_x-samePos.x) < 300 && abs(_hero_y-samePos.y) < 300) {
      this.action_pattern = 0;
    } else {
      this.action_pattern = 1;
    }
  }
}