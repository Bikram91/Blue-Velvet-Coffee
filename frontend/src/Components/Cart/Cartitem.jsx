import { useState } from "react";
import { useDispatch } from "react-redux";
import { removeCartItem, updateCartItem } from "../../store/cart_item";
import './Cart.css'

const CartItem = ({ cartItem }) => {
  const dispatch = useDispatch();
  let { quantity, productName, price } = cartItem;
  let [count, setCount] = useState(Number(quantity));
  const totalPricePerItem = price * quantity;
  const images = cartItem.imageUrl;

  const addQuantity = () => {
    dispatch(updateCartItem({ ...cartItem, quantity: (quantity += 1) }));
  };

  const subtractQuantity = () => {
    cartItem.quantity === 1
      ? dispatch(removeCartItem(cartItem.id))
      : dispatch(updateCartItem({ ...cartItem, quantity: (quantity -= 1) }));
  };

  if (!cartItem) return null;

  return (
    <>
      <div className="cart_item_wrapper">
          <picture>
            <img className="img" src={images} alt={productName} />
          </picture>
          <div className="cart_item_detail">
            <div className="cart_item_name">
              <h3>{productName}</h3>
            </div>
            <div className="quantity_price flex-row justify-between">
            <div className="quantity_button flex-row">
              <button onClick={subtractQuantity}> - </button>
              <input 
                className="cart_item_quantity"
                type="text"
                value={Number(quantity)}
                onChange={e => setCount(Number(e.target.value))}
                onBlur={() => dispatch(updateCartItem({...cartItem, quantity: Number(count)}))}
              />
              <button onClick={addQuantity}> + </button>
            </div>
            <p className="cart_subprice">{`$${totalPricePerItem}`}</p>
          </div>
          </div>
          <button className="cart-item-remove-btn" onClick={() => dispatch(removeCartItem(cartItem.id))}>
              <i className="fa-solid fa-xmark"></i>
            </button>
      </div>

    </>
  );
};

export default CartItem;
