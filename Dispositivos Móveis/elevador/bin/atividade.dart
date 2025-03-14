import 'dart:io';

void mostrarAndarAtual(int andarAtual, String status) {
  print("Você está no andar $andarAtual. Movimento: $status.");
}

// Menu de opções
void exibirMenu() {
  print("\nEscolha uma opção:");
  print("1. Subir para um andar superior");
  print("2. Descer para um andar inferior");
  print("3. Verificar o andar atual");
  print("4. Sair.");
}

void main() {
  int andarAtual = 1; // Começa no andar 1

  while (true) {
    exibirMenu(); // Exibe o menu

    // Lê a opção escolhida pelo usuário e converte para int
    String? input = stdin.readLineSync();
    int opcao = int.parse(input!);


    switch (opcao) {
      case 1: // Subir andar
        print("Para qual andar você deseja subir? (2-10)");
        String? inputSubir = stdin.readLineSync();
        int andarDesejadoSubir = int.parse(inputSubir!);

        // Valida se o andar desejado está no intervalo de 2 a 10
        if (andarDesejadoSubir > andarAtual && andarDesejadoSubir <= 10) {
          // Subida
          for (int i = andarAtual; i <= andarDesejadoSubir; i++) {
            mostrarAndarAtual(i, "subindo");
          }

          andarAtual = andarDesejadoSubir; // Atualiza o andar atual

        } else {
          print("Você não pode subir para esse andar ou o andar desejado é inválido.");
        }
        break;


      case 2: // Descer para um andar inferior
        print("Para qual andar você deseja descer? (1-9)");
        String? inputDescer = stdin.readLineSync();
        int andarDesejadoDescer = int.parse(inputDescer!);

        // Valida se o andar desejado está no intervalo de 1 a 9 e é inferior ao atual
        if (andarDesejadoDescer < andarAtual && andarDesejadoDescer >= 1) {
          // Descida
          for (int i = andarAtual; i >= andarDesejadoDescer; i--) {
            mostrarAndarAtual(i, "descendo");
          }
          andarAtual = andarDesejadoDescer; // Atualiza o andar atual
        } else {
          print("Você não pode descer para esse andar ou o andar desejado é inválido.");
        }
        break;


      case 3: // Verificar o andar atual
        print("Você está no andar $andarAtual.");
        break;


      case 4: // Sair
        print("Saindo...");
        return; // Encerra o programa


      default:
        print("Opção inválida! Por favor, escolha uma opção válida.");
        break;
    }
  }
}
