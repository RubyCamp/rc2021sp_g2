class Collision
  def initialize(plyr, way, obs)
    @plyr = plyr
    @way  = way
    @obs  = obs
  end

  def collision(plyr, way)
    if plyr === way
      collosion_way(@plyr, @way)
      collosion_obs(@plyr, @obs)
    end
  end

  def collosion_way(plyr, way)
    plyr = plyr
    way  = way
    Sprite.case(plyr, way)
  end

  def collosion_obs(plyr, obs)
    plyr = plyr
    obs  = obs
    Sprite.case(plyr, way)
  end
end
