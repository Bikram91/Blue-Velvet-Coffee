import csrfFetch from "./csrf";

const ADD_ITEMS = 'cartItem/ADD_ITEMS';
const ADD_ITEM = 'cartItem/ADD_ITEM';
const REMOVE_ITEM = 'cartItem/REMOVE_ITEM';

// ACTIONS
export const addItems = items => ({
  type: ADD_ITEMS,
  items
});

export const addItem = item => ({
  type: ADD_ITEM,
  item
});

export const removeItem = itemId => ({
  type: REMOVE_ITEM,
  itemId
})

// SELECTORS
export const loadCartItems = state => {
  return state.cartItems ? Object.values(state.cartItems) : [];
}


// THUNK
export const fetchCartItems = (userId) => async dispatch => {
  const res = await csrfFetch(`/api/cart_items?userId=${userId}`);

  if (res.ok) {
    const cartItems = await res.json();
    dispatch(addItems(cartItems));
  }

  return res;
}

export const createCartItem = cartData => async dispatch => {
  const res = await csrfFetch(`/api/cart_items`, {
    method: 'POST',
    body: JSON.stringify(cartData)
  });

  if (res.ok) {
    const newCartItem = await res.json();
    dispatch(addItem(newCartItem));
    return newCartItem;
  }
}

export const updateCartItem = cartData => async dispatch => {
  const {id} = cartData;
  const res = await csrfFetch(`/api/cart_items/${id}`, {
    method: 'PATCH',
    body: JSON.stringify({cartItem: cartData})
  });

  if (res.ok) {
    const updatedCartItem = await res.json();
    dispatch(addItem(updatedCartItem));
  }

  return res;
}

export const removeCartItem = (cartItemId) => async dispatch => {
  const res = await csrfFetch(`/api/cart_items/${cartItemId}`, {
    method: 'DELETE',
  });

  if (res.ok) {
    dispatch(removeItem(cartItemId));
  }

  return res;
}


// REDUCERS
const cartItemReducer = (state = {}, action) => {
  Object.freeze(state);

  switch(action.type) {
    case ADD_ITEMS:
      return action.items
    case ADD_ITEM:
      // const {id} = action.item;
      return {...state, [action.item.id]: action.item};
    case REMOVE_ITEM:
      const nextState = {...state}
      delete nextState[action.itemId];
      return nextState;
    default:
      return state;
  }
}

export default cartItemReducer;