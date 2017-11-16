require 'rrobots'
require "#{File.dirname(__FILE__)}/utils/sample"

require 'securerandom'

class RandomCrawler
  include Robot
  include SampleUtil

  def tick events
    accelerate 1

    if x < @size * 2
      turn -heading
      return
    elsif y < @size * 2
      turn -90 - heading
      return
    elsif x > battlefield_width - @size * 2
      turn 180 - heading
      return
    elsif y > battlefield_height - @size * 2
      turn 90 - heading
      return
    end

    if (time % 40) == 0
      @turn_angle = 20 * SecureRandom.random_number - 10
    end
    if (time % 40) < 18
      turn @turn_angle
    else
      @turn_angle = 0
    end

    shoot_uniform_speed
  end
end