defmodule BookReviewApp.Cache do
  @cache_name :my_cache

  def start_link(_) do
    Cachex.start_link(@cache_name, [])
  end

  def fetch(key) do
    Cachex.get(@cache_name, key)
  end

  def put(key, value) do
    Cachex.put(@cache_name, key, value)
  end

  def delete(key) do
    Cachex.del(@cache_name, key)
  end
end
