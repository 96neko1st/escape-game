Field f;
ArrayList<Esa> esa = new ArrayList<Esa>();
ArrayList<Enemy> e = new ArrayList<Enemy>();
ArrayList<Food> fd = new ArrayList<Food>();

void setup() {
  size(800, 800);
  imageMode(CENTER);
  f = new Field();
}

void draw() {
  
  f.display();
  f.screenMove();
}