# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['SENDGRID_USERNAME'] = "chfoley"
ENV['SENDGRID_PASSWORD'] = "red5five"
ENV['SENDGRID_DOMAIN'] = "raleighnc.gov"
ENV['SECRET_TOKEN'] = "28afa74614f8611584050de787ee9ce5c57d79b3221182b3dfbec9a3c77006d963b2a8a7ad02cf0f8b527156ac9b687db078a3c725421c1ce025fddde357fc68"

# Initialize the rails application
AdoptAThing::Application.initialize!
