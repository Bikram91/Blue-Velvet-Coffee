import { Link } from "react-router-dom";
import './HeaderDropdown.css'

const DropDown = () => {

    return (
        <div className="dropdown-content">
            <Link to="/collection/coffee">All Coffee</Link>
            <Link to="/collection/singleorigin">SINGLE ORIGIN</Link>
            <Link to="/collection/drinkware">DRINKWARE</Link>
            <Link to="/collection/brewtools">BREWTOOLS</Link>
        </div>
    )
}

export default DropDown;