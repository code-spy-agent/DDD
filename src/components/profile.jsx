import React, { useState, useEffect } from 'react';
import './profile.css'

import home from './home.jsx'

const Profile = () => {
  const [profileData, setProfileData] = useState(null);
  const [error, setError] = useState(null);
  const [username, setUsername] = useState('');
  const [isLoading, setIsLoading] = useState(false);

  const fetchProfileData = async (inputUsername) => {
    setIsLoading(true);
    const url = `https://instagram-scraper-api3.p.rapidapi.com/user_info_web?username=${inputUsername}`;
    const options = {
      method: 'GET',
      headers: {
        'x-rapidapi-key': '189efb89e3msh2557065f9e12512p1a8133jsn4509c94dfd3c',
        'x-rapidapi-host': 'instagram-scraper-api3.p.rapidapi.com'
      }
    };

    try {
      const response = await fetch(url, options);
      const result = await response.json();
      setProfileData(result);
      console.log(result);
    } catch (error) {
      console.error(error);
      setError('Failed to fetch profile data');
    } finally {
      setIsLoading(false);
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (username.trim()) {
      fetchProfileData(username);
    }
  };

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div className="profile-container">
      <form onSubmit={handleSubmit} className="username-form">
        <input
          type="text"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          placeholder="Enter Instagram username"
          className="username-input"
        />
        <button type="submit" className="submit-button">Fetch Profile</button>
      </form>

      {isLoading && <div>Loading...</div>}

      {profileData && !isLoading && (
        <>
          <div className="profile-header">
            <img
              src={profileData.data.profile_pic_url || "https://via.placeholder.com/150"}
              alt={profileData.data.username}
              className="profile-picture"
            />
            <div className="profile-stats">
              <div className="stat">
                <span className="stat-value">{profileData.data.edge_owner_to_timeline_media.count}</span>
                <span className="stat-label">Posts</span>
              </div>
              <div className="stat">
                <span className="stat-value">{profileData.data.edge_followed_by.count}</span>
                <span className="stat-label">Followers</span>
              </div>
              <div className="stat">
                <span className="stat-value">{profileData.data.edge_follow.count}</span>
                <span className="stat-label">Following</span>
              </div>
            </div>
          </div>
          <div className="profile-info">
            <h1 className="username">{profileData.data.username}</h1>
            <h2 className="full-name">{profileData.data.full_name}</h2>
            <p className="bio">{profileData.data.biography}</p>
            {profileData.data.external_url && (
              <a href={profileData.data.external_url} className="external-link" target="_blank" rel="noopener noreferrer">
                {profileData.data.external_url}
              </a>
            )}
          </div>
          {profileData.data.is_private ? (
            <p className="private-account">This Account is Private</p>
          ) : (
            <div className="posts-grid">
              {/* Here you would map through posts if available */}
              <p>No posts yet</p>
            </div>
          )}
            <home />
        </>
      
      )}
    </div>
  );
};

export default Profile;