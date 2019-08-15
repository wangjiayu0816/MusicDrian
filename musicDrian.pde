import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jazz;
AudioPlayer pop;
AudioPlayer rock;
AudioPlayer elec;
AudioPlayer chinese;
FFT         fft1;
FFT         fft2;
FFT         fft3;
FFT         fft4;
FFT         fft5;
float r = 80;

void setup() {
  size(600, 600);
  minim = new Minim(this);
  jazz = minim.loadFile("jazz.mp3", 1024);
  //jazz.loop();
  pop = minim.loadFile("pop.mp3", 1024);
  //pop.loop();
  rock = minim.loadFile("rock.mp3", 1024);
  //rock.loop();
  elec = minim.loadFile("elec.mp3", 1024);
  //elec.loop();
  chinese = minim.loadFile("chinese.mp3", 1024);
  //chinese.loop();
  fft1 = new FFT( jazz.bufferSize(), jazz.sampleRate() );
  fft2 = new FFT( pop.bufferSize(), pop.sampleRate() );
  fft3 = new FFT( rock.bufferSize(), rock.sampleRate() );
  fft4 = new FFT( elec.bufferSize(), elec.sampleRate() );
  fft5 = new FFT( chinese.bufferSize(), chinese.sampleRate() );
  frameRate(10);
}

void draw() {
  background(155,155,155);
  textSize(20);
  fill(255, 255, 255);
  text("Press Key 1-5 to view different Music + Visual Style", 50, height/2); 

  switch(key) {
  case '1':
    // jazz
    fft1.forward( jazz.mix );
    jazz.play();
    pop.pause();
    rock.pause();
    elec.pause();
    chinese.pause();
    playJazz();
    break;
  case '2':
    // pop
    fft2.forward( pop.mix );
    pop.play();
    jazz.pause();
    rock.pause();
    elec.pause();
    chinese.pause();
    playPop();
    break;
  case '3':
    // rock
    fft3.forward( rock.mix );
    rock.play();
    jazz.pause();
    pop.pause();
    elec.pause();
    chinese.pause();
    playRock();
    break;
  case '4':
    // elec
    fft4.forward( elec.mix );
    elec.play();
    jazz.pause();
    pop.pause();
    rock.pause();
    chinese.pause();
    playElec();
    break;
  case '5':
    // chinese classical
    fft5.forward( chinese.mix );
    chinese.play();
    jazz.pause();
    pop.pause();
    rock.pause();
    elec.pause();
    playChinese();
    break;
  }
}

