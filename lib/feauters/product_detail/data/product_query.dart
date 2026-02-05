const String productDetailQuery = r'''
query ProductDetail($handle: String!) {
  productByHandle(handle: $handle) {
    id
    title
    vendor
    descriptionHtml
    options {
      id
      name
      values
    }
    images(first: 10) {
      nodes {
        url
        altText
      }
    }
    variants(first: 50) {
      nodes {
        id
        availableForSale
        price {
          amount
          currencyCode
        }
        selectedOptions {
          name
          value
        }
        image {
        url
        altText
       }
      }
    }
  }
}
''';
