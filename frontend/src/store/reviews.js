import csrfFetch from "./csrf";

const RECEIVE_REVIEWS = "reviews/RECEIVE_REVIEWS";
const RECEIVE_REVIEW = "reviews/RECEIVE_REVIEW";
const REMOVE_REVIEW = "reviews/REMOVE_REVIEW";

// ACTION CREATORS
export const receiveReviews = (reviews) => {
  return {
    type: RECEIVE_REVIEWS,
    reviews
  }
}

export const receiveReview = (review) => {
  return {
    type: RECEIVE_REVIEW,
    review
  }
}

export const removeReview = (reviewId) => {
  return {
    type: REMOVE_REVIEW,
    reviewId
  }
}

// Thunk action creators 
export const fetchReviews = (productId) => async dispatch => {
  const res = await csrfFetch(`/api/products/${productId}/reviews`);
  if(res.ok) {
    const reviews = await res.json();
    dispatch(receiveReviews(reviews));
  }
}

export const createReview = (review) => async dispatch => {
  const res = await csrfFetch('/api/reviews', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: JSON.stringify(review)
  });

  if(res.ok) {
    const review = await res.json();
    dispatch(receiveReview(review));
  }
}

export const updateReview = (review) => async dispatch => {
  const res = await csrfFetch(`/api/reviews/${review.id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: JSON.stringify(review)
  });

  if(res.ok) {
    const newReview = await res.json();
    dispatch(receiveReview(newReview));
  }
}

export const deleteReview = (reviewId) => async dispatch => {
  const res = await csrfFetch(`/api/reviews/${reviewId}`, {
    method: "DELETE"
  })

  if(res.ok) {
    dispatch(removeReview(reviewId));
  }
}


export default function reviewsReducer(state={}, action) {
  switch (action.type) {
    case RECEIVE_REVIEWS:
      return { ...action.reviews };
    case RECEIVE_REVIEW:
      return { ...state, [action.review.id]: action.review };
    case REMOVE_REVIEW:
      let newState = {...state};
      delete newState[action.reviewId];
      return newState;
    default:
      return state;
  }
}