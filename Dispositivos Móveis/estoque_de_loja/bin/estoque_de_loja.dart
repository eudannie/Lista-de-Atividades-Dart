import 'dart:io';

// Menu de opções
void exibirMenu() {
  print("\nEscolha uma opção:");
  print("1. Cadastrar Produto");
  print("2. Listar Produtos Cadastrados");
  print("3. Excluir Produtos Cadastrados");
  print("4. Adicionar e Remover Quantidades de Produtos");
  print("5. Sair");
}

class CadastrarProduto {
  String nome;
  String quantidade;
  String preco;

  CadastrarProduto(this.nome, this.quantidade, this.preco);
}

////////////////////////////////////////////////////////////////////////////////////////////

void main() {
  List<CadastrarProduto> cadastro = [];

  while (true) {
    exibirMenu(); // Exibe o menu

    // Lê a opção escolhida pelo usuário e converte para int
    String? input = stdin.readLineSync();
    if (input == null) continue;
    int opcao = int.parse(input);

    switch (opcao) {
      case 1: // Cadastrar produto
        print("Nome do produto:");
        String? nome = stdin.readLineSync();

        print("Quantidade inicial:");
        String? quantidade = stdin.readLineSync();

        print("Preço:");
        String? preco = stdin.readLineSync();
        int precoInt = int.parse(preco!); // Convertendo o preço para int

        cadastro.add(CadastrarProduto(nome!, quantidade!, preco!));
        break;

////////////////////////////////////////////////////////////////////////////////////////////

      case 2: // Listar produtos cadastrados
        if (cadastro.isEmpty) {
          print("Nenhum produto foi cadastrado até agora.");
        } else {
          print("\nProdutos cadastrados:");
          for (int i = 0; i < cadastro.length; i++) {
            print("Produto ${i + 1}:");
            print("Nome do produto: ${cadastro[i].nome}");
            print("Preço: ${cadastro[i].preco}");
            print("----------");
          }
        }
        break;

////////////////////////////////////////////////////////////////////////////////////////////

      case 3: // Excluir produtos cadastrados
        if (cadastro.isEmpty) {
          print("Não há produtos para excluir.");
        } else {
          print("\nEscolha o número do produto para excluir:");
          for (int i = 0; i < cadastro.length; i++) {
            print("${i + 1}. ${cadastro[i].nome}");
          }
          String? inputExcluir = stdin.readLineSync();
          int produtoExcluir = int.parse(inputExcluir!);

          if (produtoExcluir < 1 || produtoExcluir > cadastro.length) {
            print("Número do produto inválido.");
          } else {
            cadastro.removeAt(produtoExcluir - 1); // Remove o produto da lista
            print("Produto excluído com sucesso.");
          }
        }
        break;

////////////////////////////////////////////////////////////////////////////////////////////

      case 4: // Adicionar e Remover quantidade de produtos
        if (cadastro.isEmpty) {
          print("Não há produtos cadastrados para alterar a quantidade.");
        } else {
          print("\nEscolha o número do produto para adicionar ou remover quantidade:");
          for (int i = 0; i < cadastro.length; i++) {
            print("${i + 1}. ${cadastro[i].nome}");
          }
          String? inputAlterarQuantidade = stdin.readLineSync();
          int produtoAlterar = int.parse(inputAlterarQuantidade!);

          if (produtoAlterar < 1 || produtoAlterar > cadastro.length) {
            print("Número do produto inválido.");
          } else {
            print("Quantas unidades deseja adicionar/remover?");
            String? quantidadeAlterar = stdin.readLineSync();
            int quantidadeInt = int.parse(quantidadeAlterar!);

            int novaQuantidade = int.parse(cadastro[produtoAlterar - 1].quantidade) + quantidadeInt;

            // Atualiza a quantidade
            cadastro[produtoAlterar - 1].quantidade = novaQuantidade.toString();
            print("Quantidade atualizada com sucesso.");
          }
        }
        break;

////////////////////////////////////////////////////////////////////////////////////////////

      case 5: // Sair
        print("Saindo...");
        return; // Encerra o programa

      default: // Se não for nenhuma das opções
        print("Opção inválida! Por favor, escolha uma opção válida.");
        break;
    }
  }
}
