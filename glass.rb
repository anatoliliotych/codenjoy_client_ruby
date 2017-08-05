# encoding: utf-8

class Glass

  attr_reader :state

  # Glass state is initalized with empty cells.
  # Glass cell can be busy('*' - star) or empty(' ' - space)
  def initialize
    @state = prepare_glass_data(' '*25)
  end

  # update Glass state
  def update_state(raw_glass)
    @state = prepare_glass_data(raw_glass)
  end

  # prepare glass data
  def prepare_glass_data(raw_glass)
    res = []
    raw_glass.split('').each_slice(5) { |e| res << e }
    res
  end

  # printing glass state to output
  def print_glass
    @state.reverse.each { |r| puts r.join.gsub!(' ', '_').to_s }
  end
end
