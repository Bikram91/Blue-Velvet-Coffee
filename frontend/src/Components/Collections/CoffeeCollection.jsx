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
    dispatch(fetchCategory());
   
  }, [dispatch]);
  

  if (!products) return null;
  // let categories = ["HOLIDAY COFFEE SET", "Blend", "Espresso", "Single Origin"]
  
  return (
    <div>
      <div>
      </div>

      <div className="products_listings grid">
        {products.map((product) => (
          <ProductListing key={product.id} product={product} />
        ))}
      </div>
      <Footer/>
    </div>
  );
};

export default CoffeeCollection;
