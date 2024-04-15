class AddForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_column :experiences, :student_id, :int
    add_column :educations, :student_id, :int
    add_column :capstones, :student_id, :int
  end
end
