import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import {fetchCategory, loadProducts, fetchProducts} from "../../store/product";
import ProductListing from "../ProductListing";
import "./Collection.css";
import Footer from "../Footer";

const Instant = () => {
  const dispatch = useDispatch();
  const products = useSelector(loadProducts);
  

  useEffect(() => {
    dispatch(fetchCategory("Instant"));
  }, [dispatch]);

  if (!products) return null;

  return (
    <div>
      <section className="main-image4">
        <div className="main-text">
          <h1>Instant</h1>
        </div>
      </section>

      <div className="product_flex">
        {products.map((product) => (
          <ProductListing key={product.id} product={product} />
        ))}
      </div>
      <Footer/>
    </div>
  );
};

export default Instant;