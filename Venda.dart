import 'Cliente.dart';
import 'Produto.dart';
import 'VendaItem.dart';

class Venda {
  Cliente? cliente; 
  List<VendaItem> itens;

  Venda({this.cliente, this.itens = const []});

  double get valorTotal {
    if (itens.isEmpty) return 0.0;
    return itens
        .map((item) => item.preco * item.quantidade)
        .reduce((t, a) => t + a);
  }


  static Venda criarPedidoComTresProdutos({
    required Cliente cliente,
    required List<Produto> produtos,
  }) {
    if (produtos.length != 3) {
      throw ArgumentError('A lista de produtos deve conter exatamente 3 itens.');
    }

    List<VendaItem> itens = produtos.map((produto) => VendaItem(produto: produto)).toList();

    return Venda(cliente: cliente, itens: itens);
  }

}
