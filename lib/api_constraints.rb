class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(request)
    @version || request[:headers]['Accept'].include?("application/vnd.marketplace.v#{@version}")
  end
end

const_1 = ApiConstraints.new(version: 1)
const_2 = ApiConstraints.new(version: 2, default: true)
request = { host: 'api.marketplace.dev' }
print const_1.matches?(request)
