import { Link, NavLink } from "react-router-dom";
import "./Footer.css";

const Footer = () => {
  return (
    <footer>
      <div className="footer_whole">
        <div className="">
          <NavLink exact to="/">
            <h1>Blue Velvet Coffee</h1>
          </NavLink>
        </div>

        <div className="">
          <p className="shop">Shop</p>
          <div className="">
            <Link to="/collection/coffee">OUR COFFEE</Link>
          </div>
        </div>

        <div className="">
          <div className="flex-row justify-center">
            <Link
              to={{ pathname: "https://github.com/Bikram91" }}
              target="_blank"
            >
              <i className="fa-brands fa-github"></i>
            </Link>
            <Link
              to={{
                pathname:
                  "https://www.linkedin.com/in/bikramjit-singh-153614140/",
              }}
              target="_blank"
            >
              <i className="fa-brands fa-linkedin"></i>
            </Link>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
