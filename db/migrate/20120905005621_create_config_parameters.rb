class CreateConfigParameters < ActiveRecord::Migration
  def change
    create_table :config_parameters do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
