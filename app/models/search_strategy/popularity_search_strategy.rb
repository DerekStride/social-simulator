class PopularitySearchStrategy < SearchStrategy
  def self.search(_, number_requested)
    Content.all.sort { |piece_0, piece_1|
      piece_1.likes.count <=> piece_0.likes.count
    }.first(number_requested)
  end
end
