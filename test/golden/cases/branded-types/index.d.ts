// Primitive branded types are nominal at compile time but remain primitives at runtime.
type JsxElement = { __brand: 'element' }

type UserId = string & { readonly __brand: 'user' }
type Count = number & { readonly __brand: 'count' }
type Token = string & { readonly __brand: 'token' }

export declare const BrandedTypes: (props: {
  userId: UserId
  count: Count
  token: Token
}) => JsxElement

export declare function lookupToken(userId: UserId, count: Count): Token
