import React from 'react'
import Home from '../components/home'
import './landing.css'
import Navbar from '../components/head-and-foot/Navbar'
import Footer from '../components/head-and-foot/Footer'

const landing = () => {
  return (
    <div>
    <Navbar/>
          <Home/>
    <Footer/>
    </div>
  )
}

export default landing