import React, { Component } from 'react';
import { Link } from 'react-router';
import BackButton from './BackButton'
const NavBar = props => {
    return(
      <div>
        <div className="large-6 columns" className='navbar'>
          <Link className="link" to='/'>Home</Link>
          <Link className="link" to='/leagues'>Leagues</Link>
          <Link className="link" to='/games'>Games</Link>
          <Link className="link" to='/memberships'>Memberships</Link>
        </div>
          {props.children}
      </div>
    )
  }


export default NavBar;
