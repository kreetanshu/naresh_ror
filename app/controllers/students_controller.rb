class StudentsController < ApplicationController

	def welcome
     @var = 6
    end

    def second
     @var = 6
     @var2 = params[:id].to_i + 4
     #<!--<%= link_to "Pass Link", {:controller => 'tests' , :action => 'calc' , :id => 4 } %> | -->
    end
   
   def index
    
   	@stud = Student.all.order(created_at: :desc).where(:user_id => current_user.id)

   end


   def show
    @row = Student.find(params[:id])
   end

    def new
	 # @stud = Student.new
		#@category = Category.all
    @stud = current_user.students.build
    end

    def create
      #@stud = Student.new(test_params)
      
    @stud = current_user.students.build(test_params)
      
		if @stud.save
			#render :action => :index
			redirect_to students_path
      flash.now[:info] = "Here are your all records from DB"

		else
			render "new"
		end
    end

     def edit
       @stud = Student.find(params[:id])
     end

     def update
    @stud = Student.find(params[:id])

    if @stud.update_attributes(test_params)
      redirect_to root_path, :notice => "The Post is updated"

    else
      render "edit"
    end
    end


    def destroy
    @stud = Student.find(params[:id])
    @stud.destroy
    redirect_to students_path, :notice => "The Post is deleted"

    end
 # Code to actiate or deactivate a student
    def changestatus
     @stud = Student.find(params[:stid])
     if @stud.status == "Active"
       @stud.status= "Inactive"
       @stud.save
       redirect_to root_path
     else
       @stud.status= "Active"
       @stud.save
       redirect_to root_path
     end
    end

  private
  def test_params
      params.require(:student).permit(:id,:name,:age,:dob,:above18,:desc,:department_id)
  end

end
