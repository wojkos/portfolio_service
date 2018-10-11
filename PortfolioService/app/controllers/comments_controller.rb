class CommentsController < ApplicationController
    def create
        @comment = current_user.comments.build(coment_params)
    end

    private

    def coment_params
        params.require(:comment).permit(:content)
    end
end