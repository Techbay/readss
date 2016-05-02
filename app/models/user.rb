class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def add_reward(change=0)
    self.reward += change
  end
  
  def subtract_reward(change=0)
    self.reward = [0, self.reward - change].max
  end
end
