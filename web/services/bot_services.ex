defmodule Cielito.BotServices do
  def number_normalizer(number, phone_number) do
    case number do
      "" -> number = phone_number
      :else -> phone_number = number
    end
  end
end
