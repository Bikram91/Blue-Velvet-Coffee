import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link } from "react-router-dom";
import { fetchCartItems } from "../../store/cart_item";
import { Modal } from "../../context/Modal";
import CartItem from "./Cartitem";
import Checkout from "./Checkout";
import "./Cart.css"

const Cart = ({ showModal, setShowModal }) => {
  const dispatch = useDispatch();
  const [showCheckout, setShowCheckout] = useState(false);
  const [hideCart] = useState(false);

  const cartItems = useSelector((state) => Object.values(state.cartItems));
  const sessionUser = useSelector((state) => state.session.user);

  useEffect(() => {
    dispatch(fetchCartItems(sessionUser.id));
  }, [dispatch, cartItems.length, sessionUser.id]);

  const subtotal = () => {
    if (cartItems) {
      const priceQuantity = cartItems.map((item) => item.price * item.quantity);
      return priceQuantity.reduce((a, b) => a + b).toFixed(2);
    }
  };

  if (!cartItems || !cartItems.length) {
    return (
      <div className="empty_cart flex-col">
        <i
          className="fa-solid fa-xmark"
          onClick={() => setShowModal(false)}
        ></i>
        <div className="empty_cart_content text-center">
          <br />
          <br />
          <h1>Your cart is empty!</h1>
          <br />
          <br />
          <h4>
          Continue shopping
          <br />
          <br />
          <button className="empty_cart_shop_btn">
          <Link
            onClick={() => setShowModal(false)}
            to="/collection/coffee"
            className={`btn flex-col align-center`}
          >
            All Coffee
          </Link>
          </button>
          <br />
          <button className="empty_cart_shop_btn">
          <Link
            to="/collection/drinkware"
            onClick={() => setShowModal(false)}
            className={`btn flex-col align-center`}
          >
            Drinkware
          </Link>
          </button>
          </h4>
        </div>
      </div>
    );
  }

  return (
    <>
      <div className={`cart flex-col ${hideCart ? "hide-modal" : ""}`}>
        <i
          className="fa-solid fa-xmark"
          onClick={() => setShowModal(false)}
        ></i>
        <div className="cart_content">
          <h1>Your Cart</h1>
          <ul className="">
            {cartItems.map((cartItem, idx) => (
              <CartItem key={idx} cartItem={cartItem} />
            ))}
          </ul>
        </div>
      </div>

      <div className="cart_total">
        <h2>Subtotal: ${subtotal()}</h2>
        <button
          className="checkout-btn"
          onClick={() => {
            setShowCheckout(true);
          }}>
          CHECKOUT
        </button>
      </div>
      
      {showCheckout && (
        <div className="checkout_modal_wrapper">
          <Modal onClose={() => setShowCheckout(false)}>
            <Checkout showModal={showModal} setShowModal={setShowModal} />
          </Modal>
        </div>
      )}
    </>
  );
};

export default Cart;
