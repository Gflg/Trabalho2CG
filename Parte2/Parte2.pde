float x, y, z;

Vertice p1;
Vertice p2;
Vertice p3;
Vertice p4;

int contadorPonto = 0;

int entradaUsuario = 0;

int contadorTempo = 0;

Vertice pontoAtual;

String XpontoA="";
String YpontoA="";
String ZpontoA="";
String XpontoB="";
String YpontoB="";
String ZpontoB="";
String XpontoC="";
String YpontoC="";
String ZpontoC="";
String XpontoD="";
String YpontoD="";
String ZpontoD="";

void setup(){

  size(1300, 1000, P3D);

}



void draw(){
    if (entradaUsuario == 0){
      fill(0);
      text ("Informe a Coordenada X do Ponto A (do eixo de rotação) e aperte enter para continuar: " + XpontoA, 133, 100);
    }
    else if (entradaUsuario == 1){
      fill(0);
      text ("Informe a Coordenada Y do Ponto A (do eixo de rotação) e aperte enter para continuar: " + YpontoA, 133, 150);
    }
    else if (entradaUsuario == 2){
      fill(0);
      text ("Informe a Coordenada Z do Ponto A (do eixo de rotação) e aperte enter para continuar: " + ZpontoA, 133, 200);
    }
    else if (entradaUsuario == 3){
      fill(0);
      text ("Informe a Coordenada X do Ponto B (do eixo de rotação) e aperte enter para continuar: " + XpontoB, 133, 250);
    }
    else if (entradaUsuario == 4){
      fill(0);
      text ("Informe a Coordenada Y do Ponto B (do eixo de rotação) e aperte enter para continuar: " + YpontoB, 133, 300);
    }
    else if (entradaUsuario == 5){
      fill(0);
      text ("Informe a Coordenada Z do Ponto B (do eixo de rotação) e aperte enter para continuar: " + ZpontoB, 133, 350);
    }
    else if (entradaUsuario == 6){
      fill(0);
      text ("Informe a Coordenada X do Ponto C (do eixo de rotação) e aperte enter para continuar: " + XpontoC, 133, 400);
    }
    else if (entradaUsuario == 7){
      fill(0);
      text ("Informe a Coordenada Y do Ponto C (do eixo de rotação) e aperte enter para continuar: " + YpontoC, 133, 450);
    }
    else if (entradaUsuario == 8){
      fill(0);
      text ("Informe a Coordenada Z do Ponto C (do eixo de rotação) e aperte enter para continuar: " + ZpontoC, 133, 500);
    }
    else if (entradaUsuario == 9){
      fill(0);
      text ("Informe a Coordenada X do Ponto C (do eixo de rotação) e aperte enter para continuar: " + XpontoD, 133, 550);
    }
    else if (entradaUsuario == 10){
      fill(0);
      text ("Informe a Coordenada Y do Ponto C (do eixo de rotação) e aperte enter para continuar: " + YpontoD, 133, 600);
    }
    else if (entradaUsuario == 11){
      fill(0);
      text ("Informe a Coordenada Z do Ponto C (do eixo de rotação) e aperte enter para continuar: " + ZpontoD, 133, 650);
    }
    else if (entradaUsuario == 12){
      p1 = new Vertice (Float.parseFloat(XpontoA), Float.parseFloat(YpontoA), Float.parseFloat(ZpontoA));
      p2 = new Vertice (Float.parseFloat(XpontoB), Float.parseFloat(YpontoB), Float.parseFloat(ZpontoB));
      p3 = new Vertice (Float.parseFloat(XpontoC), Float.parseFloat(YpontoC), Float.parseFloat(ZpontoC));
      p4 = new Vertice (Float.parseFloat(XpontoD), Float.parseFloat(YpontoD), Float.parseFloat(ZpontoD));
      pontoAtual = new Vertice(p1.getX(),p1.getY(),p1.getZ());
      print(p4.getX() + "\n");
      
      entradaUsuario++;
    }
    else if (entradaUsuario == 13){
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



  float  t = 0.0; //controle do while

  while (t <= 1.0){// : # vai de  0 ate 1,         

    t =t + 0.001;

    
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
  if (key == ENTER || key == RETURN) {
    entradaUsuario++;
  } else {
    if(entradaUsuario == 0){
      XpontoA = XpontoA + key;
    }
    if(entradaUsuario == 1){
      YpontoA = YpontoA + key;
    }
    if(entradaUsuario == 2){
      ZpontoA = ZpontoA + key;
    }
    if(entradaUsuario == 3){
      XpontoB = XpontoB + key;
    }
    if(entradaUsuario == 4){
      YpontoB = YpontoB + key;
    }
    if(entradaUsuario == 5){
      ZpontoB = ZpontoB + key;
    }
    if(entradaUsuario == 6){
      XpontoC = XpontoC + key;
    }
    if(entradaUsuario == 7){
      YpontoC = YpontoC + key;
    }
    if(entradaUsuario == 8){
      ZpontoC = ZpontoC + key;
    }
    if(entradaUsuario == 9){
      XpontoD = XpontoD + key;
    }
    if(entradaUsuario == 10){
      YpontoD = YpontoD + key;
    }
    if(entradaUsuario == 11){
      ZpontoD = ZpontoD + key;
    }
  }
}
