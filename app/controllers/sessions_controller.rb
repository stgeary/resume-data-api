class SessionsController < ApplicationController
  def create
    student = Student.find_by(email: params[:email])
    if student && student.authenticate(params[:password])
      jwt = JWT.encode(
        { student_id: student.id, exp: 24.hours.from_now.to_i },
        Rails.application.credentials.fetch(:secret_key_base),
        "HS256"
      )
      full_name = "#{student.first_name} #{student.last_name}" # Concatenate first and last names
      render json: { full_name: full_name, jwt: jwt, email: student.email, student_id: student.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
