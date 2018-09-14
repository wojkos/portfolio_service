class AddTopicReferenceToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :topic, foregin_key: true
  end
end
