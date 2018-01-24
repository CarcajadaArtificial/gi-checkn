class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :answer
      t.references :question
      t.references :ticket

      t.timestamps
    end
  end
end
