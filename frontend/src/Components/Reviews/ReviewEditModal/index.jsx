import { Modal } from "../../../context/Modal";
import { useState } from "react";
import { useSelector } from "react-redux";
import ReviewEdit from "./ReviewEdit";
import './ReviewEditModal.css'

const ReviewEditModal = ({ review, setErrors }) => {
  const [showEditReviewModal, setshowEditReviewModal] = useState(false);
  let user = useSelector((state) => state.session.user);

  const handleReviewEditClick = () => {
    if (!user) {
      setErrors(["Login to edit review."]);
    } else if (review.userId === user.id) {
      setshowEditReviewModal(true);
    } else {
      setErrors(["You are allowed to edit your own reviews."]);
    }
  };

  return (
    <>
      <div  className="review-item-delete-button1" onClick={() => handleReviewEditClick()}>Edit</div>
      {showEditReviewModal && (
        <Modal onClose={() => setshowEditReviewModal(false)}>
          <ReviewEdit
            review={review}
            setShowEditReviewModal={setshowEditReviewModal}
          />
        </Modal>
      )}
    </>
  );
};

export default ReviewEditModal;
