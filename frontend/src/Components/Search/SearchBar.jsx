import { useMemo, useState } from "react";
import { useHistory } from "react-router-dom";
import { Link } from "react-router-dom";
import "./Search.css";



const SearchBar = () => {
  const [query, setQuery] = useState("");
  const history = useHistory();
  
  const handleSubmit = (e) => {
    e.preventDefault();
    history.push({
      pathname: "/search",
      state: { query },
    });
    setQuery("");
    
  };

  return (
    <>
      <form className="search-form" onSubmit={handleSubmit}>
        <input
          type="search"
          value={query}
          placeholder="Search.."
          onChange={ (e) => setQuery(e.target.value)}
        />
        <button className="search-btn">
          <Link to={{ pathname: "/search", state: { query } }}>
            <i className="fa-solid fa-magnifying-glass"></i>
          </Link>
        </button>
      </form>
    </>
  );
};

export default SearchBar;
