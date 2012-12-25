class LogsController < ApplicationController
  def hello
    return render(partial: "logs/hello") if request.headers["X-PJAX"]
  end

  def index
    return render(partial: "logs/index") if request.headers["X-PJAX"]
  end

  def show
    @logs = Log.one_day "#{params[:year]}-#{params[:month]}-#{params[:day]}"
    return render(partial: "logs/show") if request.headers["X-PJAX"]
  end

  def new 
  end
end
