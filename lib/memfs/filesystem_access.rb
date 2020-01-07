# frozen_string_literal: true

module MemFs
  module FilesystemAccess
    private

    def fs
      FileSystem.instance
    end
  end
end
