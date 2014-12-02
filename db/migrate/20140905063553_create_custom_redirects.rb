class CreateCustomRedirects < ActiveRecord::Migration
  def change
    create_table :custom_redirects do |t|

      t.timestamps
    end
  end
end
