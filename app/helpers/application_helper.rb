# A specific form builder to deal with filtering attributes out based on parameters
class StrongParametersFormBuilder < SimpleForm::FormBuilder
  def input(attribute_name, *args, &block)
    display_filter = self.options[:display_only]

    if display_filter
      super if display_filter.include?(attribute_name)
    else
      super
    end
  end
end

module ApplicationHelper
  # Form Helper to be used
  def strong_parameters_form_for(object, options = {}, &block)
    simple_form_for(object, options.merge(:builder => StrongParametersFormBuilder), &block)
  end
end
