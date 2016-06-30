class Simulation < ActiveRecord::Base
  SOCIAL_STRATEGIES = ['popularity'].freeze
  SEARCH_STRATEGIES = %w(popularity similarity).freeze

  has_many :users, class_name: 'SocialUser', dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :content, class_name: 'Content', dependent: :destroy

  accepts_nested_attributes_for :users

  class << self
    def simulate(simulation_params)
      simulation = Simulation.create
      tags = create_tags(simulation, simulation_params.fetch('tags_attributes').fetch('quantity').to_i)
      create_users(simulation, tags, simulation_params)
      simulation
    end

    private

    def create_users(simulation, tags, simulation_params)
      simulation_params.fetch('users_attributes').each do |_, config|
        config.fetch('quantity').to_i.times do
          simulation.users.build(
            name: FFaker::Name.name,
            role: config.fetch('role'),
            simulation_id: simulation.id,
            search_strategy: "#{config.fetch('search_strategy').capitalize}SearchStrategy".constantize,
            social_strategy: "#{config.fetch('social_strategy').capitalize}SocialStrategy".constantize,
            tags: append_tags(tags, simulation_params.fetch('tags_attributes'))
          )
        end
      end
    end

    def append_tags(tags, tags_attributes)
      gaussian = Rubystats::NormalDistribution.new(
        tags_attributes.fetch('avg').to_f,
        tags_attributes.fetch('stddev').to_f)
      sample_value = [1, gaussian.rng.ceil.abs].max
      tags.sample(sample_value)
    end

    def create_tags(simulation, quantity)
      tags = []
      quantity.times do
        tags << simulation.tags.build(tag: Tag.random)
      end
      tags
    end
  end
end
