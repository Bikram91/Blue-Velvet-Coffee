import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { loadProducts, searchProducts } from "../../store/product";
import Footer from "../Footer";
import ProductListing from "../ProductListing";
import "./Search.css";
import { Link, useLocation } from "react-router-dom";

const SearchResults = () => {
  const dispatch = useDispatch();
  const location = useLocation();
  const products = useSelector(loadProducts);
  const { query } = location.state || {};

  useEffect(() => {
    dispatch(searchProducts(query));
  }, [dispatch, query]);

  if (Array.isArray(products[0])) return null;

  const resultContents = () => {
    if (products.length === 0) {
      return (
        <>
          <h1>Your search - '{query}' - did not match any results </h1>
          <iframe src="https://giphy.com/embed/ES4Vcv8zWfIt2" width="480" height="480" frameBorder="0" className="giphy-embed" allowFullScreen></iframe>
        </>
      );
    } else {
      return (
        <div>
          <h1>Search results for: '{query}'</h1>
          <p>
            {products.length} {products.length === 1 ? "result" : "results"} for
            you search
          </p>
          <div>
            {products?.map((product) => (
              <ProductListing key={product.id} product={product} />
            ))}
          </div>
        </div>
      );
    }
  };

  return (
    <section>
        <div>
        
            {resultContents()}
            <Footer/>
        </div>
    </section>
  )
};

export default SearchResults;
