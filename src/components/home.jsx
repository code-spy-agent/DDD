import React, { useState, useEffect } from 'react';
import './../components/home.css'

import Profile from './profile'

const Home = () => {
  const [username, setUsername] = useState('');
  const [followingData, setFollowingData] = useState(null);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(false);

  const fetchData = async (username) => {
    setLoading(true);
    setError(null);
    const url = `https://instagram-scraper-api2.p.rapidapi.com/v1/following?username_or_id_or_url=${username}`;
    const options = {
      method: 'GET',
      headers: {
       'x-rapidapi-key': '',
		    'x-rapidapi-host': ''
      }
    };

    try {
      const response = await fetch(url, options);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const result = await response.json();
      setFollowingData(result);
      console.log(result);
    } catch (error) {
      console.error(error);
      setError(error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (username) {
      fetchData(username);
    }
  };

  if (error) {
    console.log("error dddddddddddddddddddddddd",error)
    return (
      <div>
        <h2>Error: Private Account</h2>
        <p>The account you're trying to access is private. Only approved followers can see this account's content.</p>
      </div>
    );
  }

  return (
    <div>
      <Profile/>

      <h1>Instagram Following Data</h1>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          placeholder="Enter Instagram username"
          required
        />
        <button type="submit">Fetch Data</button>
      </form>

      {loading && <div>Loading...</div>}

      {followingData && (
        <div className="following-grid">
          {followingData.data.items.map((item) => (
            <div key={item.id} className="following-item">
              <img
                src={item.profile_pic_url}
                alt={item.username}
                className="profile-pic"
                onError={(e) => {
                  e.target.onerror = null;
                  e.target.src = 'https://via.placeholder.com/150';
                }}
              />
              <p className="username">{item.username}</p>
              <p className="full-name">{item.full_name}</p>
              {item.is_verified && <span className="verified-badge">✓</span>}
              {item.is_private && <span className="private-badge">🔒</span>}
            </div>
          ))}
        </div>
      )}

    </div>
  );
};

export default Home;
