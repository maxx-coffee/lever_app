ActiveAdmin.register TweetQueue do
  form do |f|
      f.inputs "Twitter Api" do
        f.input :token
        f.input :secret
      end
      f.inputs "Times" do
        f.input :start_time 
        f.input :end_time 
      end
      f.buttons
    end

   
end
