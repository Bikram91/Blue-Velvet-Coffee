
import React from 'react';
import { Route, Switch } from 'react-router-dom';
// import LoginForm from './Components/account_forms/LoginModal/LoginFormPage/LoginForm';
import SignUpForm from './Components/account_forms/SignUpFormModal/SignUpForm';
import Header from './Components/Header';
import SplashPage from './Components/Splash';
function App() {
  return (
    <>
      <Header />
      <Switch>
      <Route exact path='/'>
          <SplashPage />
        </Route>
      </Switch>
    </>
  );
}

export default App;
