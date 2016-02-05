require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:new_user_attributes) do
    {
        name: "PunkBloccers",
        email: "blochead@bloc.io",
        password: "punkblocheads",
        password_confirmation: "punkblocheads"
    }
    end
end
