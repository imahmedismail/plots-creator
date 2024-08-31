defmodule PlotsCreatorWeb.Plugs.CurrentUser do
  import Plug.Conn

  alias PlotsCreator.Accounts

  def assign_current_user(conn, _opts) do
    user_token = get_session(conn, :user_token)

    user =
      if user_token do
        Accounts.get_user_by_session_token(user_token)
      else
        nil
      end

    assign(conn, :current_user, user)
  end
end
