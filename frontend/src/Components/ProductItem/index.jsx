import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { loadProducts, fetchProduct } from "../../store/product";
import { Modal } from "../../context/Modal";
import LoginFormModal from "../account_forms/LoginModal";
import "./ProductItem.css";
import Footer from "../Footer";
import {
  createCartItem,
  updateCartItem,
  fetchCartItems,
} from "../../store/cart_item";
import Cart from "../Cart";
//1
import ReviewIndexItem from "../Reviews/ReviewIndexItem";
import ReviewFormModal from "../Reviews/ReviewFormModal";
import { fetchReviews } from "../../store/reviews";
import { Link } from "react-router-dom";
//
import { Swiper, SwiperSlide } from "swiper/react";

const ProductItem = () => {
  const dispatch = useDispatch();
  const productId = Number(useParams().productId);
  const user = useSelector((state) => state.session.user);
  const products = useSelector(loadProducts);
  const cartItems = useSelector((state) => Object.values(state.cartItems));
  //2
  let reviews = useSelector((state) =>
    state.reviews ? Object.values(state.reviews) : []
  );
  //
  useEffect(() => {
    dispatch(fetchProduct(productId));
    //2.5
    dispatch(fetchReviews(productId));
    //
  }, [dispatch, productId]);

  let product = products.find((product) => product.id === productId);

  //3
  const scrollToReviews = () => {
    document
      .querySelector(".reviews-container")
      .scrollIntoView({ behavior: "smooth" });
  };

  const calculateAvgRating = () => {
    if (reviews.length === 0) {
      return 0;
    }

    const ratingSum = reviews.reduce((acc, ele) => acc + ele.rating, 0);
    return (ratingSum / reviews.length).toFixed(1);
  };

  const calculatedRoundedRating = () => {
    const avgRating = calculateAvgRating();
    return Math.round(avgRating * 2) / 2;
  };
  //

  //2.7
  useEffect(() => {
    fillStars();
  }, [dispatch, calculatedRoundedRating()]);
  //

  //4
  const [starStyles, setStarStyles] = useState([
    "fa-regular fa-star",
    "fa-regular fa-star",
    "fa-regular fa-star",
    "fa-regular fa-star",
    "fa-regular fa-star",
  ]);
  //

  //5
  const fillStars = () => {
    const starStylesCopy = [
      "fa-regular fa-star",
      "fa-regular fa-star",
      "fa-regular fa-star",
      "fa-regular fa-star",
      "fa-regular fa-star",
    ];

    let before = Math.floor(calculatedRoundedRating());
    let after = calculatedRoundedRating() - before;

    let i = 0;
    for (i; i < before; i++) {
      starStylesCopy[i] = "fa-solid fa-star";
    }

    if (i < 5 && after === 0.5) {
      starStylesCopy[i] = "fa-solid fa-star-half-stroke";
    }

    setStarStyles(starStylesCopy);
  };
  //

  const [showModal, setShowModal] = useState(false);
  const [count, setCount] = useState(1);

  const addToCart = (e) => {
    if (!user) return null;

    const newItem = {
      cart_item: {
        userId: user?.id,
        productId: productId,
        productName: product?.name,
        quantity: count,
        imageUrl: product?.imgUrls[0],
        price: product?.price,
      },
    };

    let existingItem = cartItems.find(
      (cartItem) => cartItem.productId == productId
    );

    if (existingItem) {
      existingItem.quantity += 1;
      dispatch(
        updateCartItem({
          ...existingItem,
          quantity: existingItem.quantity,
        })
      );
    } else {
      dispatch(createCartItem(newItem));
    }
  };

  if (!product) return null;

  return (
    <div>
      <div className="imganddescription">
        <img className="img1" src={product.imgUrls[0]} alt="loading" />
        <div>
          <h1>{product?.name}</h1>
          <p>{product?.description}</p>
          <button
            className="btn"
            onClick={() => {
              addToCart();
              setShowModal(true);
            }}
          >
            Add to Cart
          </button>

        
          <div className="reviews-anchor" onClick={() => scrollToReviews()}>
            {/* <i class="fa-regular fa-star"></i> */}
            <Link to="#" className="reviews-anchor-link">
              <h2>Reviews [{reviews.length}]</h2>
            </Link>
          </div>
        
        </div>
      </div>
      <img className="img2" src={product.imgUrls[1]} alt="loading" />
      <img className="img3" src={product.imgUrls[2]} alt="loading" />

    

      <div className="reviews-container">
        <div className="reviews-header-container">
          <div className="reviews-header-text">Reviews</div>
          <div className="reviews-header-average">
            <div className="avg-rating-and-stars">
              <div className="avg-rating-amount">{calculateAvgRating()}</div>
              <div className="avg-rating-stars">
                <i className={starStyles[0]} id="star-icon-yellow"></i>
                <i className={starStyles[1]} id="star-icon-yellow"></i>
                <i className={starStyles[2]} id="star-icon-yellow"></i>
                <i className={starStyles[3]} id="star-icon-yellow"></i>
                <i className={starStyles[4]} id="star-icon-yellow"></i>
              </div>
            </div>
            <div className="based-on-reviews">
              Based on {reviews.length} reviews
            </div>
          </div>
          <div className="create-review-button-container">
            <ReviewFormModal productId={productId} />
          </div>
        </div>
        <div className="reviews-index-item-container">
          {reviews?.map((review) => (
            <ReviewIndexItem review={review} key={review.id} />
          ))}
        </div>
      </div>
      {/*  */}
      <Footer />
    </div>
  );
};

export default ProductItem;
