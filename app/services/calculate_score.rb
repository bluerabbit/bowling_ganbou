class CalculateScore
  class << self
    def call(pins)
      new(pins).call
    end
  end

  def initialize(pins)
    @pins   = pins
    @frames = []
  end

  def call
    score = Score.new

    return score if @pins.blank?

    frame = Frame.new
    @pins.each do |pin|
      frame.add_score pin

      if frame.finished?
        @frames << frame
        frame = Frame.new(last_frame: @frames.size == 9)
      end
    end

    score.roll_marks   = roll_marks
    score.frame_scores = frame_scores
    score.total        = total

    score
  end

  def total
    frame_scores.sum
  end

  def frame_scores
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  end

  def roll_marks
    v = @frames.map{|frame| frame.roll_marks }
    v.flatten
  end
end
