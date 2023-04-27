import React, { useState } from 'react';
import { Modal } from '../../../context/Modal';
import LoginForm from './LoginFormPage/LoginForm';
// import SignUpFormModal from '../SignUpFormModal';


function LoginFormModal() {
  const [showModal, setShowModal] = useState(false);

  return (
    <div>

      <button id= "button" onClick={() => setShowModal(true)}>Log In</button>
      {showModal && (
        <Modal onClose={() => setShowModal(false)}>
          <LoginForm />
        </Modal>
      )}
    </div>
  );
}

export default LoginFormModal;


