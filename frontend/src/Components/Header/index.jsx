import React from "react";
import { useDispatch, useSelector } from "react-redux";
import * as sessionActions from "../../store/session";
import { Link } from "react-router-dom";
import "./Header.css";
import LoginFormModal from "../account_forms/LoginModal";
import SearchBar from "../Search/SearchBar";
import SignUpFormModal from "../account_forms/SignUpFormModal";

import mainlogo from "../../Assets/Header/blue-bottle-coffee-logo.svg";
import DropDown from "./HeaderDropdown";
import { useState } from "react";
import Cart from "../Cart";
import { Modal } from "../../context/Modal";
import { loadCartItems } from "../../store/cart_item";
import cartimg from "../../Assets/Header/car.svg";

const Header = () => {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);
  //
  const cartItems = useSelector(loadCartItems);
  //

  const [showModal, setShowModal] = useState(false);
  const calculateNumItems = () => {
    let num = cartItems.reduce((acc, ele) => acc + ele.quantity, 0);
    if (sessionUser) {
      return num;
    } else {
      return 0;
    }
  };

  const logoutUser = (e) => {
    e.preventDefault();
    dispatch(sessionActions.logoutUser());
  };

  const handleDemoLogin = (e) => {
    e.preventDefault();
    dispatch(
      sessionActions.loginUser({ email: "demo@user.io", password: "password" })
    );
  };

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = (
      <div className="login">
        <p>Hello {sessionUser.email}</p>
      <button onClick={logoutUser}>Log Out</button>
  </div>
    );
  } else {
    sessionLinks = (
        <div className="login">
          <LoginFormModal />
          <SignUpFormModal />
          <Link to="#" onClick={handleDemoLogin}>
            Demo Login
          </Link>
      </div>
    );
  }

  return (
    <>
      <header>
        <div className="header-div">
          <div className="header-links">
            <div className="All-nav">
              <nav className="dropdown">
                <div>
                  <Link to="#">SHOP</Link>
                </div>
                <DropDown />
              </nav>

              <div>
                <Link to="/collection/instant">INSTANT</Link>
              </div>

              <div className="search">
                <SearchBar />
              </div>
            </div>
          </div>

          <div className="logo">
            <Link to="/">
              <img src={mainlogo} />
            </Link>
          </div>


          <div className="right-part-of-header">
          
          <div className="user-logo">
          <nav className="dropdown2">
          <div>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="22.025"
            height="22.569"
          >
            <g
              fill="none"
              stroke="#000"
              strokeWidth="1.2"
              data-name="Group 3487"
              transform="translate(-6727.993 -62.4)"
            >
              <circle
                cx="6.5"
                cy="6.5"
                r="6.5"
                data-name="Ellipse 71"
                transform="translate(6732.774 63)"
              />
              <path
                d="M6728.5 84.556s3.051-4.826 5.769-5.713l4.715 5.214 4.382-5.214a11.048 11.048 0 0 1 6.1 5.713"
                data-name="Path 709"
              />
            </g>
          </svg>
        
          </div>
          {sessionLinks}
          </nav>
          
          </div>

          <div id="cart-link">
            <img className="cart-svg" src={cartimg} onClick={() => setShowModal(true)} />
            <div className="items-quantity">{calculateNumItems()}</div>
          </div>
        </div>
        </div>
      </header>

      {showModal && (
        <div className="cart_modal_wrapper">
          <Modal onClose={() => setShowModal(false)}>
            {sessionUser ? (
              <Cart showModal={showModal} setShowModal={setShowModal} />
            ) : (
              <div className="cart_modal_login">
                <i
                  className="fa-solid fa-xmark"
                  onClick={() => setShowModal(false)}
                ></i>
                <div className="cart_modal_login_content">
                  <h1>Your cart</h1>
                  <br /><br />
                  <p>Login to see your cart items</p>
                  <br /><br />
                  <div id="cart-login">
                    <LoginFormModal />
                  </div>
                </div>
              </div>
            )}
          </Modal>
        </div>
      )}
    </>
  );
};

export default Header;
