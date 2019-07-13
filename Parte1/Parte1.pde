import java.awt.Dimension;
import java.awt.*;

int transicao;
int cor;
int fase;
int acertos;
int erros;
int ultimoTempo;
int pontuacao;
int aux;
int entradaUsuario = 0;
float XpontoA, YpontoA;
String ZpontoA="";
float XpontoB, YpontoB;
String ZpontoB="";
String anguloTeta="";
boolean isRotacionando = true;

double teta, anguloAnimado, incrementoAnimacao;

int tempoInicial, contadorTempo, contadorAnimacao = 50;

Vertice verticeA, verticeB;

Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();

void settings() {
  size(1300, 1000, P3D);
}

void setup() {
  cor = transicao = fase =  acertos = erros = ultimoTempo = pontuacao = 0;
  tempoInicial = millis();
  background(255);
}

void draw() {
  switch (entradaUsuario) {
    case 0:
      fill(0);
      text ("Clique na tela para definir o Ponto A (do eixo de rotação)", 133, 100);
      break;
    case 1:
      fill(0);
      text ("Informe a Coordenada Z do Ponto A (do eixo de rotação) e aperte enter para continuar: " + ZpontoA, 133, 200);
      break;
    case 2:
      fill(0);
      text ("Clique na tela para definir o Ponto B (do eixo de rotação) e aperte enter para continuar: ", 133, 300);
      break;
    case 3:
      fill(0);
      text ("Informe a Coordenada Z do Ponto B (do eixo de rotação) e aperte enter para continuar: " + ZpontoB, 133, 400);
      break;
    case 4:
      fill(0);
      text ("Informe o ângulo de rotação (teta) e aperte enter para continuar: " + anguloTeta, 133, 500);
      break;
    case 5:
      textSize(32);
      text ("Ponto X: (" + XpontoA + ", " + YpontoA + ", " + ZpontoA + ")", 133, 600);
      text ("Ponto Y: (" + XpontoB + ", " + YpontoB + ", " + ZpontoB + ")", 133, 650);
      text ("Ângulo de Rotação: " + anguloTeta + "º", 133, 700);
      if (transicao == 1) {
        background(cor);
        cor += 5;
        if(cor > 255) {
          transicao = 0;
          fase++;
        }
      } else {
        switch (fase) {
          case 0:
            Fase3D fase3d = new Fase3D();
            fase3d.drawTela();
            fill(0, 0, 0);
            textSize(40);
            text("Clique para iniciar!", 450, 800);
            if (mousePressed) {
              transicao = 1;
              cor = 0;
              teta = Double.parseDouble(anguloTeta);
              anguloAnimado = 0;
              incrementoAnimacao = teta / contadorAnimacao;
            }
            break;
          default:
            TelaRotacaoQuaternio telaRotacaoQuaternio = new TelaRotacaoQuaternio(verticeA, verticeB, anguloAnimado, isRotacionando);
            
            if (Math.abs(anguloAnimado + incrementoAnimacao) < Math.abs(teta)) {
              anguloAnimado += incrementoAnimacao;
              while(millis() - tempoInicial < 50); // Espera 50ms antes de redesenhar
              tempoInicial = millis();
            }
            else {
              anguloAnimado = teta;
              this.isRotacionando = false; // variável de controle
            }
            
            clear();//Limpa a tela antes de desenhar
            background(255,255,255); //cor de fundo
            telaRotacaoQuaternio.drawTela();
        }
      }
      break;
  }
}

void keyPressed() { 
  switch(entradaUsuario) {
    case 1:
      if ((key == ENTER || key == RETURN) && ZpontoA.length() > 0) {
        this.verticeA = new Vertice(this.XpontoA, this.YpontoA, Float.parseFloat(ZpontoA));
        entradaUsuario++;
      } else {
        ZpontoA = ZpontoA + key;
      }
      break;
    case 3:
      if ((key == ENTER || key == RETURN) && ZpontoB.length() > 0) {
        this.verticeB = new Vertice(this.XpontoB, this.YpontoB, Float.parseFloat(ZpontoB));
        entradaUsuario++;
      } else {
        ZpontoB = ZpontoB + key;
      }
      break;
    case 4:
      if ((key == ENTER || key == RETURN) && anguloTeta.length() > 0) {
        entradaUsuario++;
      } else {
        anguloTeta = anguloTeta + key;
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
  }
}
