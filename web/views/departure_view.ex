defmodule MbtaWeb.DepartureView do
  use MbtaWeb.Web, :view
  use Timex

  def current_time do
  	Timex.format!(Timex.now, "%H:%M:%S", :strftime)
  end
end
