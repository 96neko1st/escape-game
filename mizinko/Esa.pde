class Esa {

  PVector esaPos;

  Esa(float _x, float _y) {
    esaPos = new PVector(_x, _y);
  }

  public void activity() {
    image(f.esaImg, this.esaPos.x, this.esaPos.y, 40, 40);
    for (int i=0; i<e.size(); i++) {
      esaHitTest(e.get(i).samePos.x, e.get(i).samePos.y, f.backPos.x, f.backPos.y, i);
    }
  }

  public void esaHitTest(float _samePos_x, float _samePos_y, float _backPos_x, float _backPos_y, int number) {
    if (abs(_samePos_x-esaPos.x) < 40 && abs(_samePos_y-esaPos.y) < 40) {
      esa.remove(this);
      esa.add(new Esa(random(-800+_backPos_x, _backPos_x+800), random(-800+_backPos_y, _backPos_y+800)));
      e.get(number).sameWidth +=2;
      e.get(number).sameHeight +=2;
    }
  }
}