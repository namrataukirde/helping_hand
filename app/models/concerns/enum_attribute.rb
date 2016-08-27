module EnumAttribute
  def enumerize(attr_name)
    class_eval do
      constant_mapping = send(attr_name.to_s.pluralize)

      define_method("#{attr_name}_value") do
        constant_mapping[send(attr_name)]
      end

      define_singleton_method("#{attr_name}_collection") do
        constant_mapping.each_with_object([]) { |(name, _), acc| acc << [name.capitalize, name] }
      end
    end
  end
end
