import React from "react";
// import { NavLink } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import * as sessionActions from "../../store/session";
import {Link } from "react-router-dom";
import "./Header.css"
// import loginicon from '../../Assets/Header/account.svg';
import LoginFormModal from "../account_forms/LoginModal";
// import SignUpFormModal from "../account_forms/SignUpFormModal";
// import account from '../../Assets/Header/account.svg';



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
        <h1>Hello {sessionUser.email}</h1>
        <button onClick={logoutUser}>Log Out</button>
      </>
    );
  } else {
    sessionLinks = (
      <div>
        
        
        <Link to="/login" >
          <LoginFormModal />
        </Link> 
        

     
      </div>
    );
  }

  
  return (
    <header>
        <div className="icon">
            <Link to="/">Home</Link>
       
        <div className="login">
            {sessionLinks}
            
        </div>
        </div>
    </header>
  );
};

export default Header;
