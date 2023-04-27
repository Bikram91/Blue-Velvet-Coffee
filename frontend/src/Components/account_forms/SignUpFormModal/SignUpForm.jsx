import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import * as sessionActions from "../../../store/session";
import { Redirect } from "react-router-dom";
import './SignUpForm.css';

const SignUpForm = () => {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [errors, setErrors] = useState([]);

  if (sessionUser) return <Redirect to="/account" />;

  const handleSubmit = (e) => {
    e.preventDefault();
    if (password === confirmPassword) {
      setErrors([]);
      return dispatch(
        sessionActions.signupUser({ user: { username, email, password } })
      ).catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text(); 
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      });
    }
    return setErrors([
      "Confirm Password field must be the same as the Password field",
    ]);
  };

  return (
    <div className="signup-slider">
      <form onSubmit={handleSubmit}>
        <h3 className="heading">Welcome to BlueVelvetCoffee</h3>
        <h3>Sign Up</h3>
        <ul>{errors.map((error) => (<li key={error}>{error}</li>))}</ul>
        <input className='signup-field' type="text" value={username} placeholder="Username" onChange={(e) => setUsername(e.target.value)} required/>
        <input className='signup-field' type="text" value={email} placeholder="Email" onChange={(e) => setEmail(e.target.value)} required />
        <input className='signup-field' type="password" value={password} placeholder="Password" onChange={(e) => setPassword(e.target.value)} required />
        <input className='signup-field' type="password" value={confirmPassword} placeholder="Confirm Password" onChange={(e) => setConfirmPassword(e.target.value)} required />
        <button className='red-btn1' type="submit">Register now</button>
      </form>
    </div>
  );
};

export default SignUpForm;
