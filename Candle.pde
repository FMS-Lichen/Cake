//蝋燭を描画するためのクラス
class Candle {
  boolean fire;
  color c;
  Candle(color _c) {
    fire=true;
    c=_c;
  }
  void draw() {
    pillar(70, 3, 3, c, c);
    if (fire) {
      fill(255, 165, 0, 191);
      pushMatrix();
      translate(0, -35, 0);
      beginShape();
      vertex(-5, -5);
      vertex(-4, -1);
      vertex(0, 0);
      vertex(4, -1);
      vertex(5, -5);
      vertex((int)random(-5, 5), -20-(int)random(-5, 5));
      endShape();
      popMatrix();
    }
  }
}