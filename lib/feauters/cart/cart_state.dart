class CartState {
  final String? cartId;
  final int totalQuantity;
  final bool isLoading;

  const CartState({
    this.cartId,
    required this.totalQuantity,
    required this.isLoading,
  });

  factory CartState.initial() {
    return const CartState(cartId: null, totalQuantity: 0, isLoading: false);
  }

  CartState copyWith({String? cartId, int? totalQuantity, bool? isLoading}) {
    return CartState(
      cartId: cartId ?? this.cartId,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
