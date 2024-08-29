import React from 'react'
import './about.css'
import Navbar from './head-and-foot/Navbar'
const About = () => {
  return (
    <>
      <Navbar />

<div className="about-container">
  <h1>About Us</h1>
  <p>Welcome to our Instagram Following Analyzer! We're passionate about providing insights into social media connections.</p>
  
  <section className="our-mission">
    <h2>Our Mission</h2>
    <p>Our goal is to help users understand their Instagram network better by providing detailed information about the accounts they follow.</p>
  </section>
  
  <section className="how-it-works">
    <h2>How It Works</h2>
    <ol>
      <li>Enter an Instagram username</li>
      <li>We fetch the list of accounts that user follows</li>
      <li>View detailed information about each followed account</li>
    </ol>
  </section>
  
  <section className="privacy">
    <h2>Privacy & Security</h2>
    <p>We respect your privacy. Our tool only accesses publicly available information and does not store any user data.</p>
  </section>
  
  <section className="contact">
    <h2>Contact Us</h2>
    <p>Have questions or suggestions? Reach out to us at <a href="mailto:contact@example.com">contact@example.com</a></p>
  </section>
</div>
    </>
    
  )
}

export default About