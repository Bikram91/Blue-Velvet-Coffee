import { useDispatch, useSelector } from "react-redux";
import { Link, useHistory } from "react-router-dom";
import { removeCartItem } from "../../store/cart_item";
import "./Cart.css";

const Checkout = ({ setShowModal }) => {
  const dispatch = useDispatch();
  const history = useHistory();
  const cartItems = useSelector((state) => Object.values(state.cartItems));

  const emptyCart = () => {
    history.push("/");
    cartItems.map((cartItem) => dispatch(removeCartItem(cartItem.id)));
    setShowModal(false);
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  return (
    <div className="checkout_modal flex-col">
      <i className="fa-solid fa-xmark" onClick={emptyCart}></i>
      <div className="flex-col align-center">
        <h1>Thank you</h1>
        <p className="checkout">
          {"for checking out my website!".toUpperCase()}
        </p>
        <p>Feel free to check out my links to see another project.</p>
        <div className="checkout_link">
          <Link
            to={{ pathname: "https://github.com/Bikram91" }}
            target="_blank"
          >
            <i className="fa-brands fa-github"></i>
          </Link>
          <Link
            to={{ pathname: "https://www.linkedin.com/in/bikramjit-singh-153614140/" }}
            target="_blank"
          >
            <i className="fa-brands fa-linkedin"></i>
          </Link>
        </div>
        <p className="go_main" onClick={emptyCart}>
          Home page
        </p>
      </div>
    </div>
  );
};

export default Checkout;
