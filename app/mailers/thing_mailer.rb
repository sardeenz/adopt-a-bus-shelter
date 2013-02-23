class ThingMailer < ActionMailer::Base
  default from: "catinfo@raleighnc.gov"

  def reminder(thing)
    @thing = thing
    @user = thing.user
    mail(
      {
        to: thing.user.email,
        subject: ["Remember to clean your shelter", thing.name].compact.join(' '),
      }
    )
  end
end
