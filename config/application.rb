require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsForAzureWebapps
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # semantic_loggerの設定
    # JSON形式で出力する
    config.rails_semantic_logger.format = :json
    config.semantic_logger.add_appender(file_name: File.join("log", "#{Rails.env}.json"), formatter: :json)

    # 入力フォームのバリデーションエラーのときに挿入されるタグをカスタマイズする
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| content_tag :span, html_tag, class: "my_field_with_errors" }
  end
end
