class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      #get
      define_method(name) do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |set_value|
        instance_variable_set("@#{name}", set_value)
      end
    end
  end
end
