import React, {Component} from 'react';
import {Link} from 'react-router';


const LeagueTile = (props) => {
   return(
     <div>
       <Link to={`api/v1/leagues/${props.id}`}>
       {props.name}
       </Link>
     </div>
   )
}




export default LeagueTile
