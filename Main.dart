

import 'Cliente.dart';
import 'Produto.dart';
import 'Venda.dart';


void main() {
  // Criando um cliente
  var cliente = Cliente(nome: "Maria Oliveira", cpf: "987.654.321-00");

  // Criando 3 produtos
  var produto1 = Produto(codigo: 101, nome: "Caneta Azul", preco: 2.50, desconto: 10);
  var produto2 = Produto(codigo: 102, nome: "Caderno 100 Folhas", preco: 15.00, desconto: 5);
  var produto3 = Produto(codigo: 103, nome: "Borracha", preco: 1.00, desconto: 0);

  // Lista com exatamente 3 produtos
  List<Produto> produtos = [produto1, produto2, produto3];

  // Criando o pedido com 3 produtos usando o método
  try {
    var pedido = Venda.criarPedidoComTresProdutos(cliente: cliente, produtos: produtos);

    // Exibindo os detalhes do pedido
    print("Pedido criado para ${pedido.cliente?.nome} (CPF: ${pedido.cliente?.cpf}):");
    for (var item in pedido.itens) {
      print("- ${item.produto.nome}: R\$ ${item.preco.toStringAsFixed(2)} x ${item.quantidade} = R\$ ${(item.preco * item.quantidade).toStringAsFixed(2)}");
    }
    print("Valor total do pedido: R\$ ${pedido.valorTotal.toStringAsFixed(2)}");
  } catch (e) {
    print("Erro ao criar o pedido: $e");
  }
}