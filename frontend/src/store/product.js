import csrfFetch from "./csrf";

const GET_PRODUCTS = 'products/GET_PRODUCTS';
const GET_PRODUCT = 'products/GET_PRODUCT';
const REMOVE_PRODUCTS = 'products/REMOVE_PRODUCTS';

export const getProducts = products => ({
  type: GET_PRODUCTS,
  products
})

export const getProduct = product => ({
  type: GET_PRODUCT,
  product
})

export const removeProducts = () => ({
  type: REMOVE_PRODUCTS
})

export const loadProducts = state => {
  return state.products ? Object.values(state.products) : [];
}

export const loadProduct = productId => state => {
  return state.products ? state.products[productId] : null;
}

export const fetchProducts = () => async dispatch => {
  const res = await csrfFetch(`/api/products`);

  if (res.ok) {
    const products = await res.json();
    dispatch(getProducts(products));
  }
}

export const fetchProduct = productId => async dispatch => {
  const res = await csrfFetch(`/api/products/${productId}`);

  if (res.ok) {
    const product = await res.json();
    dispatch(getProduct(product));
  }
}

export const fetchCategory = category => async dispatch => {
  const res = await csrfFetch(`/api/products?category=${category}`);

  if (res.ok) {
    const product = await res.json();
    dispatch(getProducts(product));
  }
}

export const searchProducts = query => async dispatch => {
  const res = await csrfFetch(`/api/products/search/${query}`);

  if (res.ok) {
    const products = await res.json();
    dispatch(getProducts(products));
  }
}

const productsReducer = (state = {}, action) => {
  Object.freeze(state);

  switch(action.type) {
    case GET_PRODUCTS:
      return action.products;
    case GET_PRODUCT:
      return {...state, [action.product.id]: action.product};
    default:
      return state;
  }
}

export default productsReducer;

