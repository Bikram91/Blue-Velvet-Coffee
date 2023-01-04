import React, { useState } from 'react';
// import { Modal } from '../../context/Modal';
// import LoginForm from './LoginForm';
import { Modal } from '../../../context/Modal';
import LoginForm from './LoginFormPage/LoginForm';
// import account from "../../../Assets/Header/account.svg"

function LoginFormModal() {
  const [showModal, setShowModal] = useState(false);

  return (
    <>
      <button id= "button" onClick={() => setShowModal(true)}><svg xmlns="http://www.w3.org/2000/svg" width="22.025" height="22.569"><g fill="none" stroke="#000" strokeWidth="1.2" data-name="Group 3487" transform="translate(-6727.993 -62.4)"><circle cx="6.5" cy="6.5" r="6.5" data-name="Ellipse 71" transform="translate(6732.774 63)"/><path d="M6728.5 84.556s3.051-4.826 5.769-5.713l4.715 5.214 4.382-5.214a11.048 11.048 0 0 1 6.1 5.713" data-name="Path 709"/></g></svg></button>
      {showModal && (
        <Modal onClose={() => setShowModal(false)}>
          <LoginForm />
        </Modal>
      )}
    </>
  );
}

export default LoginFormModal;