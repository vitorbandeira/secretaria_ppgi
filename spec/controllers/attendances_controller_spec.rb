require 'rails_helper'
RSpec.feature AttendancesController , type: :controller do

    let(:valid_attributes) {
      {title:"Teste" ,content:"Tes"}
    }
    let(:valid_session) { {} }

    #Página de criar uma attendance
    describe "GET #new" do
        it "returns a success response" do
            get :new
            expect(response).to have_http_status(:success)
        end
    end
    #Deletar uma attendance
    describe "DELETE #destroy" do
        it "destroys the requested datas" do
            attendance = Attendance.create! valid_attributes
        expect {
            delete :destroy, params: {id: attendance.to_param}, session: valid_session
        }.to change(Attendance, :count).by(-1)
        end

        it "redirects to the attendances list" do
        attendance = Attendance.create! valid_attributes
        delete :destroy, params: {id: attendance.to_param}, session: valid_session
        expect(response).to redirect_to(attendances_url)
        
        end
    end
end