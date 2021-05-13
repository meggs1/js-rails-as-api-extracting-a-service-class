# Once a new class and file are created this way, you'll need to restart the Rails
# server if it is running in order for `SightingSerializer` to be recognized
# and available in places like `SightingsController`.
class SightingSerializer

    def initialize(sighting_object)
        @sighting = sighting_object
    end

    def to_serialized_json
        @sighting.to_json(:include => {
          :bird => {:only => [:name, :species]},
          :location => {:only => [:latitude, :longitude]}
        }, :except => [:updated_at])
    end
end