module Deployr
  module Configuration
    attr_accessor :result
    attr_reader :data

    def initialize(data)
      @data = data
      @result = []
    end

    def run(*cmd)
      IO.popen(cmd, :err => [:child, :out]) {|io| io.read }.tap do |output|
        @result << output
      end
    end

    def handled?
      ! @result.empty?
    end

    def repository
      data['repository']['name'].to_s
    end

    def branch
      data['ref'].to_s.gsub %r(^refs/heads/), ''
    end

    def revision
      data['after'].to_s
    end

    def comitters
      Array(data['commits']).map {|c| c['author']['email'].to_s }.uniq
    end
  end
end
