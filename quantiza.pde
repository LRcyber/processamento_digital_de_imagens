PImage img;
PImage imo;
void setup() {
  size(400,400);
  int i, j;
  color c;
  float r, g, b, d;
  
  String fname = "Toyokawa";
  img = loadImage(fname+".jpg"); 
  PImage imo = createImage(400, 400, RGB);
  
  for (i=1; i<=400; i++) {
    for (j=1; j<=400; j++) {
        c = img.get(i,j);
        r = red(c);
        g = green(c);
        b = blue(c);
        //d = (255.0 - r)/2;
        if (r>0 && r<32){
        imo.set(i,j, color(16,16,16)); }
        if (r>32 && r<64){
        imo.set(i,j, color(48,48,48)); }  
        if (r>64 && r<96){
        imo.set(i,j, color(80,80,80)); }
        if (r>96 && r<128){
        imo.set(i,j, color(112,112,112)); }
        if (r>128 && r<160){
        imo.set(i,j, color(144,144,144)); }
        if (r>160 && r<192){
        imo.set(i,j, color(176,176,176)); }
        if (r>192 && r<224){
        imo.set(i,j, color(208,208,208)); }
        if (r>224 && r<255){
        imo.set(i,j, color(240,240,240)); }
    }        
  }
  imo.save(fname+"-quantizada.jpg");
  exit();
}
