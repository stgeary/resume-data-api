require "test_helper"

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  test "create experience" do
    @student = Student.first
    assert_difference('Experience.count') do
      post experiences_url, params: { experience: { start_date: Date.today, end_date: Date.today + 5.days, job_title: "Worker", company_name: "A place you work", details: "whatever", student_id: @student.id } }
    end
    assert_response :redirect
  end
  test "update experience" do
    experience = Experience.find_by[id: params[1]]
    experience.update(start_date: "%Y%m%d", end_date: "%Y%m%d", job_title: "Worker", company_name: "A place you work", details: "whatever", student_id: Student.first.id)
  end
end
