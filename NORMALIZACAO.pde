PImage img;

void setup() {
  size(400, 400);
  img = loadImage("Toyokawa.jpg");
  image(img, 0, 0);
  filter(GRAY);
  PImage equalizedImg = equalizeHistogram(img);
  image(equalizedImg, 0, 0);
}

PImage equalizeHistogram(PImage img) {
  int[] histogram = new int[256];
  PImage newImg = createImage(img.width, img.height, RGB);

  // Compute histogram
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int pixel = img.get(x, y);
      int gray = (int) (0.299 * red(pixel) + 0.587 * green(pixel) + 0.114 * blue(pixel));
      histogram[gray]++;
    }
  }

  // Compute cumulative distribution function
  int sum = 0;
  int[] cdf = new int[256];
  for (int i = 0; i < 256; i++) {
    sum += histogram[i];
    cdf[i] = sum;
  }

  // Normalize cdf
  for (int i = 0; i < 256; i++) {
    cdf[i] = (int) map(cdf[i], 0, img.width * img.height, 0, 255);
  }

  // Compute equalized image
  newImg.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int pixel = img.get(x, y);
      int gray = (int) (0.299 * red(pixel) + 0.587 * green(pixel) + 0.114 * blue(pixel));
      int equalizedGray = cdf[gray];
      int newPixel = color(equalizedGray, equalizedGray, equalizedGray);
      newImg.set(x, y, newPixel);
    }
  }
  newImg.updatePixels();
  return newImg;
}
