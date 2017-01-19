//円柱を描画する関数がデフォルトでサポートされていない様だったので自作
void pillar(float len, float rad1, float rad2, color c1, color c2) {
  float x, y, z;
  fill(c1);
  beginShape(TRIANGLE_FAN);
  y = -len / 2;
  vertex(0, y, 0);
  for (int deg = 0; deg <= 360; deg = deg + 10) {
    x = cos(radians(deg)) * rad1;
    z = sin(radians(deg)) * rad1;
    vertex(x, y, z);
  }
  endShape();
  beginShape(TRIANGLE_FAN);
  y = len / 2;
  vertex(0, y, 0);
  for (int deg = 0; deg <= 360; deg = deg + 10) {
    x = cos(radians(deg)) * rad2;
    z = sin(radians(deg)) * rad2;
    vertex(x, y, z);
  }
  endShape();
  fill(c2);
  beginShape(TRIANGLE_STRIP);
  for (int deg =0; deg <= 360; deg = deg + 5) {
    x = cos(radians(deg)) * rad1;
    y = -len / 2;
    z = sin(radians(deg)) * rad1;
    vertex(x, y, z);
    x = cos(radians(deg)) * rad2;
    y = len / 2;
    z = sin(radians(deg)) * rad2;
    vertex(x, y, z);
  }
  endShape();
}