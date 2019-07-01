import java.awt.Dimension;
import java.awt.*;
import static javax.swing.JOptionPane.*;

int transicao;
int cor;
int fase;
int acertos;
int erros;
int ultimoTempo;
int pontuacao;
int aux;
int entradaUsuario = 0;
String XpontoA="";
String YpontoA="";
String ZpontoA="";
String XpontoB="";
String YpontoB="";
String ZpontoB="";
String anguloTeta="";

Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();

void settings() {
  size(1300, 1000, P3D);
}

void setup() {
  cor = transicao = fase =  acertos = erros = ultimoTempo = pontuacao = 0;
  background(255);
}

void draw() {
  switch (entradaUsuario) {
    case 0:
      fill(0);
      text ("Informe a Coordenada X do Ponto A (do eixo de rotação) e aperte enter para continuar: " + XpontoA, 133, 100);
      break;
    case 1:
      fill(0);
      text ("Informe a Coordenada Y do Ponto A (do eixo de rotação) e aperte enter para continuar: " + YpontoA, 133, 150);
      break;
    case 2:
      fill(0);
      text ("Informe a Coordenada Z do Ponto A (do eixo de rotação) e aperte enter para continuar: " + ZpontoA, 133, 200);
      break;
    case 3:
      fill(0);
      text ("Informe a Coordenada X do Ponto B (do eixo de rotação) e aperte enter para continuar: " + XpontoB, 133, 250);
      break;
    case 4:
      fill(0);
      text ("Informe a Coordenada Y do Ponto B (do eixo de rotação) e aperte enter para continuar: " + YpontoB, 133, 300);
      break;
    case 5:
      fill(0);
      text ("Informe a Coordenada Z do Ponto B (do eixo de rotação) e aperte enter para continuar: " + ZpontoB, 133, 350);
      break;
    case 6:
      fill(0);
      text ("Informe o ângulo de rotação (teta) e aperte enter para continuar: " + anguloTeta, 133, 400);
      break;
    case 7:
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
              }
              break;
          default:
              background(255, 255, 255);
              Vertice pontoA = new Vertice (Integer.parseInt(XpontoA), Integer.parseInt(YpontoA), Integer.parseInt(ZpontoA));
              Vertice pontoB = new Vertice (Integer.parseInt(XpontoB), Integer.parseInt(YpontoB), Integer.parseInt(ZpontoB));
              double n[] = {pontoB.getX() - pontoA.getX(), pontoB.getY() - pontoA.getY(), pontoB.getZ() - pontoA.getZ()};
              double teta = Integer.parseInt(anguloTeta);
              TelaRotacaoQuaternio telaRotacaoQuaternio = new TelaRotacaoQuaternio(pontoA, pontoB, n, teta);
              telaRotacaoQuaternio.drawTela();
        }
      }
      break;
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
      anguloTeta = anguloTeta + key;
    }
  }
}
