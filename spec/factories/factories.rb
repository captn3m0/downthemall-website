# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :article do
    translations { FactoryGirl.build_list(:article_translation, 1) }
  end

  factory :article_with_no_translations, :class => :article do
    translations { Array.new }
  end

  factory :sticky_article, :parent => :article do
    sticky true
  end

  factory :article_with_image, :parent => :article do
    images { FactoryGirl.build_list(:article_image, 1) }
  end

  factory :article_translation do
    locale            "en"
    sequence(:title)  { |n| "Article #{n}" }
    content           "That's some content"
  end

  factory :article_image do
    shortcode  "mozilla"
    image      File.open(File.join(Rails.root, 'spec/acceptance/files/image.png'))
  end

  factory :comment do
    content "What's up?"
    skip_textcaptcha true
  end

  factory :anonymous_comment, :parent => :comment do
    author_name "Author"
    author_email "author@email.com"
  end

  factory :user do
    sequence(:email)  { |n| "email_#{n}@gmail.com" }
    password "test123"
  end

  factory :admin, :parent => :user do
    admin true
  end

end
