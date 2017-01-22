require 'rails_helper'
describe 'Routing' do
  describe 'Funeral' do
    it {should route(:get, 'funerals').to(controller: "funerals", action: :index)}
    it {should route(:get, 'funerals/new').to(controller: "funerals", action: :new)}
    it {should route(:post, 'funerals').to(controller: "funerals", action: :create)}
    it {should route(:delete, 'funerals/:id').to(controller: "funerals", action: :destroy, id:":id")}
    it {should route(:get, 'funerals/:date').to(controller: "funerals", action: :day, date:":date")}
  end
end
