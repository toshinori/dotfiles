# pとかの代わり、apで見やすい形式で出力される
require 'awesome_print'

# http://labs.timedia.co.jp/2011/12/rubyist-should-use-pry.html
# シェルコマンドのprifix
Pry.config.command_prefix = "%"

# Rubyのバージョンをプロンプトに表示
Pry.config.prompt = [
  proc {|target_self, nest_level, pry|
    nested = (nest_level.zero?) ? '' : ":#{nest_level}"
    "[#{pry.input_array.size}] #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}(#{Pry.view_clip(target_self)})#{nested}> "
  },
  proc {|target_self, nest_level, pry|
    nested = (nest_level.zero?) ?  '' : ":#{nest_level}"
    "[#{pry.input_array.size}] #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}(#{Pry.view_clip(target_self)})#{nested}* "
  }
]
