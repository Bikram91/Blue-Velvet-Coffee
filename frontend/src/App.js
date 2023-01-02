
import React from 'react';
import { Route, Switch } from 'react-router-dom';
import LoginForm from './Components/account_forms/LoginFormPage';
import SignUpForm from './Components/account_forms/SignUpForm';
import Header from './Components/Header';

function App() {
  return (
    <>
      <Header />
      <Switch>
        <Route path="/login">
          <LoginForm />
        </Route>
        <Route path="/signup">
          <SignUpForm />
        </Route>
      </Switch>
    </>
  );
}

export default App;
