class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(request)
    @default || request[:headers]['Accept'].include?("application/vnd.marketplace.v#{@version}")
  end
end

# const_1 = ApiConstraints.new(version: 1)
# const_2 = ApiConstraints.new(version: 2, default: true)
# request = { host: 'api.marketplace.dev', headers: { "Accept" => 'application/vnd.marketplace.v1' }}
# print const_1.matches?(request)
