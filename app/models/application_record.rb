# ApplicationRecord はモデル操作の既定となるクラス
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
