class PatientTokenForm
  include ActiveModel::Model

  attr_accessor :token

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Patient')
  end
end