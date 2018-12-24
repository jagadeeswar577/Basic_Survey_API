class SurveysAPI < Grape::API
    desc 'Get all surveys',
         success: Entities::Survey,
         is_array: true
    get "surveys" do
      surveys = Survey.all.order('created_at desc')
      present surveys, with: Entities::Survey
    end


    desc "Create a question for survey",
         success: Entities::Survey
    params do
      requires :name, desc: 'Question name',
               documentation: {type: String}
    end
    post 'surveys/:id/create_question' do
      survey = Survey.find_by!(id: params[:id])
      survey.questions.create(name: params[:name])
      present survey, with: Entities::Survey
    end


    desc "Delete a question for survey",
         success: Entities::Survey
    delete 'surveys/:id/delete_question' do
      question = Question.find_by!(id: params[:id])
      question.destroy
      present question, with: Entities::JustId
    end
end

