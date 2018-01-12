module EasyTable
  module Components
    module ColumnsCustom
      def column(title, label_or_opts = nil, opts = {}, &block)
        if @options[:model]
          label_or_opts ||= {}
          label_or_opts.merge!({model: @options[:model]})
        end

        if @options[:scope]
          label_or_opts ||= {}
          label_or_opts.merge!({scope: @options[:scope]})
        end

        super(title, label_or_opts, opts, &block)
      end
    end

    module BaseCustom
      def translate(key)
        if @opts[:model]
          @opts[:model].human_attribute_name(@title)
        elsif @opts[:scope]
          I18n.t("easy_table.#{@opts[:scope]}.#{@title}")
        else
          super(key)
        end
      end
    end
  end
end

EasyTable::Components::Columns.prepend(EasyTable::Components::ColumnsCustom)
EasyTable::Components::Base.prepend(EasyTable::Components::BaseCustom)

