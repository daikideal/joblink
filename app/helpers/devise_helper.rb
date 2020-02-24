# frozen_string_literal: true

module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    html = '<div class="row">
              <div class="card-panel red white-text">
                <div class="valign-wrapper">
                  <div class="col s2">
                    <div class="center">
                      <i class="material-icons medium">error_outline</i>
                    </div>
                  </div>
                  <div class="col s10">
                    <ul>
            '
    resource.errors.full_messages.each do |message|
      html += "<li>#{message}</li>"
    end
    html += '       </ul>
                  </div>
                </div>
              </div>
            </div>
            '
    html.html_safe
  end
end
