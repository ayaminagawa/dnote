class CreateFoodInfos < ActiveRecord::Migration
  def change
    create_table :food_infos do |t|
      t.integer :item_no
      t.string :name
      t.float :disposal_rate
      t.float :energy
      t.float :energy_juel
      t.float :water
      t.float :protein
      t.float :protein_with_amino
      t.float :fat
      t.float :triacylglycerol
      t.float :carbohydrate
      t.float :ash
      t.float :na
      t.float :k
      t.float :ca
      t.float :mg
      t.float :p
      t.float :fe
      t.float :zn
      t.float :cu
      t.float :mn
      t.float :i
      t.float :se
      t.float :cr
      t.float :mo
      t.float :retinol
      t.float :alpha_carotene
      t.float :beta_carotene
      t.float :beta_cryptoxanthin
      t.float :beta_carotene_equivalents
      t.float :retinol_equivalents
      t.float :vitamin_d
      t.float :alpha_tocopherol
      t.float :beta_tocopherol
      t.float :gammma_tocopherol
      t.float :delta_tocopherol
      t.float :vitamin_k
      t.float :vitamin_b1
      t.float :vitamin_b2
      t.float :niacin
      t.float :vitamin_b6
      t.float :vitamin_b12
      t.float :folic_acid
      t.float :pantothenic_acid
      t.float :biotin
      t.float :vitamin_c
      t.float :saturated_fatty_acid
      t.float :monounsaturated_fatty_acid
      t.float :polyunsaturated_fatty_acid
      t.float :cholesterol
      t.float :soluble_dietary_fiber
      t.float :insoluble_dietary_fiber
      t.float :dietary_fiber
      t.float :salt_equivalents
      t.float :weight_change_rate

      t.timestamps
    end
  end
end
