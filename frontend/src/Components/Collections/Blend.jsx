import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import {fetchCategory, loadProducts, fetchProducts} from "../../store/product";
import ProductListing from "../ProductListing";
import "./Collection.css";

const Blend = () => {
  const dispatch = useDispatch();
  const products = useSelector(loadProducts);
  

  useEffect(() => {
    dispatch(fetchCategory("Blend"));
  }, [dispatch]);

  if (!products) return null;

  return (
    <div>
      <div>
        <h1>Blend</h1>
      </div>

      <div>
        {products.map((product) => (
          <ProductListing key={product.id} product={product} />
        ))}
      </div>
    </div>
  );
};

export default Blend;