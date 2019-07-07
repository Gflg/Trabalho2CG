public class TelaTranslacaoDecagono{
  float x, y, z;
  
  int[][] p = new int[4][3];
  /*int[][] p = {{100,300,1},
               {200,400,2},
               {300,200,2},
               {400,300,1}};*/
  
  int contadorPonto = 0;
  
  int contadorTempo = 0;
  
  int[] pontoAtual = {p[0][0],p[0][1],p[0][2]};
  
  public TelaTranslacaoDecagono(Vertice pontoA, Vertice pontoB, Vertice pontoC, Vertice pontoD) {
    this.p[0][0] = int(pontoA.getX());
    this.p[0][1] = int(pontoA.getY());
    this.p[0][2] = int(pontoA.getZ());
    this.p[1][0] = int(pontoB.getX());
    this.p[1][1] = int(pontoB.getY());
    this.p[1][2] = int(pontoB.getZ());
    this.p[2][0] = int(pontoC.getX());
    this.p[2][1] = int(pontoC.getY());
    this.p[2][2] = int(pontoC.getZ());
    this.p[3][0] = int(pontoD.getX());
    this.p[3][1] = int(pontoD.getY());
    this.p[3][2] = int(pontoD.getZ());
  }
  
  void drawTela(int contador, int contador2){
    if(contador % 1000 == 0){
      contador2 = contador2 % 100;
      pontoAtual = calcula(contador2*0.01);
      contadorTempo = 0;
    }
    
    curva();//metodo da curva
  
    stroke(0,0,0);//cor dos pontos
  
    strokeWeight(5);//espessura do ponto
  
    point(p[0][0], p[0][1], p[0][2]);//define os pontos
    
    point(p[1][0], p[1][1], p[1][2]);//define os pontos
    
    point(p[2][0], p[2][1], p[2][2]);//define os pontos
    
    point(p[3][0], p[3][1], p[3][2]);//define os pontos
    
    stroke(255,0,0);
    
    Decagono decagono1 = new Decagono(new Vertice(pontoAtual[0], pontoAtual[1], pontoAtual[2]));
    decagono1.drawFigura();
    //point(pontoAtual[0], pontoAtual[1], pontoAtual[2]);
    
    //print(contadorTempo);
  }
  
  
  int[] calcula(float t){
    int[] resposta = new int[3];
    
    resposta[0] = int(pow((1-t),3) * p[0][0] + 3 * t * pow((1-t),2) * p[1][0] + 3 * pow(t,2) * (1-t) * p[2][0] + pow(t,3) * p[3][0]);
    resposta[1] = int(pow((1-t),3) * p[0][1] + 3 * t * pow((1-t),2) * p[1][1] + 3 * pow(t,2) * (1-t) * p[2][1] + pow(t,3) * p[3][1]);
    resposta[2] = int(pow((1-t),3) * p[0][2] + 3 * t * pow((1-t),2) * p[1][2] + 3 * pow(t,2) * (1-t) * p[2][2] + pow(t,3) * p[3][2]);
    
    return resposta;
  }
  
  
  void curva(){
  
    clear();//Limpa a tela antes de desenhar
  
    background(255,255,255); //cor de fundo
  
    strokeWeight(1);//espessura da linha
  
    stroke(#000000);//cor da linha
  
    
  
    int xi, yi, zi;
  
  
  
    float  t = 0.0; //controle do while
  
    while (t <= 1.0){// : # vai de  0 ate 1,         
  
      t =t + 0.001;
  
      
      x = pow((1-t),3) * p[0][0] + 3 * t * pow((1-t),2) * p[1][0] + 3 * pow(t,2) * (1-t) * p[2][0] + pow(t,3) * p[3][0];
      y = pow((1-t),3) * p[0][1] + 3 * t * pow((1-t),2) * p[1][1] + 3 * pow(t,2) * (1-t) * p[2][1] + pow(t,3) * p[3][1];
      z = pow((1-t),3) * p[0][2] + 3 * t * pow((1-t),2) * p[1][2] + 3 * pow(t,2) * (1-t) * p[2][2] + pow(t,3) * p[3][2];
      
      xi = int(x);
  
      yi = int(y);
      
      zi = int(z);
      
      point(xi, yi, zi);//mostra a curva gerada
  
    }
  
    
  
  }
}
