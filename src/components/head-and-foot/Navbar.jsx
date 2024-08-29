import React from 'react'
import './navbar.css'
import { Link } from 'react-router-dom';
const Navbar = () => {
  return (
    <div>
          <nav>
          <ul>
            <li><Link to="/"><i className="icon-home"></i><span>Home</span></Link></li>
            <li><Link to="/about"><i className="icon-info"></i><span>About</span></Link></li>
            <li><Link to="/contact"><i className="icon-envelope"></i><span>Contact</span></Link></li>
          </ul>
        </nav>
    </div>
  )
}

export default Navbar