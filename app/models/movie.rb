class Movie < ActiveRecord::Base
    has_many :reviews

    def average_score
        if self.reviews.count > 0
            # sum = 0
            # num_score = 0


            # self.reviews.each do | review |
            #     if review.score
            #         sum += review.score
            #         num_score += 1
            #     end
            # end


            # sum/(num_scores.to_f) #this divides the sum of the scores by the number of scores there are

            self.reviews.where.not(score: nil).average("score")
        else
            "This Movie hasn't been scored yet"
        end
    end     
end #end class movie
