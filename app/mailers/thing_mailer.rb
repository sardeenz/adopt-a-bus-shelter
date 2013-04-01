class ThingMailer < ActionMailer::Base
  default from: "catinfo@raleighnc.gov"
  
  def adopted(thing)
    @thing = thing
    @user = thing.user
    mail(
      {
        to: thing.user.email,
        subject: ["Thanks for adopting", thing.name].compact.join(' '),
      }
    )

  end
  
  def adopted_alert(thing)
    @thing = thing
    @user = thing.user
    mail(
      {
        to: thing.user.email,
        subject: ["Thanks for adopting", thing.name].compact.join(' '),
      }
    )
  end 
  
  def abandoned(thing)
    @thing = thing
    @user = thing.user
    mail(
      {
        to: thing.user.email,
        subject: ["Thanks for adopting", thing.name].compact.join(' '),
      }
    )

  end
  
  def abandoned_alert(thing)
    @thing = thing
    @user = thing.user
    mail(
      {
        to: thing.user.email,
        subject: ["Thanks for adopting", thing.name].compact.join(' '),
      }
    )
  end 
   
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
