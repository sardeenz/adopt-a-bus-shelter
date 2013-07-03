class ThingMailer < ActionMailer::Base
  default from: "catinfo@raleighnc.gov"
  
  def adopted(thing) #sent to adoptor
    @thing = thing
    @user = thing.user
    mail(
      {
        to: thing.user.email,
        subject: ["Thanks for adopting", thing.name].compact.join(' '),
      }
    )

  end
  
  def adopted_alert(thing) #alert sent to admin
    @thing = thing
    @user = thing.user
    mail(
      {
        to: "chad.foley@raleighnc.gov",    #to: "catinfo@raleighnc.gov",
        subject: ["Shelter Adopted:", thing.name].compact.join(' '),
      }
    )
  end 
  
  def abandoned_alert(thing, user)
    @thing = thing
    @user = user
    mail(
      {
        to: "chad.foley@raleighnc.gov",    #to: "catinfo@raleighnc.gov",
        subject: ["Shelter Abandoned:", thing.name].compact.join(' '),
      }
    )
  end 
   
  def reminder(thing)
    @thing = thing
    @user = thing.user
    mail(
      {
        to: thing.user.email,
        subject: ["Remember to clean your shelter:", thing.name].compact.join(' '),
      }
    )
  end
end
