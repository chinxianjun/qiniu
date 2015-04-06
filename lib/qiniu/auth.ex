defmodule Qiniu.Auth do
  @moduledoc """
  Module about authorization
  """

  alias Qiniu.PutPolicy

  @doc """
  Generate token for uploading, which can be used in client or just server.

  ## Examples

      policy = Qiniu.PutPolicy.build("scope")
      uptoken = Qiniu.Auth.generate_uptoken(policy)
  """
  @spec generate_uptoken(Qiniu.PutPolicy.t) :: String.t
  def generate_uptoken(%PutPolicy{} = put_policy) do
    [access_key: access_key, secret_key: secret_key] =
      Keyword.take(Qiniu.config, [:access_key, :secret_key])

    encoded_put_policy = PutPolicy.encoded_json put_policy
    encoded_sign = hex_digest(secret_key, encoded_put_policy)

    "#{access_key}:#{encoded_sign}:#{encoded_put_policy}"
  end

  @doc false
  def hex_digest(key, data) when is_binary(key) and is_binary(data) do
    :crypto.hmac(:sha, key, data) |> Base.url_encode64
  end
end
