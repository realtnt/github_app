import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/models/product.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  // initial value
  @override
  Set<Product> build() {
    return {};
  }

  // methods to update state
  void addProduct(Product product) {
    // if (!state.contains(product)) {
    state = {...state, product};
    // }
  }

  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toSet();
  }
}

@riverpod
int cartTotal(ref) {
  final Set<Product> cartProducts = ref.watch(cartNotifierProvider);
  return cartProducts
      .map((p) => p.price)
      .reduce((value, element) => value + element);
}
