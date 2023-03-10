import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { BrowserRouter } from 'react-router-dom';
import './index.css';
import App from './App';
import configureStore from './store';
// import csrfFetch, { restoreCSRF } from './store/csrf';
import csrfFetch from './store/csrf';
import { restoreSession } from './store/csrf';
import * as sessionActions from './store/session';
import { ModalProvider } from './context/Modal';
import * as productActions from './store/product';
import ScrollToTop from './Components/ScrollToTop';

const store = configureStore();

if (process.env.NODE_ENV !== 'production') {
  window.store = store;
  window.csrfFetch = csrfFetch;
  window.sessionActions = sessionActions;
  window.productActions = productActions;
}

const Root = () => {
  return (
    <ModalProvider>
    <Provider store={store}>
      <BrowserRouter>
        <ScrollToTop/>
        <App />
      </BrowserRouter>
    </Provider>
    </ModalProvider>
  )
}

const renderApplication = () => {
  ReactDOM.render(
    <React.StrictMode>
      <Root />
    </React.StrictMode>,
    document.getElementById('root')
  );
}


// if (sessionStorage.getItem("X-CSRF-Token") === null) {
//   restoreCSRF().then(renderApplication);
// } else {
//   renderApplication();
// }
if (
  sessionStorage.getItem('X-CSRFToken') === null || 
  sessionStorage.getItem('currentUser') === null
) {
  store.dispatch(restoreSession()).then(renderApplication);
} else {
  renderApplication();
}
