import React from "react";
// import { NavLink } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import * as sessionActions from "../../store/session";
import { Link } from "react-router-dom";
import "./Header.css";
// import loginicon from '../../Assets/Header/account.svg';
import LoginFormModal from "../account_forms/LoginModal";
// import SignUpFormModal from "../account_forms/SignUpFormModal";

import mainlogo from "../../Assets/Header/blue-bottle-coffee-logo.svg";

const Header = () => {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);

  const logoutUser = (e) => {
    e.preventDefault();
    dispatch(sessionActions.logoutUser());
  };

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
      <div>
        {/* <Link to="/login"> */}
        <LoginFormModal />
        {/* </Link> */}
      </div>
    );
  }

  return (
    <header>
      <div className="header-div">
        <div className="header-links">
          <div className="dropdown">
            <Link to="#">SHOP</Link>
          </div>

          <div>
            <Link to="#">HOLIDAY</Link>
          </div>

          <div>
            <Link to="#">LEARN</Link>
          </div>
        </div>

        <div className="logo">
          <Link to="/"><img src={mainlogo}/></Link>
        </div>

        <div className="icon-bar">{sessionLinks}</div>
      </div>
    </header>
  );
};

export default Header;
