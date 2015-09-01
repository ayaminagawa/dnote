ActiveAdmin.register FoodInfo do

  csv :force_quotes => false do
    FoodInfo.column_names.each do |col|
      column col.to_sym
    end
  end

  active_admin_importable do |model, hash|
    arg = {}
    FoodInfo.column_names.each do |col|
      col_sym =  col.to_sym
      col = col.gsub('_id', '')
      col_sym_for_hash =  col.to_sym
      if hash[col_sym_for_hash]
        arg[col_sym] = hash[col_sym_for_hash].force_encoding("UTF-8")
      else
        arg[col_sym] = hash[col_sym_for_hash]
      end
    end
    model.create(arg)
  end


end
