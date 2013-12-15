class WorkMailer < ActionMailer::Base
  default from: "from@example.com"

  def work_email(work)
    @work = work
    mail(:to => "<#{@work.student.parent.email}>", :subject => "Work ready for pickup")
  end
end
