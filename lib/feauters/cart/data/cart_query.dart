const String cartCreateMutation = r'''
mutation CartCreate($lines: [CartLineInput!]) {
  cartCreate(input: { lines: $lines }) {
    cart {
      id
      totalQuantity
    }
    userErrors {
      field
      message
    }
  }
}
''';

const String cartLinesAddMutation = r'''
mutation CartLinesAdd($cartId: ID!, $lines: [CartLineInput!]!) {
  cartLinesAdd(cartId: $cartId, lines: $lines) {
    cart {
      id
      totalQuantity
    }
    userErrors {
      field
      message
    }
  }
}
''';
