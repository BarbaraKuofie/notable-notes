class API::V1::NotesController < ApplicationController
    before_action :find_note, only: [:update, :destroy, :show]

    def index
        notes = Note.all 
        render json: notes, include: :owner
    end 

    def show 
        render json: note 
    end 

    def edit
 
    end

    def update
        note = Note.find(params[:id])
        note.update(note_params)
        if note.valid?
            note.save 
            render json: note, status: :accepted
         else
             render json: { errors: note.errors.full_messages }, status: :unprocessible_entity
         end
    end  



    def create 
        note = Note.create(note_params)
        if note.valid?
            # render json: { note: NoteSerializer.new(note) }, status: :created 
            render json: note 
        else 
            render json: note.errors.full_messages
        end 
    end 

    def destroy
        note = Note.find(params[:id])
        note.destroy

        render json: note 
    end 

    private 
    def find_note
        note = Note.find(params[:id])
    end

    def note_params
        params.require(:note).permit(:title, :content, :owner, :icon, :helpful, :unhelpful, :user_id, :id)
    end 

end
