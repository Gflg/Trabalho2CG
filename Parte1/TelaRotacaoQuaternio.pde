public class TelaRotacaoQuaternio {
  
  Vertice pontoA, pontoB;

  double n[], teta, pontoLuz[] = {10000,10000,10000}; //Double.MAX_VALUE, 0, 10000  |   0,Double.MAX_VALUE,10000    | 0,0,0   | 10000,10000,10000
  //Por algum motivo, ele não pinta direito quando coloca o z no MAX_VALUE, pintando de preto a face da frente
  
  boolean isRotacionando;

  public TelaRotacaoQuaternio(Vertice pontoA, Vertice pontoB, double teta, boolean isRotacionando) {
    this.pontoA = pontoA;
    this.pontoB = pontoB;
    this.n = this.calcularEixoRotacao();
    this.teta = teta;
    this.isRotacionando = isRotacionando;
  }
  
  double[] calcularEixoRotacao() {
    return this.normalizaVetor(this.calculaVetorEntre2Pontos(this.pontoA, this.pontoB));
  }
  
  double[] calculaVetorEntre2Pontos(Vertice pontoA, Vertice pontoB) {
    double vetorEntreOsPontos[] = {pontoB.getX() - pontoA.getX(), pontoB.getY() - pontoA.getY(), pontoB.getZ() - pontoA.getZ()};
    return vetorEntreOsPontos;
  }
  
  double[] normalizaVetor(double vetor[]) {
    double moduloDoVetor = this.moduloVetor(vetor);
    return this.multiplicaVetorPorEscalar(vetor, 1/moduloDoVetor);
  }

  double seno(double angulo){
    if(angulo == 0 || angulo == 180) return 0.0; //Tentando resolver um problema de representação numérica dos senos de 0 e 180 graus
    return Math.sin(Math.toRadians(angulo));
  }

  double cosseno(double angulo){
    if(angulo == 90 || angulo == 270) return 0.0; //Tentando resolver um problema de representação numérica dos cossenos de 90 e 270 graus
    return Math.cos(Math.toRadians(angulo));
  }

  double[] somaVetores(double vetor1[], double vetor2[]) {
    double resultado[] = {Double.NEGATIVE_INFINITY, Double.NEGATIVE_INFINITY, Double.NEGATIVE_INFINITY};
    if(vetor1.length != vetor2.length) return resultado; //ERRO
    for (int i = 0; i < vetor1.length; i++) {
      resultado[i] = vetor1[i] + vetor2[i];
    }
    return resultado;
  }

  double[] multiplicaVetorPorEscalar(double vetor[], double escalar){
    double resultado[] = new double[vetor.length];
    for (int i = 0; i < vetor.length; i++) {
      resultado[i] = vetor[i] * escalar;
    }
    return resultado;
  }

  double moduloVetor(double vetor[]) {
    double acumulador = 0;
    for (int i = 0; i < vetor.length; i++) {
      acumulador += vetor[i] * vetor[i];
    }
    return Math.sqrt(acumulador);
  }

  double anguloEntreVetores(double vetor1[], double vetor2[]){
    if(vetor1.length != vetor2.length) return -1; //ERRO
    double acumulador = 0;
    for (int i = 0; i < vetor1.length; i++) {
        acumulador += vetor1[i] * vetor2[i];
    }
    return Math.acos(acumulador / (moduloVetor(vetor1) * moduloVetor(vetor2)));
  }

  double produtoInterno(double vetor1[], double vetor2[]){
    //return moduloVetor(vetor1) * moduloVetor(vetor2) * cosseno(anguloEntreVetores(vetor1, vetor2));
    return vetor1[0] * vetor2[0] + vetor1[1] * vetor2[1] + vetor1[2] * vetor2[2];
  }

  double[] produtoVetorial(double vetor1[], double vetor2[]){
    double resultado[] = {Double.NEGATIVE_INFINITY, Double.NEGATIVE_INFINITY, Double.NEGATIVE_INFINITY};
    if(vetor1.length != vetor2.length) return resultado; //ERRO
    resultado[0] = (vetor1[1] * vetor2[2]) - (vetor1[2] * vetor2[1]);
    resultado[1] = (vetor1[2] * vetor2[0]) - (vetor1[0] * vetor2[2]);
    resultado[2] = (vetor1[0] * vetor2[1]) - (vetor1[1] * vetor2[0]);
    return resultado;
  }

  double[] QuaternioQVezesPontoPVezesQuaternioQConjugado (double r[], double v[], double s){
    double um[] = multiplicaVetorPorEscalar(r, (s * s));
    double dois[] =  multiplicaVetorPorEscalar(r, produtoInterno(v, v));
    double tres[] = multiplicaVetorPorEscalar(v, (2 * produtoInterno(v, r)));
    double quatro[] = produtoVetorial(multiplicaVetorPorEscalar(v, 2 * s), r);
    double somaUmMaisDois[] = somaVetores(um, multiplicaVetorPorEscalar(dois, -1));
    double somaTresMaisQuatro[] = somaVetores(tres, quatro);
    double resultadoFinal[] = somaVetores(somaUmMaisDois, somaTresMaisQuatro);
    return resultadoFinal;
  }
  
  double[] normalFace(Decagono3D dec, int face){
    double[] normal = {1,1,1};
    double[] atual = new double[3];
    if(face == 0 || face == 1){
      for(int i=(face*10)+1; i< 10+(face*10); i++){
        atual[0] = dec.vertices[i].getX() - dec.vertices[face*10].getX();
        atual[1] = dec.vertices[i].getY() - dec.vertices[face*10].getY();
        atual[2] = dec.vertices[i].getZ() - dec.vertices[face*10].getZ();
        /*normal[0] = normal[0] * atual[0];
        normal[1] = normal[1] * atual[1];
        normal[2] = normal[2] * atual[2];*/
        normal = produtoVetorial(normal, atual);
      }
    }
    else{
      int inicio, contador, contadorAtual=0;
      if (face == 2 || face == 7)
        inicio = 0;
      else if (face == 3)
        inicio = 1;
      else if (face == 4)
        inicio = 3;
      else if (face == 5)
        inicio = 5;
      else if (face == 6)
        inicio = 7;
      else if (face == 8)
        inicio = 2;
      else if (face == 9)
        inicio = 4;
      else if (face == 10)
        inicio = 6;
      else
        inicio = 8;
      
      if(face == 2 || face == 11)
        contador = inicio + 1;
      else
        contador = inicio + 2;
      
      while(contadorAtual < 3){
        atual[0] = dec.vertices[contador].getX() - dec.vertices[inicio].getX();
        atual[1] = dec.vertices[contador].getY() - dec.vertices[inicio].getY();
        atual[2] = dec.vertices[contador].getZ() - dec.vertices[inicio].getZ();
        normal = produtoVetorial(normal, atual);
        if(contadorAtual == 0)
          contador = inicio+10;
        else if(face == 2 || face == 11)
          contador += 1;
        else
          contador += 2;
        contadorAtual++;
      }
    }
    print("Normal da face " + face + "\n");
    for(int k=0; k<3; k++)
      print("Normal da posição " + k + " = " + normal[k] + "\n");
    return normal;
  }
  
  void rotacionarPorQuaternio(Vertice ponto, double n[], double teta) {

    //Vetor r do ponto original
    double r[] = new double[ponto.quantidadeDimensoes];

    //Transformando o ponto original em vetor (double)
    float pontoCoordenadas[] = ponto.coordenadas;

    for(int i = 0; i < ponto.quantidadeDimensoes; i++){
        r[i] = pontoCoordenadas[i];
    }

    double s =  cosseno(0.5 * teta);

    double v[] = multiplicaVetorPorEscalar(n, seno(0.5 * teta));

    //Vetor do ponto rotacionado
    double vetorPontoRotacionado[] = QuaternioQVezesPontoPVezesQuaternioQConjugado(r, v, s);

    //Atualizando as coordenadas do ponto original para as novas coordenadas (após a rotação)
    ponto.setX((float) vetorPontoRotacionado[0]);
    ponto.setY((float) vetorPontoRotacionado[1]);
    ponto.setZ((float) vetorPontoRotacionado[2]);
  }
  
  public void pintaFaceDecagono(Decagono3D decagono1, int face){
    float taxaX1, taxaX2, x1, x2, altura;
    // Faces frente e trás
    if(face == 0 || face == 1){
      taxaX1 = 1.2;
      taxaX2 = -1.2;
      x1 = decagono1.vertices[1].getX(); //Esse -6.5 representa o ponto inicial no eixo x logo depois da aresta desenhada. 
      x2 = decagono1.vertices[2].getX(); //Esse -5.5 representa o ponto inicial no eixo x logo depois da aresta desenhada.
      altura = decagono1.faces[face].arestas[1].vertices[1].getY();
      
      while(x1 < x2){
        line(x1, altura, decagono1.faces[face].arestas[0].vertices[0].getZ(), x2, altura, decagono1.faces[face].arestas[0].vertices[0].getZ());
        //o x inicial de cada vértice é variado por uma taxa para que consigam tudo o que está dentro das arestas dessa região
        x1+=taxaX1;
        x2+=taxaX2;
        //o y é sempre variado em 0.9, onde só precisei variar as taxas no eixo x
        altura-=0.9;
      }
      
      
      x1 = decagono1.vertices[3].getX();
        
      x2 = decagono1.vertices[4].getX();
      altura = decagono1.faces[face].arestas[3].vertices[1].getY();
      taxaX1 = 0.6;
      taxaX2 = -0.55;
      
      //Região formada pelos vértices 1, 2, 3 e 4, que forma um trapézio.
      //Aqui o ponto de parada é a altura porque as coordenadas x das arestas esquerda e direita nunca vão se encontrar nessa região.
      while(altura >= decagono1.faces[face].arestas[0].vertices[1].getY()){
        line(x1, altura, decagono1.faces[face].arestas[0].vertices[0].getZ(), x2, altura, decagono1.faces[face].arestas[0].vertices[0].getZ());
        x1+=taxaX1;
        x2+=taxaX2;
        altura-=0.9;
      }
      
      x1 = decagono1.vertices[5].getX();
        
      x2 = decagono1.vertices[6].getX();
      altura = decagono1.faces[face].arestas[5].vertices[1].getY(); 
      taxaX1 = 0;
      taxaX2 = 0;
      
      //Região formada pelos vértices 3, 4, 5 e 6, que forma um quadrilátero que possui as variações iguais no eixo x, como se fosse um retângulo em itálico.
      while(altura > decagono1.faces[face].arestas[2].vertices[1].getY()){
        line(x1, altura, decagono1.faces[face].arestas[0].vertices[0].getZ(), x2, altura, decagono1.faces[face].arestas[0].vertices[0].getZ());
        x1+=taxaX1;
        x2+=taxaX2;
        altura-=0.9;
      }
      
      x1 = decagono1.vertices[5].getX()+20;
      x2 = decagono1.vertices[6].getX()-20;
      altura = decagono1.faces[face].arestas[7].vertices[1].getY();
      taxaX1 = -0.625;
      taxaX2 = 0.625;
      
      //Região formada pelos vértices 5, 6, 7 e 8, que forma um trapézio invertido.
      while(altura > decagono1.faces[face].arestas[4].vertices[1].getY()){
        line(x1, altura, decagono1.faces[face].arestas[0].vertices[0].getZ(), x2, altura, decagono1.faces[face].arestas[0].vertices[0].getZ());
        x1+=taxaX1;
        x2+=taxaX2;
        altura-=0.9;
      }
      
      x1 = decagono1.vertices[7].getX();
      x2 = decagono1.vertices[8].getX();
      
      altura = decagono1.faces[face].arestas[6].vertices[1].getY();
      taxaX1 = 3.2;
      taxaX2 = -3.2;
      
      //Região formada pelos vértices 7, 8 e 9, que forma um triângulo invertido.
      while(x1 < x2){
        line(x1, altura, decagono1.faces[face].arestas[0].vertices[0].getZ(), x2, altura, decagono1.faces[face].arestas[0].vertices[0].getZ());
        x1+=taxaX1;
        x2+=taxaX2;
        altura+=0.9;
      }
    } //fim do if face=0 ou face=1
    else {
      // Faces laterais
      float z1, z2, y1, y2, taxaY1, taxaY2, taxaZ1, taxaZ2;
      taxaX1 = taxaX2 = taxaY1 = taxaY2 = 1; // inicializando varíaveis
      taxaZ1 = taxaZ2 = 0; // inicializando varíaveis
      switch (face) {
        case 2: 
          taxaX1 = -0.48;
          taxaX2 = -0.48;
          taxaY1 = 0.35;
          taxaY2 = 0.35;
          break;
        case 3: 
          taxaX1 = -0.24;
          taxaX2 = -0.24;
          taxaY1 = 0.35;
          taxaY2 = 0.35;
          break;
        case 4: 
          taxaX1 = 0.01;
          taxaX2 = 0.01;
          taxaY1 = 0.4;
          taxaY2 = 0.4;
          break;
        case 5: 
          taxaX1 = 0.14;
          taxaX2 = 0.14;
          taxaY1 = 0.2;
          taxaY2 = 0.2;
          break;
         //case 6:         
         // taxaX1 = 0.5;
         // taxaX2 = 0.5;
         // taxaY1 = 0.2;
         // taxaY2 = 0.2;
         // taxaZ1 = 0.5;
         // taxaZ2 = 0.3;
         // break;
        case 7:
          taxaX1 = 0.48;
          taxaX2 = 0.48;
          taxaY1 = 0.35;
          taxaY2 = 0.35;
          break;
        case 8:
          taxaX1 = 0.24;
          taxaX2 = 0.24;
          taxaY1 = 0.35;
          taxaY2 = 0.35;
          break;
        case 9:
          taxaX1 = 0.01;
          taxaX2 = 0.01;
          taxaY1 = 0.4;
          taxaY2 = 0.4;
          break;
        case 10:
          taxaX1 = -0.14;
          taxaX2 = -0.14;
          taxaY1 = 0.2;
          taxaY2 = 0.2;
          break;
        //case 11:         
        //  taxaX1 = -0.5;
        //  taxaX2 = -0.5;
        //  taxaY1 = 0.2;
        //  taxaY2 = 0.2;
        //  taxaZ1 = -0.5;
        //  taxaZ2 = -0.3;
        //  break;
        default:
          return;
      }
      x1 = decagono1.faces[face].arestas[0].vertices[0].getX();
      y1 = decagono1.faces[face].arestas[0].vertices[0].getY() + 1;
      z1 = decagono1.faces[face].arestas[0].vertices[0].getZ();
      x2 = decagono1.faces[face].arestas[0].vertices[1].getX();
      y2 = decagono1.faces[face].arestas[0].vertices[1].getY() + 1;
      z2 = decagono1.faces[face].arestas[0].vertices[1].getZ();
      float limiteY1 = decagono1.faces[face].arestas[2].vertices[0].getY() - taxaY1;
      float limiteY2 = decagono1.faces[face].arestas[2].vertices[1].getY() - taxaY2;
      if (face == 5) { 
        x1 += 3.5;
        x2 -= 1;
      } else if (face == 6) {
        x1 += 2.5;
        y1 -= 3;
        y2 -= 0.5;
        limiteY1 -= 0.5;
        limiteY2 -= 0.5;
      }
      while((y1 < limiteY1) && (y2 < limiteY2)) {
        line(x1, y1, z1, x2, y2, z2);
        x1 += taxaX1;
        x2 += taxaX2;
        if(y1 < decagono1.faces[face].arestas[2].vertices[0].getY() - taxaY1)
          y1 += taxaY1;
        if(y2 < decagono1.faces[face].arestas[2].vertices[1].getY())
          y2 += taxaY2;
        z1 += taxaZ1;
        z2 += taxaZ2;
      }
    }
  }
  
  double distancia(Decagono3D decagono, Vertice v){
    double resposta=0;
    
    resposta += v.getX() - decagono.vertices[10].getX();
    resposta += v.getY() - decagono.vertices[10].getY();
    resposta += v.getZ() - decagono.vertices[10].getZ();
    
    if(resposta==0)
      return 1;
    else
      return Math.abs(resposta);
  }
  
  void flatShading(Decagono3D decagono) {
    double[] intensidadeAmbiente = new double[3], intensidadeDifusa = new double[3];
    double coeficienteAmbiente = 1.0, coeficienteDifusa = 0.2;
    double[] resposta = {0, 0, 0};
    for(int i=0; i<12;i++){
      intensidadeAmbiente[0] = 50;
      intensidadeAmbiente[1] = 250;
      intensidadeAmbiente[2] = 150;
      intensidadeDifusa[0] = 50;
      intensidadeDifusa[1] = 250;
      intensidadeDifusa[2] = 150;
      for(int j=0; j<3;j++){
        intensidadeAmbiente[j] *= coeficienteAmbiente;
        print("Face " + i + "\n");
        print("Angulo: " + anguloEntreVetores(normalFace(decagono, i), pontoLuz));
        intensidadeDifusa[j] *= coeficienteDifusa * cosseno(anguloEntreVetores(normalFace(decagono, i), pontoLuz)); //cosseno é encontrado com a função de encontrar ângulo passando a normal da face e o ponto de luz
        intensidadeDifusa[j] /= Math.pow(distancia(decagono, decagono.faces[i].arestas[0].vertices[0]), 2);
        resposta[j] = intensidadeAmbiente[j] + intensidadeDifusa[j];
      }
      stroke(Math.round(resposta[0]), Math.round(resposta[1]), Math.round(resposta[2]));
      //print("Face " + i + "\n");
      //print("Red: " + Math.round(resposta[0]) + ", Green: " + Math.round(resposta[1]) + ", Blue: " + Math.round(resposta[2]) + "\n");
      pintaFaceDecagono(decagono, i);
    }
    stroke(0,0,0);
  }

  public void drawTela() {

    Aresta eixoRotacao = new Aresta(pontoA, pontoB);
    eixoRotacao.drawAresta();

    stroke(163, 16, 163);

    //Criando os vértices do Decágono 1
    Vertice pontaDoDecagono = new Vertice((this.pontoB.getX() + this.pontoA.getX())/2, (this.pontoB.getY() + this.pontoA.getY())/2, (this.pontoB.getZ() + this.pontoA.getZ())/2);

    Decagono3D decagono = new Decagono3D(pontaDoDecagono);
    Decagono3D decagono2 = new Decagono3D(new Vertice(1000, 700, 0), true);

    stroke(163, 16, 163);

    for (int i = 0; i < decagono.vertices.length; i++){
      if (this.isRotacionando) {
        System.out.println("--- Coordenadas do Ponto ANTES da ROTAÇÃO ---");
        System.out.println(decagono.vertices[i].getX());
        System.out.println(decagono.vertices[i].getY());
        System.out.println(decagono.vertices[i].getZ());
      }

      rotacionarPorQuaternio(decagono.vertices[i], n, teta);

      if (this.isRotacionando) {
        System.out.println("--- Coordenadas do Ponto APÓS a ROTAÇÃO ---");
        System.out.println(decagono.vertices[i].getX());
        System.out.println(decagono.vertices[i].getY());
        System.out.println(decagono.vertices[i].getZ());
      }
    }
    
    if (!this.isRotacionando) {
      this.flatShading(decagono2);
      decagono2.drawFigura();
    }
    
    decagono.drawFigura();

    fill(0, 0, 0);
    
  }

}
