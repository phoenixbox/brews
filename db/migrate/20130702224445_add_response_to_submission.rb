class AddResponseToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :response, :string
  end
end
