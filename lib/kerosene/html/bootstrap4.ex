defmodule Kerosene.HTML.Bootstrap4 do
  use PhoenixHTMLHelpers

  def generate_links(page_list, additional_class) do
    content_tag :nav do
      content_tag :ul, class: build_html_class(additional_class) do
        for {label, _page, url, current} <- page_list do
          content_tag :li, class: build_html_class(current) do
            link("#{label}", to: url, class: "page-link")
          end
        end
      end
    end
  end

  defp build_html_class(true), do: "page-item active"
  defp build_html_class(false), do: "page-item"

  defp build_html_class(additional_class) do
    String.trim("pagination #{additional_class}")
  end
end
