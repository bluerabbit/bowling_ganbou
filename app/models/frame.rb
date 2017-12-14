class Frame
  def initialize(last_frame: false)
    @scores     = []
    @last_frame = last_frame
  end

  def add_score(pin)
    @scores << pin
  end

  def first_throw?
    @scores.size.zero?
  end

  def finished?
    if !last_frame? && strike?
      return true
    end

    if !last_frame? && @scores.size == 2
      return true
    end

    if last_frame? && @scores.size == 2 && @scores.sum < 10
      return true
    end

    if @scores.size == 3
      return true
    end

    false
  end

  def last_frame?
    @last_frame
  end

  def strike?
    @scores.first == 10
  end

  def spare?
    @scores.sum == 10
  end

  def frame_score
    # FIXME
  end

  def roll_marks
    if last_frame? && @scores.size == 3
      # FIXME
      score1 = @scores[0] == 10 ? 'X' : @scores[0].to_s
      score2 = @scores[1] == 0 ? '-' : @scores[0].to_s
      score3 = @scores[2] == 10 ? '/' : @scores[0].to_s
      return [score1, score2, score3]
    end
    if strike?
      ['X', nil]
    elsif spare?
      if @scores.first.zero?
        ['G', '/']
      else
        [@scores.first.to_s, '/']
      end
    else
      first_mark = @scores.first.to_s
      if @scores.first.zero?
        first_mark = 'G'
      end

      second_mark = @scores.last.to_s
      if @scores.last.zero?
        second_mark = '-'
      end

      [first_mark, second_mark]
    end
  end
end
