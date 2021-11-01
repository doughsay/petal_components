defmodule Petal.Alert do
  use Phoenix.Component

  def alert(assigns) do
    ~H"""
    <alert class={alert_classes(assigns)}>
      <%= if assigns[:inner_block] do %>
        <%= render_slot(@inner_block) %>
      <% else %>
        <%= @label %>
      <% end %>
        <%= @label %>
    </alert>
    """
  end

  def alert_classes(opts \\ %{}) do
    opts = %{
      size: opts[:size] || "xl",
      state: opts[:state] || "info",
      icon: opts[:icon] || false
    }

    size_css =
      case opts[:size] do
        "xs" -> "text-xs leading-4 px-2.5 py-1"
        "sm" -> "text-sm leading-4 px-2.5 py-1"
        "md" -> "text-sm leading-5 px-4 py-2"
        "lg" -> "text-base leading-6 px-4 py-2"
        "xl" -> "text-base leading-6 px-6 py-3"
      end

    icon_css =
      if opts[:icon] do
        "flex gap-2 items-center whitespace-nowrap"
      else
        ""
      end

    state_css = get_state_classes(opts)

    """
      #{state_css}
      #{size_css}
      #{icon_css}
      font-medium
      rounded-xl
      inline-flex items-center justify-start
      focus:outline-none
    """
  end

  def get_state_classes(%{state: "info"}) do
    "w-full text-primary-500 bg-primary-100"
  end

  def get_state_classes(%{state: "success"}) do
    "w-full text-green-600 bg-green-100"
  end

  def get_state_classes(%{state: "warning"}) do
    "w-full text-yellow-600 bg-yellow-100"
  end

  def get_state_classes(%{state: "danger"}) do
    "w-full text-red-600 bg-red-100"
  end
end