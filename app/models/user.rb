class User < ApplicationRecord
  enum role: { learner: 0, mentor: 1 }
end
