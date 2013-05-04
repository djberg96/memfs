require "delegate"

module FsFaker
  module Fake
    class File < Entry

      class Content < SimpleDelegator
        attr_accessor :pos

        def initialize(obj = '')
          @string = obj.to_s.dup
          @pos = 0

          __setobj__ @string
        end

        def to_s
          @string
        end

        def puts(*strings)
          strings.each do |str|
            @string << str
            @string << $/ unless str.end_with?($/)
          end
        end

        def read(length = nil, buffer = '')
          read_end = length ? length - 1 : -1
          buffer.replace @string[@pos..read_end]
          @pos += buffer.bytesize
          buffer.empty? ? nil : buffer
        end

        def close
        end
      end

    end
  end
end
