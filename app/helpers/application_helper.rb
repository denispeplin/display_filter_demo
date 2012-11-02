# A specific form builder to deal with filtering attributes out based on parameters
class StrongParametersFormBuilder < SimpleForm::FormBuilder
  def input(attribute_name, options = {}, &block)
    display_only = options[:display_only]

    super unless display_filter && display_filter.include?(attribute_name)
  end
end

# Form Helper to be used
def strong_parameters_form_for(object, options = {}, &block)
  simple_form_for(object, options.merge(:builder => StrongParametersFormBuilder)), &block)
end

module ApplicationHelper
end
