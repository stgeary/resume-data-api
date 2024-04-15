require "test_helper"

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  test "create experience" do
    student = students(:one)
    assert_difference('Experience.count') do
      post experiences_url, params: { experience: { start_date: Date.today, end_date: Date.today + 5.days, job_title: "Worker", company_name: "A place you work", details: "whatever", student_id: student.id } }
    end
    assert_response :redirect
  end

  test "update experience" do
    student = students(:one) # Assuming you have a fixture or a set up student
    experience = Experience.create(start_date: Date.today, end_date: Date.today + 5.days, job_title: "Old Job", company_name: "Old Company", details: "Old details", student_id: student.id)

    patch experience_url(experience), params: { experience: { job_title: "Updated Worker", company_name: "Updated A place you work", details: "Updated whatever" } }
    assert_redirected_to experience_path(experience) # Assuming you have a show or index to redirect to

    experience.reload
    assert_equal "Updated Worker", experience.job_title
  end

end
