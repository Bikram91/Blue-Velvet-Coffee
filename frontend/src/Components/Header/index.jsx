import React from "react";
// import { NavLink } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import * as sessionActions from "../../store/session";
import { Link } from "react-router-dom";
import "./Header.css";
// import loginicon from '../../Assets/Header/account.svg';
import LoginFormModal from "../account_forms/LoginModal";

import SignUpFormModal from "../account_forms/SignUpFormModal";

import mainlogo from "../../Assets/Header/blue-bottle-coffee-logo.svg";
import DropDown from "./HeaderDropdown";
import { useState } from "react";

const Header = () => {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);

  const logoutUser = (e) => {
    e.preventDefault();
    dispatch(sessionActions.logoutUser());
  };


  const handleDemoLogin = (e) => {
    e.preventDefault();
    dispatch(sessionActions.loginUser({email: 'demo@user.io', password: 'password'}))
  }

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = (
      <>
        <p>Hello {sessionUser.email}</p>
        <button onClick={logoutUser}>Log Out</button>
      </>
    );
  } else {
    sessionLinks = (
      
      <div className="dropdown-login">
        <div className="login">
        <svg xmlns="http://www.w3.org/2000/svg" width="22.025" height="22.569"><g fill="none" stroke="#000" strokeWidth="1.2" data-name="Group 3487" transform="translate(-6727.993 -62.4)"><circle cx="6.5" cy="6.5" r="6.5" data-name="Ellipse 71" transform="translate(6732.774 63)"/><path d="M6728.5 84.556s3.051-4.826 5.769-5.713l4.715 5.214 4.382-5.214a11.048 11.048 0 0 1 6.1 5.713" data-name="Path 709"/></g></svg>
        <LoginFormModal />
        <SignUpFormModal />
        <Link to="#" onClick={handleDemoLogin}>Demo Login</Link>
        </div>
      </div>
    );
  }

  return (
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
              <Link to="#">HOLIDAY</Link>
            </div>

            <div className="learn">
              <Link to="#">LEARN</Link>
            </div>
          </div>
        </div>

        <div className="logo">
          <Link to="/">
            <img src={mainlogo} />
          </Link>
        </div>

        <div>{sessionLinks}</div>
      </div>
    </header>
  );
};

export default Header;
