import 'Cliente.dart';
import 'Produto.dart';
import 'VendaItem.dart';

class Venda {
  Cliente? cliente; // Nullable, pois uma venda pode não ter cliente associado
  List<VendaItem> itens;

  Venda({this.cliente, this.itens = const []});

  double get valorTotal {
    if (itens.isEmpty) return 0.0;
    return itens
        .map((item) => item.preco * item.quantidade)
        .reduce((t, a) => t + a);
  }

  // Método implementado para receber um pedido com 3 produtos
  // Este método cria uma nova Venda com 3 VendaItems, cada um associado a um Produto
  // e uma quantidade padrão de 1. Retorna a Venda criada.
  static Venda criarPedidoComTresProdutos({
    required Cliente cliente,
    required List<Produto> produtos, // Deve fornecer exatamente 3 produtos
  }) {
    if (produtos.length != 3) {
      throw ArgumentError('A lista de produtos deve conter exatamente 3 itens.');
    }

    List<VendaItem> itens = produtos.map((produto) => VendaItem(produto: produto)).toList();

    return Venda(cliente: cliente, itens: itens);
  }
}