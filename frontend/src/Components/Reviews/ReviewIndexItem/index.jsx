import "./ReviewIndexItem.css";
import { useEffect } from "react";
import { useState } from "react";
import { deleteReview } from "../../../store/reviews";
import ReviewEditModal from "../ReviewEditModal";
import { useDispatch } from "react-redux";
import { useSelector } from "react-redux";

const ReviewIndexItem = ({ review }) => {
  const dispatch = useDispatch();
  const [errors, setErrors] = useState([]);
  const [starIconId, setStarIconId] = useState([
    "star-icon-gray",
    "star-icon-gray",
    "star-icon-gray",
    "star-icon-gray",
    "star-icon-gray",
  ]);
  const user = useSelector((state) => state.session.user);

  const capitalizeReviewerName = () => {
    const inputtedReviewerName = review.reviewerName;
    return (
      inputtedReviewerName.charAt(0).toUpperCase() +
      inputtedReviewerName.slice(1)
    );
  };

  const formatDate = () => {
    const dateString = review.createdAt;
    const D = new Date(dateString);
    const month = D.getMonth() + 1;
    const day = D.getDate();
    const year = D.getFullYear();
    return month + "/" + day + "/" + year;
  };

  const fillStarIcons = () => {
    let starIconIdCopy = ["star-icon-gray", "star-icon-gray", "star-icon-gray", "star-icon-gray", "star-icon-gray"];

    for(let i = 0; i < review.rating; i++) {
      starIconIdCopy[i] = "star-icon-yellow";
    }

    setStarIconId(starIconIdCopy);
  }

  const handleDeleteReview = () => {
    if (!user) {
      setErrors(["Please sign in to modify reviews."])
    } else if (review.userId === user.id) {
      dispatch(deleteReview(review.id));
    } else {
      setErrors(["You can only delete your own reviews."]);
    }
  }

  useEffect(() => {
    fillStarIcons();
  }, [dispatch, review.rating])

  useEffect(() => {
    setErrors([])
    //
  }, [dispatch, user]);


  return (
    <>
      <div className="review-index-item">
        <div className="review-index-item-nickname-container">
          <div className="nickname-thumbnail">
            {review.reviewerName.charAt(0).toUpperCase()}
          </div>
          <div className="nickname-text">
            {capitalizeReviewerName()}
          </div>
          <div className="date-submitted">
            {formatDate()}
          </div>
          </div>
        <div className="review-index-item-rating-container">
          <i className="fa-solid fa-star" id={starIconId[0]}></i>
          <i className="fa-solid fa-star" id={starIconId[1]}></i>
          <i className="fa-solid fa-star" id={starIconId[2]}></i>
          <i className="fa-solid fa-star" id={starIconId[3]}></i>
          <i className="fa-solid fa-star" id={starIconId[4]}></i>
        </div>
        <div className="review-index-item-title-container">
          {review.title}
        </div>
        <div className="review-index-item-body-container">
          {review.body}
        </div>

        <div className="review-item-edit-remove-container">
          <ReviewEditModal review={review} setErrors={setErrors} />
          <div className="review-item-delete-button" onClick={() => handleDeleteReview()}>Delete</div>
        </div>
        <ul className="review-delete-errors">
          {errors.map(error => <li key={error}>{error}</li>)}
        </ul>
      </div>
    </>
  )
};

export default ReviewIndexItem;
