import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { useState } from "react";
import "./ReviewCreateForm.css";
import { fetchProduct } from "../../../store/product";
import { createReview } from "../../../store/reviews";

const ReviewCreateForm = ({ productId, setShowReviewModal }) => {
  const dispatch = useDispatch();
  const [reviewerName, setReviewerName] = useState("");
  const [title, setTitle] = useState("");
  const [body, setBody] = useState("");
  const [ratingStyleClass, setRatingStyleClass] = useState([
    "star-unchecked",
    "star-unchecked",
    "star-unchecked",
    "star-unchecked",
    "star-unchecked",
  ]);
  const [ratingSelection, setRatingSelection] = useState(0);
  const [errors, setErrors] = useState([]);
  const user = useSelector((state) => state.session.user);
  let product = useSelector((state) =>
    state.products ? state.products[productId] : null
  );

  const handleRating = (index) => {
    const ratingStyleClassCopy = [
      "star-unchecked",
      "star-unchecked",
      "star-unchecked",
      "star-unchecked",
      "star-unchecked",
    ];

    for (let i = 0; i <= index; i++) {
      ratingStyleClassCopy[i] = "star-checked";
    }

    setRatingStyleClass(ratingStyleClassCopy);
    setRatingSelection(index + 1);
  };

  const handleSubmitReview = () => {
    setErrors([]);
    const newReview = {
      review: {
        userId: user.id,
        productId: productId,
        rating: ratingSelection,
        reviewerName: reviewerName,
        title: title,
        body: body,
      },
    };

    dispatch(createReview(newReview))
      .then(() => setShowReviewModal(false))
      .catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }

        if (data?.errors) {
          setErrors(data.errors);
        } else if (data) {
          setErrors([data]);
        } else {
          setErrors([res.statusText]);
        }
      });
  };

  useEffect(() => {
    dispatch(fetchProduct(productId));
  }, [dispatch, productId]);

  if (!product) {
    return null;
  }

  return (
    <>
      <div className="create-review-form-container">
        <div className="review-img">
          <img src={product.imgUrls[0]} alt="loading" />
        </div>
        <div className="create-review-form-right">
          <div className="create-review-header">
            <div className="create-review-product-name">Write a review for {product.name}</div>
            <div>
              <button id="close-review-modal-button" onClick={() => setShowReviewModal(false)}>X</button>
            </div>
          </div>
          <div className="review-inputs-container">
            <div className="rating-buttons-container">
              <div className="ratings-header">Your overall rating*</div>
              <button
                className={ratingStyleClass[0]}
                onClick={() => handleRating(0)}>
                <i class="fa-solid fa-star"></i>
              </button>
              <button
                className={ratingStyleClass[1]}
                onClick={() => handleRating(1)}>
                <i class="fa-solid fa-star"></i>
              </button>
              <button
                className={ratingStyleClass[2]}
                onClick={() => handleRating(2)}>
                <i class="fa-solid fa-star"></i>
              </button>
              <button
                className={ratingStyleClass[3]}
                onClick={() => handleRating(3)}>
                <i class="fa-solid fa-star"></i>
              </button>
              <button
                className={ratingStyleClass[4]}
                onClick={() => handleRating(4)}>
                <i class="fa-solid fa-star"></i>
              </button>
            </div>
            <form className="review-form">
                <div className="nickname-container">

                          <div className="nickname-header-container">
                              <p className="review-header">Reviewer Name* &nbsp;</p>
                              <p className="review-subheader">(Name displayed)</p>
                          </div>
                          <input type="text" value={reviewerName} onChange={(e) => setReviewerName(e.target.value)} required placeholder="Name"/>
                      </div>
                      <div className="review-title-container">
                          <div className="review-title-header-container">
                              <p className="review-title-header">Review Title* &nbsp;</p>
                          </div>
                          <input type="text" value={title} onChange={(e) => setTitle(e.target.value)} required placeholder="Title"/>
                      </div>
                      <div className="review-body-container">
                          <div className="review-body-header-container">
                              <p className="review-body-header">Review*</p>
                          </div>
                          <textarea value={body} onChange={(e) => setBody(e.target.value)} required placeholder="Body" />
                      </div>
            </form>
            <div className="create-review-button-container">
              <button onClick={() => handleSubmitReview()} className="submit-review-button">SUBMIT REVIEW</button>
            </div>
            <ul className="review-form-errors">
              {errors.map(error => <li key={error}>{error}</li>)}
            </ul>
          </div>
        </div>
      </div>
    </>
  );
};

export default ReviewCreateForm;