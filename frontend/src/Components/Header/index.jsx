import React from "react";
import { NavLink } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import * as sessionActions from "../../store/session";

const Header = () => {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);
  console.log(sessionUser);

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
      <>
        <NavLink to="/login">Login In</NavLink>
        <NavLink to="/signup">Sign Up</NavLink>
      </>
    );
  }

  return (
    <ul>
      <li>
        <NavLink to="/">Home</NavLink>
        {sessionLinks}
      </li>
    </ul>
  );
};

export default Header;
