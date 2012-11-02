module SimpleForm
  class FormBuilder < ActionView::Helpers::FormBuilder
    # tried to monkey patch without copy'n'pasting, broke associations
    def input(attribute_name, options={}, &block)
      options = @defaults.deep_dup.deep_merge(options) if @defaults

      chosen =
        if name = options[:wrapper]
          name.respond_to?(:render) ? name : SimpleForm.wrapper(name)
        else
          wrapper
        end

      # here display_filter logic begins
      display_filter = options.delete(:display_only)

      if (! display_filter) || (display_filter && display_filter.include?(attribute_name))
        chosen.render find_input(attribute_name, options, &block)
      end
    end
  end
end

module ApplicationHelper
end
