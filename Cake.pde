import ddf.minim.*; //蝋燭の火を吹き消すためにMinimライブラリをインポート
Minim minim;
AudioInput in;
float vol;
Candle[] c=new Candle[8];
void setup() {
  size(400, 400, P3D);
  minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO, 512);
  vol=0;
  noStroke();
  for (int i=0; i<8; i++) {
    colorMode(HSB);
    c[i]=new Candle(color(255*i/8, 255, 255)); //蝋燭の色をカラフルにしたかったので、ここだけカラーモードを変更した
    colorMode(RGB);
  }
}
void draw() {
  lights();
  background(0);
  camera(200, 100, 300, 
    200, 200, 0, 
    0, 1, 0);
  translate(width/2, height/2, 0);

  //ケーキ本体の描画
  pushMatrix();
  translate(0, 15, 0);
  pillar(30, 120, 120, color(255), color(255, 239, 191));
  popMatrix();
  pushMatrix();
  translate(0, 45, 0);
  pillar(30, 120, 120, color(255), color(255));
  popMatrix();
  pushMatrix();
  translate(0, 75, 0);
  pillar(30, 120, 120, color(255), color(255, 239, 191));
  popMatrix();

  //飾りのクリームの描画
  for (int i=0; i<32; i++) {
    pushMatrix();
    translate(110*cos(i*TWO_PI/32), -5, 110*sin(i*TWO_PI/32));
    fill(255);
    sphere(10);
    popMatrix();
  }

  //中のいちごの描画
  for (int i=0; i<16; i++) {
    pushMatrix();
    translate(120*cos(i*TWO_PI/16), 45, 120*sin(i*TWO_PI/16));
    rotateY(-i*TWO_PI/16);
    fill(255, 0, 0);
    box(1, 10, 20);
    popMatrix();
  }

  //上面のいちごと蝋燭の描画
  for (int i=0; i<8; i++) {
    pushMatrix();
    translate(80*cos(i*TWO_PI/8+PI/8), 0, 80*sin(i*TWO_PI/8+PI/8));
    fill(255, 0, 0);
    sphere(10);
    popMatrix();
    pushMatrix();
    translate(60*cos(i*TWO_PI/8), -24, 60*sin(i*TWO_PI/8));
    c[i].draw();
    popMatrix();
    if (in.left.level()>random(0.7, 0.8))c[i].fire=false;
  }
}
void keyPressed() {
  if (key==' ') {
    for (int i=0; i<8; i++)c[i].fire=true;
  }
}
void stop() {
  in.close();
  minim.stop();
  super.stop();
}