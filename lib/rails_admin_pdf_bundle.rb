require 'rails_admin_pdf_bundle/engine'

module RailsAdminPdfBundle
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class PdfBundle < Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :collection? do
          true
        end

        register_instance_option :bulkable? do
          true
        end

        register_instance_option :link_icon do
          'icon-file'
        end

        register_instance_option :http_methods do
          [:get, :post]
        end

        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :pdf_bundle)
            if format = params[:pdf] && :pdf
              request.format = format

              model = @model_config.abstract_model.model
              report_model_name = "#{model.to_s.demodulize}Report"
              report = report_model_name.constantize.new

              send_data report.to_pdf(@objects),
                filename: report.filename,
                type: 'application/pdf',
                disposition: 'attachment'
            else
              render @action.template_name
            end
          end
        end
      end
    end
  end
end
