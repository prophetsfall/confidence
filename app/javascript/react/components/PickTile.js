import React from 'react'

const PickTile = ({
  awayId,
  awayLocation,
  awayName,
  gameTime,
  homeId,
  homeLocation,
  homeName,
  gameId,
  winnerId
}) => {
  return(
    <div className="columns small-6 pickBox">
      <div className="small-6 medium-6 large-6 columns pickTile">
        <img
          src={assetHelper[`${awayName}.gif`]}
          alt={awayName}
          id={awayId}
          className="pickImg"
        />
        <img
          src={assetHelper[`${homeName}.gif`]}
          alt={homeName}
          id={homeId}
          className="pickImg"
        />
      </div>
      <div className="pickDate">
        <p>gameTime</p>
      </div>
      <div class="row">
        nsadofnadsiofnasoidnfaoi
      </div>
    </div>
  )
}

export default PickTile
