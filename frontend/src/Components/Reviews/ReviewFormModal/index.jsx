import { useState } from "react";
import { useSelector } from "react-redux";
import { Modal } from "../../../context/Modal";
import ReviewCreateForm from "./ReviewCreateForm";
import { useEffect } from "react";
import { useDispatch } from "react-redux";

const ReviewFormModal = ({productId}) => {
  const dispatch = useDispatch();

    const [errors, setErrors] = useState([]);
    const [showReveiwModal, setShowReviewModal] = useState(false);
    let user = useSelector(state => state.session.user);

    useEffect(() => {
      setErrors([])
      //
    }, [dispatch, user]);


  const handleReviewModalClick = () => {
    if(user) {
      setShowReviewModal(true);
      setErrors([])
    } else {
      setErrors(["Please sign in to write a review."]);
    }
  }

  return (
    <>
      <button id="create-revew-button" onClick={() => handleReviewModalClick()}>WRITE A REVIEW</button>
      <ul className="review-modal-errors">
        {errors.map(error => <li key={error}>{error}</li>)}
      </ul>
      {showReveiwModal && (
        <Modal onClose={() => setShowReviewModal(false)}>
          <ReviewCreateForm productId={productId} setShowReviewModal={setShowReviewModal} />
        </Modal>
      )}
    </>
  )
}

export default ReviewFormModal;


