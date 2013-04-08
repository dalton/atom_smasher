# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :atom_smasher_subscription, :class => 'Subscription' do
    reader_id 1
    feed_id 1
  end
end
