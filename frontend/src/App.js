
import React from 'react';
import { Route, Switch } from 'react-router-dom';
// import LoginForm from './Components/account_forms/LoginModal/LoginFormPage/LoginForm';
import SignUpForm from './Components/account_forms/SignUpFormModal/SignUpForm';
import Header from './Components/Header';

function App() {
  return (
    <>
      <Header />
      <Switch>
        <Route path="/signup">
          <SignUpForm />
        </Route>
      </Switch>
    </>
  );
}

export default App;
