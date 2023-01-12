import { Link } from "react-router-dom";
import './HeaderDropdown.css'

const DropDown = () => {

    return (
        <div className="dropdown-content">
            <Link to="/collection/coffee">All Coffee</Link>
            <Link to="/collection/coffee">INSTANT</Link>
            <Link to="/collection/drinkware">DRINWARE</Link>
            <Link to="/collection/coffee">BREWTOOLS</Link>
            
          
        </div>
    )
}

export default DropDown;