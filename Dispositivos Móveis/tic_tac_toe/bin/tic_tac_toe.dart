import 'dart:io';

void main() {
  while (true) {
    List<List<String>> tabuleiro = [
      [' 1 ', ' 2 ', ' 3 '],
      [' 4 ', ' 5 ', ' 6 '],
      [' 7 ', ' 8 ', ' 9 '],
    ];

    String jogadorAtual = 'X';
    bool jogoEmAndamento = true;

    while (jogoEmAndamento) {
      exibirTabuleiro(tabuleiro);

      print('Jogador $jogadorAtual, escolha um número (1-9) para fazer sua jogada:');
      String? input = stdin.readLineSync();

      if (input == null || !validarEntrada(input)) {
        print('Entrada inválida. Tente novamente.');
        continue;
      }

      int posicao = int.parse(input);
      if (!fazerJogada(tabuleiro, posicao, jogadorAtual)) {
        print('Essa posição já está ocupada. Tente novamente.');
        continue;
      }

      // Verifica se alguém ganhou
      if (verificarVitoria(tabuleiro, 'X')) {
        exibirTabuleiro(tabuleiro);
        print('Jogador X venceu!');
        jogoEmAndamento = false;
      } else if (verificarVitoria(tabuleiro, 'O')) {
        exibirTabuleiro(tabuleiro);
        print('Jogador O venceu!');
        jogoEmAndamento = false;
      } else if (verificarEmpate(tabuleiro)) {
        exibirTabuleiro(tabuleiro);
        print('Empate!');
        jogoEmAndamento = false;
      }

      // Muda o jogador de X para O
      jogadorAtual = (jogadorAtual == 'X') ? 'O' : 'X';
    }

    // Pergunta se o jogador quer jogar mais uma vez
    print('Deseja jogar novamente?\nSim\nNão\n');
    String? jogarNovamente = stdin.readLineSync();
    if (jogarNovamente?.toLowerCase() != 'Sim') {
      print('Obrigado por jogar!');
      break;
    }
  }
}

void exibirTabuleiro(List<List<String>> tabuleiro) {
  print('-------------------');
  for (int i = 0; i < 3; i++) {
    print('| ${tabuleiro[i][0]} | ${tabuleiro[i][1]} | ${tabuleiro[i][2]} |');
    if (i < 2) print('-------------------');
  }
  print('-------------------\n');
}

bool validarEntrada(String entrada) {
  // Checa se os números inseridos são de 1 a 9)
  int? numero = int.tryParse(entrada);
  return numero != null && numero >= 1 && numero <= 9;
}

bool fazerJogada(List<List<String>> tabuleiro, int posicao, String jogador) {
  // Procura o número para a posição no tabuleiro
  int linha = (posicao - 1) ~/ 3;
  int coluna = (posicao - 1) % 3;

  // Verifica se a posição está disponível para colocar o X ou O no lugar
  if (tabuleiro[linha][coluna] != ' X ' && tabuleiro[linha][coluna] != ' O ') {
    tabuleiro[linha][coluna] = ' $jogador ';
    return true;
  }
  return false;
}

bool verificarVitoria(List<List<String>> tabuleiro, String jogador) {
  // Verifica linhas, colunas e diagonais para dar declarar vitória ou velha
  for (int i = 0; i < 3; i++) {
    // Verifica linha e coluna
    if ((tabuleiro[i][0] == ' $jogador ' && tabuleiro[i][1] == ' $jogador ' && tabuleiro[i][2] == ' $jogador ') || 
        (tabuleiro[0][i] == ' $jogador ' && tabuleiro[1][i] == ' $jogador ' && tabuleiro[2][i] == ' $jogador ')) {
      return true;
    }
  }

  // Verifica as diagonais
  if ((tabuleiro[0][0] == ' $jogador ' && tabuleiro[1][1] == ' $jogador ' && tabuleiro[2][2] == ' $jogador ') || 
      (tabuleiro[0][2] == ' $jogador ' && tabuleiro[1][1] == ' $jogador ' && tabuleiro[2][0] == ' $jogador ')) {
    return true;
  }

  return false;
}

bool verificarEmpate(List<List<String>> tabuleiro) {
  // Verifica se todas as posições foram preenchidas
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (tabuleiro[i][j] != ' X ' && tabuleiro[i][j] != ' O ') {
        return false; // A partida ainda pode continuar
      }
    }
  }
  return true; // Não há mais movimentos possíveis, é empate
}
