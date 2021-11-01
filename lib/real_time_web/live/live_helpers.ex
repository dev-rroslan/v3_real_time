defmodule RealTimeWeb.LiveHelpers do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  alias RealTime.Accounts

  def live_modal(component, opts) do
    live_component(

      RealTimeWeb.ModalComponent,
      id: :modal,
      component: component,
      return_to: Keyword.fetch!(opts, :return_to),
      opts: opts
    )
  end

  def assign_current_user(socket, session) do
    assign_new(
      socket,
      :current_user,
      fn ->
        Accounts.get_user_by_session_token(session["user_token"])
      end
    )
  end
end
