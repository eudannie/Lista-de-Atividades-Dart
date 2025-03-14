import 'dart:io';

// Menu de opções
void exibirMenu() {
  print("\nEscolha uma opção:");
  print("1. Incluir tarefas");
  print("2. Listar todas as tarefas");
  print("3. Excluir tarefa");
  print("4. Sair");
}

void exibirMenuDois() {
print("\nDeseja adicionar mais uma tarefa?:");
print("1. Sim.");
print("2. Nao.");
}

class Tarefa {
  String titulo;
  String descricao;
  String urgencia;

  Tarefa(this.titulo, this.descricao, this.urgencia);
}

void main() {
  List<Tarefa> tarefas = [];

  while (true) {
    exibirMenu(); // Exibe o menu

    // Lê a opção escolhida pelo usuário e converte para int
    String? input = stdin.readLineSync();
    int opcao = int.parse(input!);


    switch (opcao) {
      case 1: // Criar
      print("Título da tarefa:");
      String? titulo = stdin.readLineSync();

      print("Descrição:");
      String? descricao = stdin.readLineSync();

      print("Grau de urgência (ex: Alta, Média, Baixa):");
      String? urgencia = stdin.readLineSync();

      tarefas.add(Tarefa(titulo!, descricao!, urgencia!));

      exibirMenuDois(); // Exibe o menu
      String? inputDois = stdin.readLineSync();
      int opcaoDois = int.parse(inputDois!);

      // Lê a opção escolhida pelo usuário e converte para int
      String? input = stdin.readLineSync();
      int opcaodois = int.parse(input!);



        if (opcaoDois == 2) {
          // Se a resposta for não, volta para o menu principal
          break;
        }
        break;


      case 2: // Listar
        if (tarefas.isEmpty) {
            print("Nenhuma tarefa cadastrada.");
          } else {
            print("\nLista de tarefas:");
            for (int i = 0; i < tarefas.length; i++) {
              print("Tarefa ${i + 1}:");
              print("Título: ${tarefas[i].titulo}");
              print("Descrição: ${tarefas[i].descricao}");
              print("Urgência: ${tarefas[i].urgencia}");
              print("----------");
            }
          }
          break;


      case 3: // Excluir
        if (tarefas.isEmpty) {
            print("Não há tarefas para excluir.");
          } else {
            print("\nEscolha o número da tarefa para excluir:");
            for (int i = 0; i < tarefas.length; i++) {
              print("${i + 1}. ${tarefas[i].titulo}");
            }
            String? inputExcluir = stdin.readLineSync();
            int tarefaExcluir = int.parse(inputExcluir!);

            if (tarefaExcluir < 1 || tarefaExcluir > tarefas.length) {
              print("Número de tarefa inválido.");
            } else {
              tarefas.removeAt(tarefaExcluir - 1); // Remove a tarefa da lista
              print("Tarefa excluída com sucesso.");
            }
          }
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