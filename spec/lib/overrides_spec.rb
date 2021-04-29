# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overriden is the same
# as the expected. If this test fails, it means that the overriden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-core",
    files: {
      # layouts
      "/app/views/decidim/devise/shared/_omniauth_buttons.html.erb" => "f4c15207534f0b170b420a102f72cc35",
      "/app/assets/javascripts/decidim/floating_help.js.es6" => "d4e1add439a982df133a92e7293b41a8",
      "/app/views/layouts/decidim/_main_footer.html.erb" => "aa621b251a3b7f22c670eb98e1a77105",
      "/app/views/layouts/decidim/_mini_footer.html.erb" => "a542cf5dcbff8c33f5a5098a06f1ac2b",
      "/app/views/layouts/decidim/mailer.html.erb" => "5bbe335c1dfd02f8448af287328a49dc",
      # validators
      "/app/validators/etiquette_validator.rb" => "ef21db526e4bec7cc574777937214cc1"
    }
  }
]

describe "Overriden files", type: :view do
  checksums.each do |item|
    # rubocop:disable Rails/DynamicFindBy
    spec = ::Gem::Specification.find_by_name(item[:package])
    # rubocop:enable Rails/DynamicFindBy
    item[:files].each do |file, signature|
      it "#{spec.gem_dir}#{file} matches checksum" do
        expect(md5("#{spec.gem_dir}#{file}")).to eq(signature)
      end
    end
  end

  private

  def md5(file)
    Digest::MD5.hexdigest(File.read(file))
  end
end
