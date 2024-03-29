import React, { useState } from "react";

import { useDispatch, useSelector } from "react-redux";
import * as sessionActions from "../../../../store/session";
import { Redirect, Link } from "react-router-dom";
import './LoginFormPage.css'
import SignUpFormModal from "../../SignUpFormModal";
import { Modal } from "../../../../context/Modal";

const LoginForm = () => {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);
  // const [showModal, setShowModal] = useState(false);

  if (sessionUser) return <Redirect to="/account" />;

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    return dispatch(sessionActions.loginUser({ email, password })).catch(
      async (res) => {
        let data;
        try {
          // .clone() essentially allows you to read the response body twice
          data = await res.clone().json();
        } catch {
          data = await res.text(); // Will hit this case if the server is down
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      }
    );
  };

  const handleDemoLogin = (e) => {
    e.preventDefault();
    dispatch(sessionActions.loginUser({email: 'demo@user.io', password: 'password'}))
  }

  return (
    <div className="login-slider">
    <form onSubmit={handleSubmit}>
    <h3 className="heading">Welcome to BlueVelvetCoffee</h3>
      <h3>Sign In</h3>
      <ul>
        {errors.map((error) => (<li key={error}>{error}</li>))}
      </ul> 
        <input className="login-field" type="text" value={email} placeholder="Email" onChange={(e) => setEmail(e.target.value)} required/>
        <input className="login-field" type="password" value={password} placeholder="Password" onChange={(e) => setPassword(e.target.value)} required/>
        <button className="red-btn" type="submit">Log In</button>
        {/* <Link to="#" id="demo-field" onClick={handleDemoLogin}>Login as Demo User</Link> */}
        <button className="red-btn" onClick={handleDemoLogin}>Demo User</button>
    </form>
    </div>
  );
};

export default LoginForm;
