import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import {fetchCategory, loadProducts, fetchProducts} from "../../store/product";
import ProductListing from "../ProductListing";
import "./Collection.css";
import { useState } from "react";
import Footer from "../Footer";

const CoffeeCollection = () => {
  const dispatch = useDispatch();
  let products = useSelector(loadProducts);

  useEffect(() => {
    dispatch(fetchCategory("COFFEE"));
   
  }, [dispatch]);
  

  if (!products) return null;
  // let categories = ["HOLIDAY COFFEE SET", "Blend", "Espresso", "Single Origin"]
  
  return (
    <div>
     
      <section className="main-image1">
        <div className="main-text">
          <h1  >Blue Velvet Coffee and Coffee Sets</h1>
        </div>
      </section>
      {/* <div className="products_listings grid"> */}
      <div className="product_flex">
        {products.map((product) => (
          <ProductListing key={product.id} product={product} />
        ))}
      </div>
      <Footer/>
    </div>
  );
};

export default CoffeeCollection;