void playJazz() {

  background(255, 255, 255);
  fill(#E6CF3E);  // yellow   horizontial 
  noStroke();
  rect(0, height/5.0*2.0, width, height/50.0);
  rect(width/5.0*1.3, height/10.0, width, height/50.0);
  rect(0, height/5.0*3.3, width, height/50.0);
  rect(0, height/5.0*4.0, width, height/50.0);
  rect(0, height/5.0*0.3, width, height/50.0);
  rect(0, height/5.0*2.66, width, height/50.0);
  rect(0, height/5.0*0.04, width/5.0*3.67, height/50.0);
  rect(0, height/5.0*3.1, width, height/50.0);
  rect(0, height/5.0*4.7, width, height/50.0);

  fill(#E6CF3E);  // yellow   vertical
  noStroke();
  rect(width/5.0*1.53, height/5.0*0.50, width/50.0, height);
  rect(width/5.0*1.22, 0, width/50.0, height/5.0*4.17);
  rect(width/5.0*3.63, 0, width/50.0, height/5.0*4.10);
  rect(width/5.0*4.29, height/5.0*0.50, width/50.0, height);
  rect(width/5.0*4.48, height/5.0*0.33, width/50.0, height);
  rect(width/5.0*0.41, height/5.0*2.17, width/50.0, height);
  rect(width/5.0*0.67, 0, width/50.0, height);
  rect(width/5.0*2.40, height/5.0*0.13, width/50.0, height/5.0*4.0);

  fill(#456AB7);  // blue
  noStroke();
  // cannot move
  rect(width/5.0*2.50, height/5.0*0.40, width/5.0*1.13, height/50.0);
  // 4th column
  rect(width/5.0*1.53, height/5.0*(2.20+fft1.getBand(fft1.specSize())*0.3), width/50.0, height/5.0*0.14);
  rect(width/5.0*1.53, height/5.0*(3.11-fft1.getBand(fft1.specSize())*0.3), width/50.0, -15);
  rect(width/5.0*1.53, height/5.0*(4.19-fft1.getBand(fft1.specSize())*0.2), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(1.50-fft1.getBand(fft1.specSize())*0.3), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(1.95-fft1.getBand(fft1.specSize())*0.2), width/50.0, -17);

  //cannot change
  rect(width/5.0*3.63, height/5.0*0.15, width, height/5.0*0.16);

  // 6th column
  rect(width/5.0*3.63, height/8.06*(0.54-fft1.getBand(fft1.specSize())*0.400), width/50.0, height/5.0*0.16);
  rect(width/5.0*3.63, height/5.0*(2.24-fft1.getBand(fft1.specSize())*0.400), width/50.0, height/5.0*0.14);
  rect(width/5.0*3.63, height/5.0*(1.23-fft1.getBand(fft1.specSize())*0.400), width/50.0, height/5.0*0.12);
  rect(width/5.0*3.63, height/5.0*(3.19-fft1.getBand(fft1.specSize())*0.400), width/50.0, height/5.0*-0.10);


  rect(width/5.0*0.41, height/1.0*2.70, width/50.0, height/50.0);
  rect(width/5.0*0.41, height/5.0*2.66, width/50.0, height/50.0);


  rect(width/5.0*2.40, height/5.0*0.75, width/50.0, height/5.0*0.28);
  rect(width/5.0*2.50, height/5.0*2.66, width/5.0*0.45, height/50.0);
  //4th row
  rect(width/5.0*(2.12+fft1.getBand(fft1.specSize())*0.4), height/5.0*2.00, width/5.0*0.250, height/50.0);
  rect(width/5.0*(4.00-fft1.getBand(fft1.specSize())*0.4), height/5.0*2.00, width/5.0*0.2, height/50.0);
  rect(width/5.0*(0.10-fft1.getBand(fft1.specSize())*0.4), height/5.0*2.00, width/5.0*0.2, height/50.0);


  rect(width/5.0*2.28, height/5.0*2.00, width/5.0*0.05, height/50.0);
  rect(width/5.0*0.83, height/5.0*3.10, width/5.0*0.05, height/50.0);
  rect(width/5.0*(0.06+fft1.getBand(fft1.specSize())*0.9), height/5.0*3.10, width/5.0*0.24, height/50.0);
  rect(width/5.0*(1.44+fft1.getBand(fft1.specSize())*0.5), height/5.0*3.10, width/5.0*0.73, height/50.0);
  rect(width/5.0*3.82, height/5.0*3.10, width/5.0*0.04, height/50.0);


  fill(#AF3C30);  // red
  noStroke();
  rect(width/5.0*0.51, height/5.0*4.16, width/5.0*1.02, height/5.0*0.54);//pink
  // 4th row
  rect(width/5.0*(1.43-fft1.getBand(fft1.specSize())*0.58), height/5.0*2.00, width/5.0*0.16, height/50.0);
  rect(width/5.0*(4.29+fft1.getBand(fft1.specSize())*0.56), height/5.0*2.00, width/5.0*0.29, height/50.0);
  rect(width/5.0*(2.87-fft1.getBand(fft1.specSize())*0.8), height/5.0*2.00, width/5.0*0.23, height/50.0);
  rect(width/5.0*(0.67-fft1.getBand(fft1.specSize())*0.48), height/5.0*2.00, width/5.0*0.10, height/50.0);

  // 4th column
  rect(width/5.0*1.53, height/5.0*(1.0+fft1.getBand(fft1.specSize())*0.6), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(4.71-fft1.getBand(fft1.specSize())*-0.7), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(2.96-fft1.getBand(fft1.specSize())*0.9), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(3.32-fft1.getBand(fft1.specSize())*-1.1), width/50.0, -17);


  rect(width/5.0*1.47, 0, width/5.0*1.30, height/5.0*0.14);

  rect(width/5.0*1.81, height/5.0*4.70, width/5.0*0.81, height/5.0*0.70);

  rect(width/5.0*4.29, height/5.0*0.50, width/5.0*0.10, height/50.0);

  rect(width/5.0*(4.67-fft1.getBand(fft1.specSize())*0.4), height/5.0*3.30, width/5.0*0.21, height/50.0);

  //6th column
  rect(width/5.0*3.63, height/2.76*(1-fft1.getBand(fft1.specSize())*0.825), width/50.0, height/5.0*0.16);
  rect(width/5.0*3.63, height/5.0*(2.64-fft1.getBand(fft1.specSize())*1.085), width/50.0, height/5.0*-0.19);
  rect(width/5.0*3.63, height/5.0*(3.14-fft1.getBand(fft1.specSize())*-0.933), width/50.0, height/5.0*0.11);
  rect(width/5.0*3.63, height/5.0*(3.89-fft1.getBand(fft1.specSize())*0.788), width/50.0, height/5.0*0.20);


  rect(width/5.0*1.22, height/5.0*1.19, width/50.0, height/5.0*0.24);
  rect(width/5.0*4.48, height/5.0*(4.23-fft1.getBand(fft1.specSize())*0.4), width/50.0, height/5.0*0.28);
  rect(width/5.0*2.40, height/5.0*(3.39-fft1.getBand(fft1.specSize())*1.0), width/50.0, height/5.0*0.30);
  rect(width/5.0*2.40, height/5.0*1.12, width/50.0, 0);

  fill(#DAD8D4);  // gray
  noStroke();
  rect(width/5.0*3.20, height/5.0*4.40, width/5.0*1.00, height/5.0*1.15);//green
  // 4th row
  rect(width/5.0*(2.50-fft1.getBand(fft1.specSize())*0.2), height/5.0*2.00, width/5.0*0.15, height/50.0);
  rect(width/5.0*(1.72-fft1.getBand(fft1.specSize())*0.3), height/5.0*2.00, width/5.0*0.2, height/50.0);
  rect(width/5.0*(4.66-fft1.getBand(fft1.specSize())*0.1), height/5.0*2.00, width/5.0*0.2, height/50.0);

  //4th column
  rect(width/5.0*1.53, height/5.0*(0.87-fft1.getBand(fft1.specSize())*0.1), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(2.57-fft1.getBand(fft1.specSize())*-0.2), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(4.42-fft1.getBand(fft1.specSize())*0.1), width/50.0, -17);

  //6th column
  rect(width/5.0*3.63, height/5.00*(0.60-fft1.getBand(fft1.specSize())*0.131), width/50.0, height/5.0*0.16);
  rect(width/5.0*3.63, height/5.0*(3.48-fft1.getBand(fft1.specSize())*0.042), width/50.0, height/5.0*0.18);
  rect(width/5.0*3.63, height/5.0*(2.78-fft1.getBand(fft1.specSize())*0.097), width/50.0, height/5.0*0.24);
  rect(width/5.0*3.63, height/5.0*(1.01-fft1.getBand(fft1.specSize())*0.110), width/50.0, height/5.0*0.10);
}

void playPop() {
  background(#c8e1ae);

  fill(#92b452);  // yellow   horizontial 
  noStroke();
  rect(0, height/5.0*1.9, width, height/29.6);
  rect(width/5.0*1.3, height/3.1, width, height/58);
  rect(0, height/5.0*4.3, width, height/38.5);
  rect(0, height/5.0*4.0, width, height/28.8);
  rect(0, height/5.0*4.5, width, height/36.7);
  rect(0, height/5.0*2.66, width, height/36.5);
  rect(0, height/5.0*1.11, width/5.0*3.67, height/33.7);
  rect(0, height/5.0*3.1, width, height/40.7);
  rect(0, height/5.0*4.7, width, height/41.7);

  fill(#6d5022);  // yellow   vertical
  noStroke();
  rect(width/5.0*1.66, height/8.3*-0.82, width/10.1, height);
  rect(width/5.0*1.11, -129, width/27.2, height/5.0*4.17);
  rect(width/5.0*3.61, -21, width/8.1, height/5.0*4.67);
  rect(width/5.0*2.92, height/5.0*-0.27, width/12.5, height);
  rect(width/5.0*4.48, height/5.0*0.33, width/15.0, height);
  rect(width/5.0*-2.75, height/5.0*2.17, width/15.0, height);
  rect(width/5.0*0.41, 0, width/7.6, height);
  rect(width/5.3*2.56, height/5.0*0.01, width/15.0, height/5.0*4.0);

  fill(#d0db83);  // blue
  noStroke();
  // cannot move
  rect(width/5.0*2.67, height/5.0*0.41, width/5.0*1.13, height/50.0);
  // 4th column


  //cannot change
  rect(width/5.0*3.63, height/5.0*0.07, width, height/5.0*0.16);
  fill(#57793f);  // yellow
  rect(width/5.0*0.41, height/1.0*2.59, width/50.0, height/50.0);
  rect(width/5.0*0.50, height/5.0*2.24, width/50.0, height/50.0);
  rect(width/5.0*2.45, height/5.0*0.88, width/50.0, height/5.0*0.28);
  rect(width/5.0*2.53, height/5.0*2.71, width/5.0*0.17, height/50.0);

  rect(width/5.0*1.78, height/5.0*2.09, width/5.0*0.05, height/50.0);
  rect(width/5.0*0.83, height/5.0*3.11, width/5.0*0.05, height/50.0);
  rect(width/5.0*3.88, height/5.0*3.06, width/5.0*0.04, height/50.0);
  rect(width/5.0*1.22, height/5.0*1.19, width/50.0, height/5.0*0.24);
  rect(width/5.0*2.40, height/5.0*1.12, width/50.0, 0);
  rect(width/5.0*4.29, height/5.0*0.50, width/5.0*0.10, height/50.0);
  fill(#65af5a);  // red
  noStroke();
  rect(width/5.0*0.52, height/5.0*4.46, width/5.0*1.02, height/5.0*0.54);//pink
  rect(width/5.0*1.47, 0, width/5.0*1.30, height/5.0*0.14);
  rect(width/5.0*1.81, height/5.0*4.67, width/5.0*0.81, height/5.0*0.70);
  fill(#7cc5fa, 90);  // gray
  noStroke();
  rect(width/5.0*0.24, height/5.0*0.3, width/5.0*1.00, height/5.0*0.15);//green
  rect(width/5.0*2.44, height/5.0*0.2, width/5.0*5.00, height/5.0*0.55);
  rect(width/5.0*1.29, height/5.0*0.1, width/5.0*1.00, height/5.0*0.25);
  //all shining
  fill(#6a8451);  // yellow
  rect(width/5.0*4.05, height/8.06*(0.54-fft2.getBand(fft2.specSize())*0.400), width/50.0, height/5.0*0.16);
  rect(width/5.0*4.01, height/5.0*(2.24-fft2.getBand(fft2.specSize())*0.400), width/50.0, height/5.0*0.14);
  rect(width/5.0*3.64, height/5.0*(1.23-fft2.getBand(fft2.specSize())*0.400), width/50.0, height/5.0*0.12);
  rect(width/5.0*4.00, height/5.0*(3.19-fft2.getBand(fft2.specSize())*0.400), width/50.0, height/5.0*-0.10);
  rect(width/2.6, height/5.0*(3.19-fft2.getBand(fft2.specSize())*0.534), width/5.0*0.21, height/50.0);
  fill(#6ab160);  // brown
  rect(width/5.0*4.01, height/2.76*(1-fft2.getBand(fft2.specSize())*0.825), width/50.0, height/5.0*0.16);
  rect(width/5.0*3.66, height/5.0*(2.64-fft2.getBand(fft2.specSize())*1.085), width/50.0, height/5.0*-0.19);
  rect(width/5.0*3.92, height/5.0*(3.14-fft2.getBand(fft2.specSize())*-0.933), width/50.0, height/5.0*0.11);
  rect(width/5.0*3.73, height/5.0*(3.89-fft2.getBand(fft2.specSize())*0.788), width/50.0, height/5.0*0.20);
  rect(width/6.3*(2.50-fft2.getBand(fft2.specSize())*0.2), height/5.0*1.37, width/5.0*0.15, height/50.0);
  rect(width/15.5*(1.72-fft2.getBand(fft2.specSize())*0.3), height/5.0*3.32, width/5.0*0.2, height/50.0);
  rect(width/21.1*(4.68-fft2.getBand(fft2.specSize())*0.1), height/5.0*2.08, width/5.0*0.2, height/50.0);
  rect(width/5.0*0.94, height/5.0*(0.87-fft2.getBand(fft2.specSize())*0.1), width/50.0, -17);
  rect(width/5.0*1.39, height/5.0*(2.57-fft2.getBand(fft2.specSize())*-0.2), width/50.0, -17);
  rect(width/5.0*0.60, height/5.0*(4.42-fft2.getBand(fft2.specSize())*0.1), width/50.0, -17);
  rect(width/5.0*2.04, height/5.0*(2.20+fft2.getBand(fft2.specSize())*0.3), width/50.0, height/5.0*0.14);
  rect(width/5.0*1.13, height/5.0*(3.11-fft2.getBand(fft2.specSize())*0.3), width/50.0, -15);
  rect(width/5.0*2.99, height/5.0*(4.19-fft2.getBand(fft2.specSize())*0.2), width/50.0, -17);
  fill(#bedba2);  // white
  rect(width/5.0*0.52, height/5.0*(1.50-fft2.getBand(fft2.specSize())*0.3), width/50.0, -17);
  rect(width/5.0*2.97, height/5.0*(1.95-fft2.getBand(fft2.specSize())*0.2), width/50.0, -17);
  rect(width/5.0*2.66, height/5.00*(0.60-fft2.getBand(fft2.specSize())*0.131), width/50.0, height/5.0*0.16);
  rect(width/5.0*4.65, height/5.0*(3.48-fft2.getBand(fft2.specSize())*0.042), width/50.0, height/5.0*0.18);
  rect(width/5.0*1.87, height/5.0*(2.78-fft2.getBand(fft2.specSize())*0.097), width/50.0, height/5.0*0.24);
  rect(width/5.0*4.63, height/5.0*(1.01-fft2.getBand(fft2.specSize())*0.110), width/50.0, height/5.0*0.10);
}
void playRock() {
  background(#ee8e38);
  fill(#733734);  // yellow   horizontial 
  noStroke();
  rect(0, height/5.0*2.0, width, height/50.0);
  rect(width/5.0*1.3, height/10.0, width, height/50.0);
  rect(0, height/5.0*3.3, width, height/50.0);
  rect(0, height/5.0*4.0, width, height/50.0);
  rect(0, height/5.0*0.3, width, height/50.0);
  rect(0, height/5.0*2.66, width, height/50.0);
  rect(0, height/5.0*0.04, width/5.0*3.67, height/50.0);
  rect(0, height/5.0*3.1, width, height/50.0);
  rect(0, height/5.0*4.7, width, height/50.0);

  fill(#733734);  // yellow   vertical
  noStroke();
  rect(width/5.0*1.53, height/5.0*0.50, width/50.0, height);
  rect(width/5.0*1.22, 0, width/50.0, height/5.0*4.17);
  rect(width/5.0*3.63, 0, width/50.0, height/5.0*4.10);
  rect(width/5.0*4.29, height/5.0*0.50, width/50.0, height);
  rect(width/5.0*4.48, height/5.0*0.33, width/50.0, height);
  rect(width/5.0*0.41, height/5.0*2.17, width/50.0, height);
  rect(width/5.0*0.67, 0, width/50.0, height);
  rect(width/5.0*2.40, height/5.0*0.13, width/50.0, height/5.0*4.0);

  fill(#f2da4e);  // blue
  noStroke();
  // cannot move
  //rect(width/5.0*2.50, height/5.0*0.40, width/5.0*1.13, height/50.0);
  // group 1
  rect(width/5.0*2.67, height/14.0*(2.20+fft3.getBand(fft3.specSize())*6.6), r, r);
  rect(width/5.0*2.32, height/5.0*(3.11-fft3.getBand(fft3.specSize())*9.1), r, r);
  rect(width/5.0*1.99, height/7.1*(1.95-fft3.getBand(fft3.specSize())*7.6), r, r);
  // group 2
  fill(#cd4449);
  rect(width/5.0*0.31, height/8.06*(0.54-fft3.getBand(fft3.specSize())*17.6), r, r);
  rect(width/5.0*0.74, height/10.2*(2.24-fft3.getBand(fft3.specSize())*8.7), r, r);
  //group 3
  fill(#d76d7d);  // red
  noStroke();
  rect(width/5.0*(2.12+fft3.getBand(fft3.specSize())*15.4), height/5.0*3.93, r, r);
  rect(width/5.0*(4.00-fft3.getBand(fft3.specSize())*7.4), height/5.0*0.52, r, r);
  rect(width/5.0*(0.10-fft3.getBand(fft3.specSize())*14.4), height/5.0*2.32, r, r);
  //group 4
  fill(#d66931);  // red
  noStroke();
  rect(width/3.4*(0.40+fft3.getBand(fft3.specSize())*8.9), height/5.0*3.57, r, r);
  rect(width/2.0*(1.44+fft3.getBand(fft3.specSize())*21.5), height/5.0*3.39, r, r);
  rect(width/2.1*(1.43-fft3.getBand(fft3.specSize())*18.5), height/5.0*2.19, r, r);
}

void playElec() {
  background(255, 255, 255);
  fill(#50a5db);  // light blue   horizontial 
  noStroke();
  rect(0, height/5.0*2.0, width, height/50.0);
  rect(width/5.0*1.3, height/10.0, width, height/50.0);
  rect(0, height/5.0*3.3, width, height/50.0);
  rect(0, height/5.0*4.0, width, height/50.0);
  rect(0, height/5.0*0.3, width, height/50.0);
  rect(0, height/5.0*2.66, width, height/50.0);
  rect(0, height/5.0*0.04, width/5.0*3.67, height/50.0);
  rect(0, height/5.0*3.1, width, height/50.0);
  rect(0, height/5.0*4.7, width, height/50.0);

  fill(#83c2c1);  // yellow   vertical
  noStroke();
  rect(width/5.0*1.53, height/5.0*0.50, width/50.0, height);
  rect(width/5.0*1.22, 0, width/50.0, height/5.0*4.17);
  rect(width/5.0*3.63, 0, width/50.0, height/5.0*4.10);
  rect(width/5.0*4.29, height/5.0*0.50, width/50.0, height);
  rect(width/5.0*4.48, height/5.0*0.33, width/50.0, height);
  rect(width/5.0*0.41, height/5.0*2.17, width/50.0, height);
  rect(width/5.0*0.67, 0, width/50.0, height);
  rect(width/5.0*2.40, height/5.0*0.13, width/50.0, height/5.0*4.0);

  fill(#8bc1cf);  // blue
  noStroke();
  // cannot move
  rect(width/5.0*2.50, height/5.0*0.40, width/5.0*1.13, height/50.0);
  // 4th column
  ellipse(width/5.0*1.83, height/5.0*(6.20+fft4.getBand(fft4.specSize())*4.4), width/50.0, height/50.0);
  ellipse(width/5.0*1.84, height/5.3*(4.74-fft4.getBand(fft4.specSize())*1.6), width/30.0, height/30.0);
  ellipse(width/5.0*1.57, height/4.5*(4.19-fft4.getBand(fft4.specSize())*1.4), width/30.0, height/30.0);
  ellipse(width/5.0*1.53, height/5.6*(2.57-fft4.getBand(fft4.specSize())*4.7), width/50.0, height/50.0);
  ellipse(width/5.0*1.36, height/6.1*(2.83-fft4.getBand(fft4.specSize())*1.4), width/50.0, height/50.0);

  //cannot change
  rect(width/5.0*3.63, height/5.0*0.15, width, height/5.0*0.16);

  // 6th column
  ellipse(width/5.0*3.37, height/8.06*(0.54-fft4.getBand(fft4.specSize())*4.2), width/50.0, height/50.0);
  ellipse(width/5.0*3.10, height/5.0*(2.24-fft4.getBand(fft4.specSize())*1.3), width/50.0, height/50.0);
  ellipse(width/5.0*2.85, height/5.0*(1.23-fft4.getBand(fft4.specSize())*5.2), width/30.0, height/30.0);
  ellipse(width/5.0*4.09, height/5.0*(3.19-fft4.getBand(fft4.specSize())*2.4), width/30.0, height/30.0);


  rect(width/5.0*0.41, height/1.0*2.70, width/50.0, height/50.0);
  rect(width/5.0*0.41, height/5.0*2.66, width/50.0, height/50.0);


  rect(width/5.0*2.40, height/5.0*0.75, width/50.0, height/5.0*0.28);
  rect(width/5.0*2.50, height/5.0*2.66, width/5.0*0.45, height/50.0);
  //4th row
  ellipse(width/5.0*(2.12+fft4.getBand(fft4.specSize())*4.2), height/5.0*1.68, width/30.0, height/30.0);
  ellipse(width/5.0*(4.00-fft4.getBand(fft4.specSize())*4.1), height/5.0*1.35, width/50.0, height/50.0);
  ellipse(width/5.0*(0.10-fft4.getBand(fft4.specSize())*3.1), height/5.0*1.66, width/30.0, height/30.0);


  rect(width/5.0*2.28, height/5.0*2.00, width/5.0*0.05, height/50.0);
  rect(width/5.0*0.83, height/5.0*3.10, width/5.0*0.05, height/50.0);
  ellipse(width/5.0*(0.06+fft4.getBand(fft4.specSize())*2.8), height/5.0*3.00, width/50.0, height/50.0);
  ellipse(width/5.0*(1.44+fft4.getBand(fft4.specSize())*4.4), height/5.0*3.74, width/50.0, height/50.0);
  rect(width/5.0*3.82, height/5.0*3.10, width/5.0*0.04, height/50.0);


  fill(#4468ac);  // red
  noStroke();
  rect(width/5.0*0.51, height/5.0*4.16, width/5.0*1.02, height/5.0*0.54);//pink
  // 4th row
  ellipse(width/5.0*(1.43-fft4.getBand(fft4.specSize())*2.37), height/5.0*1.92, width/50.0, height/50.0);
  ellipse(width/5.0*(4.29+fft4.getBand(fft4.specSize())*3.16), height/5.0*1.74, width/30.0, height/30.0);
  ellipse(width/5.0*(2.87-fft4.getBand(fft4.specSize())*5.7), height/5.0*2.05, width/30.0, height/30.0);
  ellipse(width/5.0*(0.67-fft4.getBand(fft4.specSize())*2.78), height/5.0*1.83, width/50.0, height/50.0);

  // 4th column
  ellipse(width/5.0*1.53, height/5.0*(1.0+fft4.getBand(fft4.specSize())*3.8), width/50.0, height/50.0);
  ellipse(width/5.0*1.75, height/5.0*(4.71-fft4.getBand(fft4.specSize())*3.4), width/50.0, height/50.0);
  ellipse(width/5.0*2.03, height/5.0*(2.96-fft4.getBand(fft4.specSize())*4.6), width/50.0, height/50.0);
  ellipse(width/5.0*1.90, height/5.0*(3.32-fft4.getBand(fft4.specSize())*2.4), width/50.0, height/50.0);


  rect(width/5.0*1.47, 0, width/5.0*1.30, height/5.0*0.14);

  rect(width/5.0*1.81, height/5.0*4.70, width/5.0*0.81, height/5.0*0.70);

  rect(width/5.0*4.29, height/5.0*0.50, width/5.0*0.10, height/50.0);

  ellipse(width/5.0*(4.67-fft4.getBand(fft4.specSize())*7.1), height/5.0*3.30, width/50.0, height/50.0);

  //6th column
  ellipse(width/5.0*3.63, height/2.76*(1-fft4.getBand(fft4.specSize())*1.2), width/50.0, height/50.0);
  ellipse(width/5.0*3.77, height/5.0*(2.64-fft4.getBand(fft4.specSize())*1.0), width/50.0, height/50.0);
  ellipse(width/5.0*3.35, height/5.0*(3.14-fft4.getBand(fft4.specSize())*-1.2), width/50.0, height/50.0);
  ellipse(width/5.0*3.82, height/5.0*(3.89-fft4.getBand(fft4.specSize())*0.9), width/50.0, height/50.0);


  rect(width/5.0*1.22, height/5.0*1.19, width/50.0, height/5.0*0.24);
  ellipse(width/5.0*4.86, height/5.0*(4.23-fft4.getBand(fft4.specSize())*6.6), width/50.0, height/50.0);
  ellipse(width/5.0*2.45, height/5.0*(3.39-fft4.getBand(fft4.specSize())*1.0), width/50.0, height/50.0);
  rect(width/5.0*2.40, height/5.0*1.12, width/50.0, 0);

  fill(#bcf5fb);  // gray
  noStroke();
  rect(width/5.0*3.20, height/5.0*4.40, width/5.0*1.00, height/5.0*1.15);//green
  // 4th row
  ellipse(width/5.7*(2.50-fft4.getBand(fft4.specSize())*0.4), height/5.0*1.30, width/50.0, height/50.0);
  ellipse(width/4.8*(1.72-fft4.getBand(fft4.specSize())*4.8), height/5.0*2.00, width/50.0, height/50.0);
  ellipse(width/4.9*(4.66-fft4.getBand(fft4.specSize())*0.3), height/5.0*1.88, width/50.0, height/50.0);

  //4th column
  ellipse(width/5.0*1.91, height/5.0*(0.87-fft4.getBand(fft4.specSize())*0.1), width/50.0, height/50.0);
  ellipse(width/5.0*1.53, height/5.0*(2.57-fft4.getBand(fft4.specSize())*3.8), width/50.0, height/50.0);
  ellipse(width/5.0*1.53, height/5.0*(4.42-fft4.getBand(fft4.specSize())*0.1), width/50.0, height/50.0);

  //6th column
  ellipse(width/5.0*3.63, height/5.00*(0.60-fft4.getBand(fft4.specSize())*0.131), width/50.0, height/50.0);
  ellipse(width/5.0*3.47, height/7.0*(3.48-fft4.getBand(fft4.specSize())*0.198), width/50.0, height/50.0);
  ellipse(width/5.0*3.63, height/5.0*(2.78-fft4.getBand(fft4.specSize())*0.097), width/50.0, height/50.0);
  ellipse(width/5.0*3.78, height/5.0*(1.01-fft4.getBand(fft4.specSize())*0.110), width/50.0, height/50.0);
}

void playChinese() {
  background(#2e2a32);
  fill(#c39851);  // yellow   horizontial 
  noStroke();
  rect(0, height/5.0*2.0, width, height/50.0);
  rect(width/5.0*1.3, height/10.0, width, height/50.0);
  rect(0, height/5.0*3.3, width, height/50.0);
  rect(0, height/5.0*4.0, width, height/50.0);
  rect(0, height/5.0*0.3, width, height/50.0);
  rect(0, height/5.0*2.66, width, height/50.0);
  rect(0, height/5.0*0.04, width/5.0*3.67, height/50.0);
  rect(0, height/5.0*3.1, width, height/50.0);
  rect(0, height/5.0*4.7, width, height/50.0);

  fill(#c39851);  // yellow   vertical
  noStroke();
  rect(width/5.0*1.53, height/5.0*0.51, width/50.0, height);
  rect(width/5.0*1.22, 0, width/50.0, height/5.0*4.17);
  rect(width/5.0*3.63, 0, width/50.0, height/5.0*4.10);
  rect(width/5.0*4.29, height/5.0*0.50, width/50.0, height);
  rect(width/5.0*4.48, height/5.0*0.33, width/50.0, height);
  rect(width/5.0*0.41, height/5.0*2.17, width/50.0, height);
  rect(width/5.0*0.67, 0, width/50.0, height);
  rect(width/5.0*2.40, height/5.0*0.13, width/50.0, height/5.0*3.9);

  fill(#825a3c);  // blue
  noStroke();
  // cannot move
  rect(width/5.0*2.50, height/5.0*0.40, width/5.0*1.13, height/50.0);
  // 4th column
  rect(width/5.0*1.53, height/5.0*(2.20+fft5.getBand(fft5.specSize())*0.3), width/50.0, height/5.0*0.14);
  rect(width/5.0*1.53, height/5.0*(3.11-fft5.getBand(fft5.specSize())*0.3), width/50.0, -15);
  rect(width/5.0*1.53, height/5.0*(4.19-fft5.getBand(fft5.specSize())*0.2), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(1.50-fft5.getBand(fft5.specSize())*0.3), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(1.95-fft5.getBand(fft5.specSize())*0.2), width/50.0, -17);

  //cannot change
  rect(width/5.0*3.63, height/5.0*0.15, width, height/5.0*0.16);

  // 6th column
  rect(width/5.0*3.63, height/8.06*(0.54-fft5.getBand(fft5.specSize())*0.400), width/50.0, height/5.0*0.16);
  rect(width/5.0*3.63, height/5.0*(2.24-fft5.getBand(fft5.specSize())*0.400), width/50.0, height/5.0*0.14);
  rect(width/5.0*3.63, height/5.0*(1.23-fft5.getBand(fft5.specSize())*0.400), width/50.0, height/5.0*0.12);
  rect(width/5.0*3.63, height/5.0*(3.19-fft5.getBand(fft5.specSize())*0.400), width/50.0, height/5.0*-0.10);


  rect(width/5.0*0.41, height/1.0*2.70, width/50.0, height/50.0);
  rect(width/5.0*0.41, height/5.0*2.66, width/50.0, height/50.0);


  rect(width/5.0*2.40, height/5.0*0.75, width/50.0, height/5.0*0.28);
  rect(width/5.0*2.50, height/5.0*2.66, width/5.0*0.45, height/50.0);
  //4th row
  rect(width/5.0*(2.12+fft5.getBand(fft5.specSize())*0.4), height/5.0*2.00, width/5.0*0.250, height/50.0);
  rect(width/5.0*(4.00-fft5.getBand(fft5.specSize())*0.4), height/5.0*2.00, width/5.0*0.2, height/50.0);
  rect(width/5.0*(0.10-fft5.getBand(fft5.specSize())*0.4), height/5.0*2.00, width/5.0*0.2, height/50.0);


  rect(width/5.0*2.28, height/5.0*2.00, width/5.0*0.05, height/50.0);
  rect(width/5.0*0.83, height/5.0*3.10, width/5.0*0.05, height/50.0);
  rect(width/5.0*(0.06+fft5.getBand(fft5.specSize())*0.9), height/5.0*3.10, width/5.0*0.24, height/50.0);
  rect(width/5.0*(1.44+fft5.getBand(fft5.specSize())*0.5), height/5.0*3.10, width/5.0*0.73, height/50.0);
  rect(width/5.0*3.82, height/5.0*3.10, width/5.0*0.04, height/50.0);


  fill(#9e3328);  // red
  noStroke();
  rect(width/5.0*0.51, height/5.0*4.16, width/5.0*1.02, height/5.0*0.54);//pink
  // 4th row
  rect(width/5.0*(1.43-fft5.getBand(fft5.specSize())*0.58), height/5.0*2.00, width/5.0*0.16, height/50.0);
  rect(width/5.0*(4.29+fft5.getBand(fft5.specSize())*0.56), height/5.0*2.00, width/5.0*0.29, height/50.0);
  rect(width/5.0*(2.87-fft5.getBand(fft5.specSize())*0.8), height/5.0*2.00, width/5.0*0.23, height/50.0);
  rect(width/5.0*(0.67-fft5.getBand(fft5.specSize())*0.48), height/5.0*2.00, width/5.0*0.10, height/50.0);

  // 4th column
  rect(width/5.0*1.53, height/5.0*(1.0+fft5.getBand(fft5.specSize())*0.6), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(4.71-fft5.getBand(fft5.specSize())*-0.7), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(2.96-fft5.getBand(fft5.specSize())*0.9), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(3.32-fft5.getBand(fft5.specSize())*-1.1), width/50.0, -17);


  rect(width/5.0*1.47, 0, width/5.0*1.30, height/5.0*0.14);

  rect(width/5.0*1.81, height/5.0*4.70, width/5.0*0.81, height/5.0*0.70);

  rect(width/5.0*4.29, height/5.0*0.50, width/5.0*0.10, height/50.0);

  rect(width/5.0*(4.67-fft5.getBand(fft5.specSize())*0.4), height/5.0*3.30, width/5.0*0.21, height/50.0);

  //6th column
  rect(width/5.0*3.63, height/2.76*(1-fft5.getBand(fft5.specSize())*0.825), width/50.0, height/5.0*0.16);
  rect(width/5.0*3.63, height/5.0*(2.64-fft5.getBand(fft5.specSize())*1.085), width/50.0, height/5.0*-0.19);
  rect(width/5.0*3.63, height/5.0*(3.14-fft5.getBand(fft5.specSize())*-0.933), width/50.0, height/5.0*0.11);
  rect(width/5.0*3.63, height/5.0*(3.89-fft5.getBand(fft5.specSize())*0.788), width/50.0, height/5.0*0.20);


  rect(width/5.0*1.22, height/5.0*1.19, width/50.0, height/5.0*0.24);
  rect(width/5.0*4.48, height/5.0*(4.23-fft5.getBand(fft5.specSize())*0.4), width/50.0, height/5.0*0.28);
  rect(width/5.0*2.40, height/5.0*(3.39-fft5.getBand(fft5.specSize())*1.0), width/50.0, height/5.0*0.30);
  rect(width/5.0*2.40, height/5.0*1.12, width/50.0, 0);

  fill(#c6b389);  // gray
  noStroke();
  rect(width/5.0*3.20, height/5.0*4.40, width/5.0*1.00, height/5.0*1.15);//green
  // 4th row
  rect(width/5.0*(2.50-fft5.getBand(fft5.specSize())*0.2), height/5.0*2.00, width/5.0*0.15, height/50.0);
  rect(width/5.0*(1.72-fft5.getBand(fft5.specSize())*0.3), height/5.0*2.00, width/5.0*0.2, height/50.0);
  rect(width/5.0*(4.66-fft5.getBand(fft5.specSize())*0.1), height/5.0*2.00, width/5.0*0.2, height/50.0);

  //4th column
  rect(width/5.0*1.53, height/5.0*(0.87-fft5.getBand(fft5.specSize())*0.1), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(2.57-fft5.getBand(fft5.specSize())*-0.2), width/50.0, -17);
  rect(width/5.0*1.53, height/5.0*(4.42-fft5.getBand(fft5.specSize())*0.1), width/50.0, -17);

  //6th column
  rect(width/5.0*3.63, height/5.00*(0.60-fft5.getBand(fft5.specSize())*0.131), width/50.0, height/5.0*0.16);
  rect(width/5.0*3.63, height/5.0*(3.48-fft5.getBand(fft5.specSize())*0.042), width/50.0, height/5.0*0.18);
  rect(width/5.0*3.63, height/5.0*(2.78-fft5.getBand(fft5.specSize())*0.097), width/50.0, height/5.0*0.24);
  rect(width/5.0*3.63, height/5.0*(1.01-fft5.getBand(fft5.specSize())*0.110), width/50.0, height/5.0*0.10);
}
