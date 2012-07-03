ActiveAdmin.register TweetQueue do
  form do |f|
      f.inputs "Twitter Api" do
        f.input :token
        f.input :secret
      end
      f.inputs "Times" do
        f.input :start_time , :ampm => true
        f.input :end_time ,  :ampm => true
      end
      f.inputs "Timezone" do
      	f.input :timezone, :as => :time_zone
      end
      f.buttons
    end




end
