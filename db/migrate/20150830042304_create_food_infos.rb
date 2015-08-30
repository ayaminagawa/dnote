class CreateFoodInfos < ActiveRecord::Migration
  def change
    create_table :food_infos do |t|
      t.string :item_no
      t.string :name
      t.string :disposal_rate
      t.string :energy
      t.string :water
      t.string :protein
      t.string :protein_with_amino
      t.string :fat
      t.string :triacylglycerol
      t.string :carbohydrate
      t.string :ash
      t.string :na
      t.string :k
      t.string :ca
      t.string :mg
      t.string :p
      t.string :fe
      t.string :zn
      t.string :cu
      t.string :mn
      t.string :i
      t.string :se
      t.string :cr
      t.string :mo
      t.string :retinol
      t.string :alpha_carotene
      t.string :beta_carotene
      t.string :beta_cryptoxanthin
      t.string :beta_carotene_equivalents
      t.string :retinol_equivalents
      t.string :vitamin_d
      t.string :alpha_tocopherol
      t.string :beta_tocopherol
      t.string :gammma_tocopherol
      t.string :delta_tocopherol
      t.string :vitamin_k
      t.string :vitamin_b1
      t.string :vitamin_b2
      t.string :niacin
      t.string :vitamin_b6
      t.string :vitamin_b12
      t.string :folic_acid
      t.string :pantothenic_acid
      t.string :biotin
      t.string :vitamin_c
      t.string :saturated_fatty_acid
      t.string :monounsaturated_fatty_acid
      t.string :polyunsaturated_fatty_acid
      t.string :cholesterol
      t.string :soluble_dietary_fiber
      t.string :insoluble_dietary_fiber
      t.string :dietary_fiber
      t.string :salt_equivalents
      t.string :weight_change_rate

      t.timestamps
    end
  end
end
