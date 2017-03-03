Rails.configuration.stripe = {
  :publishable_key => 'pk_test_RyPneux0Qn2tm3kwj1ukZtkI',
  :secret_key      => 'sk_test_Jrs9e4njyqo9y92mEJx4YCrS'
}


Stripe.api_key = Rails.configuration.stripe[:secret_key]
