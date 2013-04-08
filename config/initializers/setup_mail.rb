
  ActionMailer::Base.smtp_settings = {  
      :address              => "smtp.gmail.com",  
      :port                 => 587,  
      :domain               => "CLAUSapp.com",  
      :user_name            => "xfinger@gmail.com",  
      :password             => "nextfinger",  
      :authentication       => "plain",  
      :enable_starttls_auto => true  
    }
    
