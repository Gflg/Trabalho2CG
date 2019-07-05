public class TelaRotacaoQuaternio {
  
  Vertice pontoA, pontoB;

  double n[], teta;

  public TelaRotacaoQuaternio(Vertice pontoA, Vertice pontoB, double n[], double teta) {
    this.pontoA = pontoA;
    this.pontoB = pontoB;
    this.n = n;
    this.teta = teta;
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
    return Math.toDegrees(Math.acos(acumulador / (moduloVetor(vetor1) * moduloVetor(vetor2))));
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

  public void drawTela() {

    Aresta eixoRotacao = new Aresta(pontoA, pontoB);
    eixoRotacao.drawAresta();

    stroke(163, 16, 163);

    float[][] translacao = new float[3][3];

    //Criando os vértices do Decágono 1
    Vertice pontaDoDecagono = new Vertice(0, 0, 0);

    translacao[0][0] = 620;
    translacao[0][1] = 0;
    translacao[1][0] = 425;
    translacao[1][1] = 0;
    translacao[2][0] = 0;
    translacao[2][1] = 0;

    Decagono3D decagono = new Decagono3D(pontaDoDecagono);

    stroke(163, 16, 163);

    for (int i = 0; i < decagono.vertices.length; i++){
      decagono.moveVertice(i, translacao);
    }

    for (int i = 0; i < decagono.vertices.length; i++){
      System.out.println("--- Coordenadas do Ponto ANTES da ROTAÇÃO ---");
      System.out.println(decagono.vertices[i].getX());
      System.out.println(decagono.vertices[i].getY());
      System.out.println(decagono.vertices[i].getZ());

      rotacionarPorQuaternio(decagono.vertices[i], n, teta);

      System.out.println("--- Coordenadas do Ponto APÓS a ROTAÇÃO ---");
      System.out.println(decagono.vertices[i].getX());
      System.out.println(decagono.vertices[i].getY());
      System.out.println(decagono.vertices[i].getZ());
    }

    decagono.drawFigura();

    fill(0, 0, 0);
    
  }

}
