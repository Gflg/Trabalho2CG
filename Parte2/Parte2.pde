Vertice p1;
Vertice p2;
Vertice p3;
Vertice p4;
Vertice pontoAtual;

int contadorPonto = 0;
int entradaUsuario = 0;
int contadorTempo = 0;

float XpontoA, YpontoA;
float XpontoB, YpontoB;
float XpontoC, YpontoC;
float XpontoD, YpontoD;
float x, y, z;

String ZpontoA = "";
String ZpontoB = "";
String ZpontoC = "";
String ZpontoD = "";

void setup(){
  size(1300, 1000, P3D);
}

void draw(){
  switch (entradaUsuario) {
    case 0:
      fill(0);
      text ("Clique na tela para definir o Ponto A:", 133, 100);
      break;
    case 1:
      fill(0);
      text ("Informe a Coordenada Z do Ponto A e aperte enter para continuar: " + ZpontoA, 133, 200);
      break;
    case 2:
      fill(0);
      text ("Clique na tela para definir o Ponto B: ", 133, 300);
      break;
    case 3:
      fill(0);
      text ("Informe a Coordenada Z do Ponto B e aperte enter para continuar: " + ZpontoB, 133, 400);
      break;
    case 4:
      fill(0);
      text ("Clique na tela para definir o Ponto C:", 133, 500);
      break;
    case 5:
      fill(0);
      text ("Informe a Coordenada Z do Ponto C e aperte enter para continuar: " + ZpontoC, 133, 600);
      break;
    case 6:
      fill(0);
      text ("Clique na tela para definir o Ponto D: ", 133, 700);
      break;
    case 7:
      fill(0);
      text ("Informe a Coordenada Z do Ponto D e aperte enter para continuar: " + ZpontoD, 133, 800);
      break;
    case 8:
      pontoAtual = new Vertice(p1.getX(),p1.getY(),p1.getZ());
      entradaUsuario++;
      break;
    case 9:
      if(contadorTempo == 5){
        pontoAtual = calcula(contadorPonto*0.01);
        if(contadorPonto == 100)
          contadorPonto=0;
        else
          contadorPonto++;
        contadorTempo = 0;
      }
      curva();//metodo da curva
      stroke(0,0,0);//cor dos pontos
      strokeWeight(5);//espessura do ponto
      point(p1.getX(), p1.getY(), p1.getZ());//define os pontos
      point(p2.getX(), p2.getY(), p2.getZ());//define os pontos
      point(p3.getX(), p3.getY(), p3.getZ());//define os pontos
      point(p4.getX(), p4.getY(), p4.getZ());
      stroke(234,19,20);
      Decagono decagono1 = new Decagono(pontoAtual);
      decagono1.drawFigura();
      contadorTempo++;
      break;
  }
}

Vertice calcula(float t){
  int[] resposta = new int[3];
  Vertice respostaVertice;
  resposta[0] = int(pow((1-t),3) * p1.getX() + 3 * t * pow((1-t),2) * p2.getX() + 3 * pow(t,2) * (1-t) * p3.getX() + pow(t,3) * p4.getX());
  resposta[1] = int(pow((1-t),3) * p1.getY() + 3 * t * pow((1-t),2) * p2.getY() + 3 * pow(t,2) * (1-t) * p3.getY() + pow(t,3) * p4.getY());
  resposta[2] = int(pow((1-t),3) * p1.getZ() + 3 * t * pow((1-t),2) * p2.getZ() + 3 * pow(t,2) * (1-t) * p3.getZ() + pow(t,3) * p4.getZ());
  respostaVertice = new Vertice(resposta[0], resposta[1], resposta[2]);
  return respostaVertice;
}

void curva(){
  clear();//Limpa a tela antes de desenhar
  background(255,255,255); //cor de fundo
  strokeWeight(1);//espessura da linha
  stroke(0,0,0);//cor da linha
  int xi, yi, zi;
  float t = 0.0; //controle do while
  while (t <= 1.0){// : # vai de  0 ate 1,         
    t = t + 0.001;
    x = pow((1-t),3) * p1.getX() + 3 * t * pow((1-t),2) * p2.getX() + 3 * pow(t,2) * (1-t) * p3.getX() + pow(t,3) * p4.getX();
    y = pow((1-t),3) * p1.getY() + 3 * t * pow((1-t),2) * p2.getY() + 3 * pow(t,2) * (1-t) * p3.getY() + pow(t,3) * p4.getY();
    z = pow((1-t),3) * p1.getZ() + 3 * t * pow((1-t),2) * p2.getZ() + 3 * pow(t,2) * (1-t) * p3.getZ() + pow(t,3) * p4.getZ();
    xi = int(x);
    yi = int(y);
    zi = int(z);
    point(xi, yi, zi);//mostra a curva gerada
  }
}

void keyPressed() {
  switch(entradaUsuario) {
    case 1:
      if ((key == ENTER || key == RETURN) && ZpontoA.length() > 0) {
        this.p1 = new Vertice(this.XpontoA, this.YpontoA, Float.parseFloat(ZpontoA));
        entradaUsuario++;
      } else {
        ZpontoA = ZpontoA + key;
      }
      break;
    case 3:
      if ((key == ENTER || key == RETURN) && ZpontoB.length() > 0) {
        this.p2 = new Vertice(this.XpontoB, this.YpontoB, Float.parseFloat(ZpontoB));
        entradaUsuario++;
      } else {
        ZpontoB = ZpontoB + key;
      }
      break;
    case 5:
      if ((key == ENTER || key == RETURN) && ZpontoC.length() > 0) {
        this.p3 = new Vertice(this.XpontoC, this.YpontoC, Float.parseFloat(ZpontoC));
        entradaUsuario++;
      } else {
        ZpontoC = ZpontoC + key;
      }
      break;
    case 7:
      if ((key == ENTER || key == RETURN) && ZpontoD.length() > 0) {
        this.p4 = new Vertice(this.XpontoD, this.YpontoD, Float.parseFloat(ZpontoD));
        entradaUsuario++;
      } else {
        ZpontoD = ZpontoD + key;
      }
      break;
  }
}

void mousePressed() {
  switch(entradaUsuario) {
    case 0:
      this.XpontoA = mouseX;
      this.YpontoA = mouseY;
      entradaUsuario++;
      break;
    case 2:
      this.XpontoB = mouseX;
      this.YpontoB = mouseY;
      entradaUsuario++;
      break;
    case 4:
      this.XpontoC = mouseX;
      this.YpontoC = mouseY;
      entradaUsuario++;
      break;
    case 6:
      this.XpontoD = mouseX;
      this.YpontoD = mouseY;
      entradaUsuario++;
      break;
  }
}
