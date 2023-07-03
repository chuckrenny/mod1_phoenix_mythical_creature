# Create the Phoenix class here
class Phoenix
    attr_accessor :name, :type_color, :type_mood, :pharaoh

    def initialize(name)
        @name = name
        @type_color = ['golden', 'amber', 'scarlet', 'crimson', 'deep violet']
        @type_mood = ['stoic', 'heated', 'fiery', 'ablaze', 'incandescent']
        @pharaoh = nil
        @count = 0
        @emotion_counter = {}
        @tear = false
    end

    def color
        @type_color[@count]
    end

    def mood
        @type_mood[@count]
    end

    def feels_emotion(emotion)
        @count += 1

        if @emotion_counter[emotion] == 4    # reset if emotion is at 5
            @count = 0
            @emotion_counter = {}

        elsif @emotion_counter[emotion] == 2 # releases tear if its the same emotion on the 3rd time
            @tear = true
            @emotion_counter[emotion] += 1
            
        elsif @emotion_counter[emotion]      #if emotion exists
            @tear = false
            @emotion_counter[emotion] += 1

        else                                 # creates a key-val = 1
            @emotion_counter[emotion] = 1
        end        
    end

    def emotional_awareness
        @emotion_counter
    end

    def releases_tear?
        @tear 
    end
end