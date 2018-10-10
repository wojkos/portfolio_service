#helpers for pages
module PagesHelper
  def twitter_parser tweet
    tweet = link_parser(tweet)
    hash_parser(tweet)
  end

  def link_parser(tweet)
    regex = %r{
      \b
      (
        (?: [a-z][\w-]+:
         (?: /{1,3} | [a-z0-9%] ) |
          www\d{0,3}[.] |
          [a-z0-9.\-]+[.][a-z]{2,4}/
        )
        (?:
         [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
        )+
        (?:
          \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
          [^\s`!()\[\]{};:'".,<>?«»“”‘’]
        )
      )
    }ix

    tweet.gsub(regex) do |url|
      "<a href='#{url}' target='_blank'>#{url}</a>"
    end
  end

  def hash_parser(tweet)
    hash_regex = %r{@[a-zA-Z0-9]+}

    tweet.gsub(hash_regex) do |hash|
      "<b>#{hash}</b>"
    end.html_safe
  end
end
