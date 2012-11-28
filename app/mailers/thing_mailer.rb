class ThingMailer < ActionMailer::Base
  default from: "catinfo@raleighnc.gov"

  def reminder(thing)
    @thing = thing
    @user = thing.user
    mail(
      {
        to: thing.user.email,
        subject: ["Remember to keep your bus shelter tidy!", thing.name].compact.join(' '),
      }
    )
  end
end
