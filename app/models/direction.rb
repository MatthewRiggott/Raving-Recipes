class Direction < ActiveRecord::Base
  belongs_to :recipe
  # before_validation :insert_new_step, on: [:create, :edit]

  validates :recipe, presence: true
  validates :body, presence: true
  validates :step_number, numericality: { only_integer: true, greater_than: 0}
  validates :step_number, uniqueness: { scope: :recipe }
  # try to validate steps in order

  def self.fix_order_of_steps(recipe)
    recipe.directions.order(step_number: :DESC).each_with_index do |instruction, index|
      instruction.update(step_number: index)
    end
  end

  private

    def insert_new_step
      instructions = self.recipe.directions.order(step_number: :DESC)
      step_count = instructions.count
      if self.step_number <= step_count
        instructions.each do |i|
          i.increment!(:step_number)
          break if (i.step_number - 1) <= self.step_number
        end
      end
    end
end
