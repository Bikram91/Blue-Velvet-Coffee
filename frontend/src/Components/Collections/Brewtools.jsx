import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import {fetchCategory, loadProducts, fetchProducts} from "../../store/product";
import ProductListing from "../ProductListing";
import "./Collection.css";
import Footer from "../Footer";

const Brewtools = () => {
  const dispatch = useDispatch();
  const products = useSelector(loadProducts);
  

  useEffect(() => {
    dispatch(fetchCategory("Brewtools"));
  }, [dispatch]);

  if (!products) return null;

  return (
    <div>
      <section className="main-image3">
        <div className="main-text">
          <h1>Brewtools</h1>
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

export default Brewtools;