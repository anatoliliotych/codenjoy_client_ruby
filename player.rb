class Player

  attr_reader :glass
  DATA_PARAMS = { 'board' => 0 }
  def initialize
    @glass = Glass.new
    self
  end

  # process data for each event from tetris-server
  def process(data)
    raw_glass = data_to_params(data)
    @glass.update_state(raw_glass)
  end

  def step
    # print glass state
    @glass.print_glass

    'left'
  end

  # This method is used for processing event from tetris-server to params for client
  def data_to_params(data)
    raise 'No data to prepare params' unless data
    res = []
    DATA_PARAMS.each do |k, v|
      res << data.split('&')[v].gsub!("#{k}=", '')
    end
    res.first
  end
  private :data_to_params
end
